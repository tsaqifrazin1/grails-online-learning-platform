<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="card">
    <div class="card-header">
        <g:message code="user" args="['List Of']"/>
        <span class="float-right">
            <div class="btn-group">
                <g:form controller="user" action="index" method="GET" name="se">
                    <div class="input-group" id="search-area">
                        <g:select name="colName" class="form-control" from="[id: 'Id', email: 'Email', fullname: 'Fullname', experience: 'Experience', city: 'City', enabled: 'Enabled']" value="${params?.colName}" optionKey="key" optionValue="value" onselect="saveValue(this)"/>
                        <input type="text" name="colValue" class="form-control" onkeyup="saveValue(this)" id="colValue">
                        <span class="input-group-btn">
                            <button class="btn btn-default" id="search-button" type="submit">Search</button>
                        </span>
                    </div>
                </g:form>
            </div>
            <div class="btn-group">
                <g:link controller="user" action="create" class="btn btn-success"><g:message code="create"/></g:link>
                <g:link controller="user" action="index" class="btn btn-primary"><g:message code="reload"/></g:link>
            </div>
    </div>
    <div class="card-body">
        <table class="table table-bordered">
            <thead>
            <tr>
                <g:sortableColumn property="id" title="Id"/>
                <th>Email</th>
                <g:sortableColumn property="fullname" title="Fullname"/>
                <g:sortableColumn property="experience" title="Experience"/>
                <g:sortableColumn property="city" title="City"/>
                <th>Picture</th>
                <g:sortableColumn property="enabled" title="Enabled"/>
                <th style="width: 40px">Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${userList}" var="user">
                <tr>
                    <td><g:link action="details" resource="${user}">${user.id}</g:link></td>
                    <td>${user.email}</td>
                    <td>${user.fullname}</td>
                    <td>${user.experience}</td>
                    <td>${user.city}</td>
                    <td>${user.picture}</td>
                    <td>${user.enabled}</td>
                    <td>
                        <div class="btn-group">
                            <g:link action="edit" controller="user" id="${user.id}" class="btn btn-secondary" ><i class="fas fa-edit"></i></g:link>
                            <g:link action="delete" controller="user" id="${user.id}" class="btn btn-secondary delete-confirmation"><i class="fas fa-trash"></i></g:link>
                        </div>
                    </td>
                </tr>
            </g:each>

            </tbody>
        </table>
        %{--<div class="pagination">--}%
        %{--<g:paginate total="${total ?: 0}" maxsteps="3" />--}%
        %{--</div>--}%
        <g:paginate total="${total ?: 0}" maxsteps="3"/>
    </div>
</div>
</div>
</body>
</html>