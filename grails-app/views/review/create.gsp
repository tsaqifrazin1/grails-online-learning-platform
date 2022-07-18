%{--Include Main Layout--}%
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="card">
    <div class="card-header">
        <g:message code="review" args="['Create']"/>
    </div>
    <div class="card-body">
        <g:form controller="review" action="save">

        %{--Partial Templating--}%
            <fieldset class="form-group">
                <f:all bean="review"/>
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
