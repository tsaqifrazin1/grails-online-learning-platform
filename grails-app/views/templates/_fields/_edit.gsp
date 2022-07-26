<g:each in="${domainProperties}" var="p">
    <g:if test="${!p.optional}">
        <div class="form-group row ${p.optional}">
            <label for="${p.name}" class="col-sm-2 col-form-label">${p.naturalName}
                <span class="required-indicator">*</span>
            </label>
                <g:if test="${p.type == boolean}">
                    <g:if test="${bean.getProperty(p.name) == true}">
                        <div class="form-check ml-2 justify-content-center">
                            <input class="form-check-input" type="checkbox" name="${p.name}" id="${p.name}" placeholder="${p.naturalName}" checked>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="form-check ml-2">
                            <input class="form-check-input" type="checkbox" name="${p.name}"  id="${p.name}" placeholder="${p.naturalName}">
                        </div>
                    </g:else>
                </g:if>
                <g:else>
                    <div class="col-sm-10">
                        <input type="${p.name}" name="${p.name}" required value="${raw(bean.getProperty(p.name))}" id="${p.name}" class="form-control"  placeholder="${p.naturalName}">
                    </div>
                </g:else>

        </div>
    </g:if>
    <g:else>
        <div class="form-group row">
            <label for="${p.name}" class="col-sm-2 col-form-label">${p.naturalName}</label>
        <div class="col-sm-10">
            <g:if test="${p.type == boolean}">
                <input type="checkbox" name="${p.name}" value="${raw(bean.getProperty(p.name))}" id="${p.name}" class="form-control"  placeholder="${p.naturalName}">
            </g:if>
            <g:else>
                <input type="${p.name}" name="${p.name}" value="${raw(bean.getProperty(p.name))}" id="${p.name}" class="form-control"  placeholder="${p.naturalName}">
            </g:else>
        </div>
        </div>
    </g:else>
</g:each>
