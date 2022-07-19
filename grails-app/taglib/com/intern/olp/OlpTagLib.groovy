package com.intern.olp

import grails.core.GrailsDomainClass
import grails.plugin.springsecurity.SpringSecurityService
import grails.util.TypeConvertingMap
import grails.web.mapping.UrlMapping
import org.grails.taglib.TagOutput
import org.grails.taglib.encoder.OutputContextLookupHelper
import org.grails.validation.DomainClassPropertyComparator
import grails.core.GrailsDomainClassProperty
import org.springframework.web.servlet.support.RequestContextUtils

import static grails.util.GrailsClassUtils.getStaticPropertyValue



class OlpTagLib {

    static namespace = "olp"
    static defaultEncodeAs = [taglib:'raw']
    class BeanAndPrefix {
        Object bean
        String prefix
    }
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def table = { attrs, body ->
        def collection = resolveBean(attrs.remove('collection'))
        def domainClass
        if (attrs.containsKey('domainClass')) {
            domainClass = grailsApplication.getDomainClass(attrs.remove('domainClass'))
        } else {
            domainClass = (collection instanceof Collection) && collection ? resolveDomainClass(collection.iterator().next()) : null
        }
        if (domainClass) {
            def properties
            if (attrs.containsKey('properties')) {
                properties = attrs.remove('properties').collect { domainClass.getPropertyByName(it) }
            } else {
                properties = resolvePersistentProperties(domainClass, attrs)
                if (properties.size() > 6) {
                    properties = properties[0..6]
                }
            }
            def displayStyle = attrs.remove('displayStyle')
            out << render(template: "/templates/_fields/table",
                    model: [domainClass: domainClass, domainProperties: properties, collection: collection, displayStyle: displayStyle])
        }
    }

    def dropDownColName =  { attrs, body ->
        def collection = resolveBean(attrs.remove('collection'))
        def blacklist = attrs.except?.tokenize(',')*.trim() ?: []
        def domainClass
        if (attrs.containsKey('domainClass')) {
            domainClass = grailsApplication.getDomainClass(attrs.remove('domainClass'))
        } else {
            domainClass = (collection instanceof Collection) && collection ? resolveDomainClass(collection.iterator().next()) : null
        }
        if (domainClass) {
            def properties
            if (attrs.containsKey('properties')) {
                properties = attrs.remove('properties').collect { domainClass.getPropertyByName(it) }
            } else {
                properties = resolvePersistentProperties(domainClass, attrs)
                if (properties.size() > 6) {
                    properties = properties[0..6]
                }
            }
            properties.removeAll { it.name in blacklist }
            def displayStyle = attrs.remove('displayStyle')
            out << render(template: "/templates/_fields/dropDownColName",
                    model: [domainClass: domainClass, domainProperties: properties, collection: collection, displayStyle: displayStyle])
        }
    }

    def all = { attrs ->
        if (!attrs.bean) throwTagError("Tag [all] is missing required attribute [bean]")
        def bean = resolveBean(attrs.bean)
        println(attrs.prefix)
        if (attrs.prefix != null) {
            def prefix = resolvePrefix(attrs.prefix)
        }
        def domainClass = resolveDomainClass(bean)
        if (domainClass) {
            for (property in resolvePersistentProperties(domainClass, attrs)) {
                out << field(bean: bean, property: property.name, prefix: prefix)
            }
        } else {
            throwTagError('Tag [all] currently only supports domain types')
        }
    }

    private Object resolveBean(beanAttribute) {
        resolvePageScopeVariable(beanAttribute) ?: beanAttribute ?: beanStack.bean
    }

    private resolvePageScopeVariable(attributeName) {
        // Tomcat throws NPE if you query pageScope for null/empty values
        attributeName?.toString() ? pageScope.variables[attributeName] : null
    }

    private String resolvePrefix(prefixAttribute) {
        def prefix = resolvePageScopeVariable(prefixAttribute) ?: prefixAttribute ?: beanStack.prefix
        if (prefix && !prefix.endsWith('.'))
            prefix = prefix + '.'
        prefix ?: ''
    }

    private GrailsDomainClass resolveDomainClass(bean) {
        resolveDomainClass(bean.getClass())
    }

    private GrailsDomainClass resolveDomainClass(Class beanClass) {
        grailsApplication.getDomainClass(beanClass.name)
    }

    private List<GrailsDomainClassProperty> resolvePersistentProperties(GrailsDomainClass domainClass, attrs) {
        def properties

        if(attrs.order) {
            if(attrs.except) {
                throwTagError('The [except] and [order] attributes may not be used together.')
            }
            def orderBy = attrs.order?.tokenize(',')*.trim() ?: []
            properties = orderBy.collect { propertyName -> domainClass.getPersistentProperty(propertyName) }
        } else {
            properties = domainClass.persistentProperties as List
            def blacklist = attrs.except?.tokenize(',')*.trim() ?: []
            blacklist << 'dateCreated' << 'lastUpdated' << 'accountLocked'
            def scaffoldProp = getStaticPropertyValue(domainClass.clazz, 'scaffold')
            if (scaffoldProp) {
                blacklist.addAll(scaffoldProp.exclude)
            }
            properties.removeAll { it.name in blacklist }
            properties.removeAll { !it.domainClass.constrainedProperties[it.name]?.display }
            properties.removeAll { it.derived }

            Collections.sort(properties, new org.grails.validation.DomainClassPropertyComparator(domainClass))
        }
        properties
    }

    def paginate = { Map attrsMap ->
        TypeConvertingMap attrs = (TypeConvertingMap)attrsMap
        def writer = out
        if (attrs.total == null) {
            throwTagError("Tag [paginate] is missing required attribute [total]")
        }

        def messageSource = grailsAttributes.messageSource
        def locale = RequestContextUtils.getLocale(request)

        def total = attrs.int('total') ?: 0
        def offset = params.int('offset') ?: 0
        def max = params.int('max')
        def maxsteps = (attrs.int('maxsteps') ?: 10)

        if (!offset) offset = (attrs.int('offset') ?: 0)
        if (!max) max = (attrs.int('max') ?: 10)

        Map linkParams = [:]
        if (attrs.params instanceof Map) linkParams.putAll((Map)attrs.params)
        linkParams.offset = offset - max
        linkParams.max = max
        if (params.sort) linkParams.sort = params.sort
        if (params.order) linkParams.order = params.order

        Map linkTagAttrs = [:]
        def action
        if (attrs.containsKey('mapping')) {
            linkTagAttrs.mapping = attrs.mapping
            action = attrs.action
        } else {
            action = attrs.action ?: params.action
        }
        if (action) {
            linkTagAttrs.action = action
        }
        if (attrs.controller) {
            linkTagAttrs.controller = attrs.controller
        }
        if (attrs.containsKey(UrlMapping.PLUGIN)) {
            linkTagAttrs.put(UrlMapping.PLUGIN, attrs.get(UrlMapping.PLUGIN))
        }
        if (attrs.containsKey(UrlMapping.NAMESPACE)) {
            linkTagAttrs.put(UrlMapping.NAMESPACE, attrs.get(UrlMapping.NAMESPACE))
        }
        if (attrs.id != null) {
            linkTagAttrs.id = attrs.id
        }
        if (attrs.fragment != null) {
            linkTagAttrs.fragment = attrs.fragment
        }
        linkTagAttrs.params = linkParams

        // determine paging variables
        def steps = maxsteps > 0
        int currentstep = ((offset / max) as int) + 1
        int firststep = 1
        int laststep = Math.round(Math.ceil(total / max)) as int

        // display previous link when not on firststep unless omitPrev is true
        if (currentstep > firststep && !attrs.boolean('omitPrev')) {
            linkTagAttrs.put('class', 'prevLink')
            linkParams.offset = offset - max
            writer << callLink((Map)linkTagAttrs.clone()) {
                (attrs.prev ?: messageSource.getMessage('paginate.prev', null, messageSource.getMessage('default.paginate.prev', null, 'Previous', locale), locale))
            }
        }

        // display steps when steps are enabled and laststep is not firststep
        if (steps && laststep > firststep) {
            linkTagAttrs.put('class', 'step')

            // determine begin and endstep paging variables
            int beginstep = currentstep - (Math.round(maxsteps / 2.0d) as int) + (maxsteps % 2)
            int endstep = currentstep + (Math.round(maxsteps / 2.0d) as int) - 1

            if (beginstep < firststep) {
                beginstep = firststep
                endstep = maxsteps
            }
            if (endstep > laststep) {
                beginstep = laststep - maxsteps + 1
                if (beginstep < firststep) {
                    beginstep = firststep
                }
                endstep = laststep
            }

            // display firststep link when beginstep is not firststep
            if (beginstep > firststep && !attrs.boolean('omitFirst')) {
                linkParams.offset = 0
                writer << callLink((Map)linkTagAttrs.clone()) {firststep.toString()}
            }
            //show a gap if beginstep isn't immediately after firststep, and if were not omitting first or rev
            if (beginstep > firststep+1 && (!attrs.boolean('omitFirst') || !attrs.boolean('omitPrev')) ) {
                writer << '<span class="step gap">..</span>'
            }

            // display paginate steps
            (beginstep..endstep).each { int i ->
                if (currentstep == i) {
                    writer << "<span class=\"currentStep\">${i}</span>"
                }
                else {
                    linkParams.offset = (i - 1) * max
                    writer << callLink((Map)linkTagAttrs.clone()) {i.toString()}
                }
            }

            //show a gap if beginstep isn't immediately before firststep, and if were not omitting first or rev
            if (endstep+1 < laststep && (!attrs.boolean('omitLast') || !attrs.boolean('omitNext'))) {
                writer << '<span class="step gap">..</span>'
            }
            // display laststep link when endstep is not laststep
            if (endstep < laststep && !attrs.boolean('omitLast')) {
                linkParams.offset = (laststep - 1) * max
                writer << callLink((Map)linkTagAttrs.clone()) { laststep.toString() }
            }
        }

        // display next link when not on laststep unless omitNext is true
        if (currentstep < laststep && !attrs.boolean('omitNext')) {
            linkTagAttrs.put('class', 'nextLink')
            linkParams.offset = offset + max
            writer << callLink((Map)linkTagAttrs.clone()) {
                (attrs.next ? attrs.next : messageSource.getMessage('paginate.next', null, messageSource.getMessage('default.paginate.next', null, 'Next', locale), locale))
            }
        }
    }

    private callLink(Map attrs, Object body) {
        TagOutput.captureTagOutput(tagLibraryLookup, 'g', 'link', attrs, body, OutputContextLookupHelper.lookupOutputContext())
    }
}
