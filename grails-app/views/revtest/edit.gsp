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
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Body</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" value="${review.body}" name="body">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">User</label>
                    <div class="col-sm-10">
                        <g:select id="inputPassword3" class="form-control" name="user" from="${userList}" optionValue="email" optionKey="id" value="${review.user.id}"/>
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