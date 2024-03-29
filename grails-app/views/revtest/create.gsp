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


        <g:form method="POST" controller="revtest" action="save">
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Body</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputEmail3" name="body" value="${review?.body?: ""}">
                    <span style="color: red">${hasErrors(bean:review,field:'body','body is required')}</span>
                </div>
            </div>

            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">User</label>
                <div class="col-sm-10">
                    %{--<g:select id="inputPassword3" class="form-control" name="user" from="${userList}" optionValue="email" optionKey="id"/>--}%
                    <select id="inputPassword3" class="form-control" name="user">
                        <option value="">Pilih email</option>
                        <g:each var="user" in="${userList}" value="${review.user.id}">
                            <g:if test="${user.id == review?.user?.id}">
                                <option value="${user.id}" selected>${user.email}</option>
                            </g:if>
                            <g:else>
                                <option value="${user.id}">${user.email}</option>
                            </g:else>
                        </g:each>
                    </select>
                    <span style="color: red">${hasErrors(bean:review,field:'user','user is required')}</span>
                </div>
            </div>
            <div class="form-group row">
                <button type="submit" class="btn btn-info float-right">Create</button>
                <g:link action="index" controller="revtest" class="btn btn-default float-right">Cancel</g:link>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>