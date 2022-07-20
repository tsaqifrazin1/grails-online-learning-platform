<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div id="show-user" class="content scaffold-show mt-2" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="card">
        <div class="card-header d-flex p-0">
            <h3 class="card-title p-3"><g:message code="default.show.label" args="[entityName]" /></h3>
            <div class="ml-auto col-sm-2 pt-2">
                <g:link class="ml-auto btn btn-primary btn-block" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>                </div>
        </div>
        <f:display bean="review" displayStyle="table" />
        <div class="card-footer d-flex ml-auto pt-0">
            <g:form resource="${this.review}" method="DELETE">
                <div class="ml-auto">
                    <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete bg-gradient-red" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
