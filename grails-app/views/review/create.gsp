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
                <olp:all bean="review" except="user"/>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">User
                        <span class="required-indicator">*</span>
                    </label>
                    <div class="col-sm-10">
                        <g:select class="form-control" name="review.user.id" from="${userList}"/>
                    </div>
                </div>
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
