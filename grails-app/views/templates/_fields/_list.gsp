<div class="card-body">
    <dl class="row mb-0">
        <g:each in="${domainProperties}" var="p">
            <g:if test="${domainClass.propertyName == 'user'}">
                <g:if test="${p.name == 'password'}"></g:if>
                <g:else>
                    <dt class="col-sm-4"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></dt>
                    <dd class="col-sm-8">${body(p)}</dd>
                </g:else>
            </g:if>
            <g:else>
                <dt class="col-sm-4"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></dt>
                <dd class="col-sm-8">${body(p)}</dd>
            </g:else>
        </g:each>
    </dl>
</div>