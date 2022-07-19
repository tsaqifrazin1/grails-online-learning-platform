<select name="colName" class="form-control" id="colName" onselect=saveValue(this) >
    <tr>
        <g:each in="${domainProperties}" var="p" status="i">
            <g:set var="propTitle">${domainClass.propertyName}.${p.name}.label</g:set>
            <option value="${p.name}"><g:message code="${p.name}.${p.name}" default="${p.naturalName}"/></option>
        </g:each>
<select>

