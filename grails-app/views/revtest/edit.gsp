%{--Include Main Layout--}%
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
    <div class="card">
        <div class="card-header">
            <g:message code="review" args="['Update']"/>
        </div>
        <div class="card-body">

            <g:form method="POST" controller="revtest" action="update" id="${review.id}">
                <div class="form-group row">
                    <label for="inputBody" class="col-sm-2 col-form-label">Body</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputBody" value="${review.body}" name="body">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputUser" class="col-sm-2 col-form-label">User</label>
                    <div class="col-sm-10">
                        <g:select class="form-control" id="inputUser" name="user.id" from="${userList}" optionValue="email" optionKey="id" value="${review.user.id}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <button type="submit" class="btn btn-info float-right">Edit</button>
                    <g:link action="index" controller="revtest" class="btn btn-default float-right">Cancel</g:link>
                </div>
            </g:form>
            %{--${flash.message}--}%
        </div>
    </div>
</body>
</html>