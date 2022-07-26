<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="card-header">
            <g:message code="user" args="['Edit']"/>
        </div>
        <div class="card-body">
                <g:form method="POST" controller="user" action="update" id="${user.id}">
                    <div class="form-group row false">
                        <label for="email" class="col-sm-2 col-form-label">Email
                            <span class="required-indicator">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="email" name="email" required="" value="${user.email}" id="email" class="form-control" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row false">
                        <label for="fullname" class="col-sm-2 col-form-label">Fullname
                            <span class="required-indicator">*</span>
                        </label>

                        <div class="col-sm-10">
                            <input type="fullname" name="fullname" required="" value="${user.fullname}" id="fullname" class="form-control" placeholder="Fullname">
                        </div>
                    </div>
                    <div class="form-group row">
                        <button type="submit" class="btn btn-info float-right">Edit</button>
                        <g:link action="index" controller="user" class="btn btn-default float-right">Cancel</g:link>
                    </div>
                </g:form>
            </div>
    </body>
</html>
