<table class="table table-bordered">
    <thead class="thead-dark">
    <tr>
        <g:each in="${domainProperties}" var="p" status="i">
            <g:set var="propTitle">${domainClass.propertyName}.${p.name}.label</g:set>
            <g:sortableColumn property="${p.name}" title="${message(code: propTitle, default: p.naturalName)}" />
        </g:each>
        <th class="action-row"><g:message code="action"/></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${collection}" var="bean" status="i">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <g:each in="${domainProperties}" var="p" status="j">
                <g:if test="${j==0}">
                    <td><g:link method="GET" resource="${bean}"><f:display bean="${bean}" property="${p.name}" displayStyle="${displayStyle?:'table'}" /></g:link></td>
                </g:if>
                <g:else>
                    <td><f:display bean="${bean}" property="${p.name}"  displayStyle="${displayStyle?:'table'}" /></td>
                </g:else>
            </g:each>
            <td>
                <div class="btn-group">
                    <g:link method="GET" resource="${bean}" action="edit" class="btn btn-secondary" id="${bean.id}"><i class="fas fa-edit"></i></g:link>
                    <g:link method="DELETE" resource="${bean}" id="${bean.id}" class="btn btn-secondary delete-confirmation"><i class="fas fa-trash"></i></g:link>
                </div>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>