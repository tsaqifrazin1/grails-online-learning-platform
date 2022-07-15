package com.intern.olp

import grails.core.GrailsDomainClass
import org.grails.validation.DomainClassPropertyComparator
import grails.core.GrailsDomainClassProperty
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
            out << render(template: "/templates/_fields/dropDownColName",
                    model: [domainClass: domainClass, domainProperties: properties, collection: collection, displayStyle: displayStyle])
        }
    }

    private Object resolveBean(beanAttribute) {
        resolvePageScopeVariable(beanAttribute) ?: beanAttribute ?: beanStack.bean
    }

    private resolvePageScopeVariable(attributeName) {
        // Tomcat throws NPE if you query pageScope for null/empty values
        attributeName?.toString() ? pageScope.variables[attributeName] : null
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
            blacklist << 'dateCreated' << 'lastUpdated'
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
}
