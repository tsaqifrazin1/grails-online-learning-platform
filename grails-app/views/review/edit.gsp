%{--Include Main Layout--}%
<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        <g:message code="review" args="['Update']"/>
    </div>
    <div class="card-body">
        <g:form resource="${this.review}" method="PUT">
            <fieldset class="form">
                <f:all bean="review"/>
            </fieldset>
            <div class="form-action-panel">
                <g:submitButton class="btn btn-primary" name="update" value="${message(code: 'default.button.edit.label', default: 'Update')}"/>
                <g:link controller="review" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
            </div>
        </g:form>
    </div>
</div>