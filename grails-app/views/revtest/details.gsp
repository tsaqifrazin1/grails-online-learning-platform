<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
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
                <dt class="col-sm-4">Body</dt>
                <dd class="col-sm-8">${review.body}</dd>

                <dt class="col-sm-4">Last Updated</dt>
                <dd class="col-sm-8">${review.lastUpdated}</dd>

                <dt class="col-sm-4">Date Created</dt>
                <dd class="col-sm-8">${review.dateCreated}</dd>

                <dt class="col-sm-4">User</dt>
                <dd class="col-sm-8"><a href="/user/show/${review.user.id}">${review.user.email}</a></dd>
            </dl>
        </div>
        <div class="card-footer d-flex ml-auto pt-0">
            <g:form resource="${this.review}" method="DELETE">
                <div class="ml-auto">
                    <g:link action="edit" controller="revtest" id="${review.id}" class="btn btn-secondary" ><i class="fas fa-edit"></i></g:link>
                    <g:link action="delete" controller="revtest" id="${review.id}" class="btn btn-secondary delete-confirmation"><i class="fas fa-trash"></i></g:link>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
