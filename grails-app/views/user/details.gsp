<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-user" class="content scaffold-show mt-2" role="main">
            <div class="card">
                <div class="card-header d-flex p-0">
                    <h3 class="card-title p-3"><g:message code="default.show.label" args="[entityName]" /></h3>
                    <div class="ml-auto col-sm-2 pt-2">
                        <g:link class="ml-auto btn btn-primary btn-block" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
                    </div>
                </div>
                <div class="card-body">
                    <dl class="row mb-0">
                        <dt class="col-sm-4">Email</dt>
                        <dd class="col-sm-8">${user.email}</dd>

                        <dt class="col-sm-4">Fullname</dt>
                        <dd class="col-sm-8">${user.fullname}</dd>

                        <dt class="col-sm-4">Experience</dt>
                        <dd class="col-sm-8">${user.experience}</dd>

                        <dt class="col-sm-4">City</dt>
                        <dd class="col-sm-8">${user.city}</dd>

                        <dt class="col-sm-4">Enabled</dt>
                        <dd class="col-sm-8">${user.enabled}</dd>

                        <dt class="col-sm-4">Courses</dt>
                        <dd class="col-sm-8">${user.courses}</dd>

                        <dt class="col-sm-4">Reviews</dt>
                        <dd class="col-sm-8">${user.reviews.body}</dd>

                        %{--<dt class="col-sm-4">User</dt>--}%
                        %{--<dd class="col-sm-8"><a href="/user/show/${review.user.id}">${review.user.email}</a></dd>--}%
                    </dl>
                </div>
                <div class="card-footer d-flex ml-auto pt-0">
                    <g:form resource="${this.user}" method="DELETE">
                        <div class="ml-auto">
                            <g:link action="edit" controller="user" id="${user.id}" class="btn btn-secondary" ><i class="fas fa-edit"></i></g:link>
                            <g:link action="delete" controller="user" id="${user.id}" class="btn btn-secondary delete-confirmation"><i class="fas fa-trash"></i></g:link>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </body>
</html>
