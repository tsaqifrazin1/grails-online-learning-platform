%{--Include Main Layout--}%
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
    <div class="card">
        <div class="card-header">
            <g:message code="review" args="['List Of']"/>
            <span class="float-right">
            <div class="btn-group">
                <g:form controller="revtest" action="index" method="GET" name="se">
                    <div class="input-group" id="search-area">
                        %{--<select name="colName" class="form-control" id="colName" onselect="console.log(this)" >--}%
                        %{--<option value="body">Body</option>--}%
                        %{--<option value="user">User Email</option>--}%
                        %{--</select>--}%
                        %{--<g:if test="${reviewList[0] != null}">--}%
                            %{--<olp:dropDownColName collection="${reviewList}" withId="['id']"/>--}%
                        %{--</g:if>--}%
                        %{--<g:else>--}%
                            %{--<olp:dropDownColName domainClass="com.intern.olp.Review" withId="['id']"/>--}%
                        %{--</g:else>--}%
                        <g:select name="colName" class="form-control" from="[id: 'Id', body: 'Body', user: 'User Email']" value="${params?.colName}" optionKey="key" optionValue="value" onselect="saveValue(this)"/>
                        <input type="text" name="colValue" class="form-control" onkeyup="saveValue(this)" id="colValue">
                        <span class="input-group-btn">
                            <button class="btn btn-default" id="search-button" type="submit">Search</button>
                        </span>
                    </div>
                </g:form>
            </div>
            <div class="btn-group">
                <g:link controller="revtest" action="create" class="btn btn-success"><g:message code="create"/></g:link>
                <g:link controller="revtest" action="index" class="btn btn-primary"><g:message code="reload"/></g:link>
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <g:sortableColumn property="id" title="Id"/>
                    <th>Body</th>
                    <g:sortableColumn property="user" title="User"/>
                    <th style="width: 40px">Action</th>
                </tr>
                </thead>
                <tbody>
                    <g:each in="${reviewList}" var="review">
                        <tr>
                            <td><g:link action="details" resource="${review}">${review.id}</g:link></td>
                            <td>${review.body}</td>
                            <td>${review.user.email}</td>
                            <td>
                                <div class="btn-group">
                                    <g:link action="edit" controller="revtest" id="${review.id}" class="btn btn-secondary" ><i class="fas fa-edit"></i></g:link>
                                    <g:link action="delete" controller="revtest" id="${review.id}" class="btn btn-secondary delete-confirmation"><i class="fas fa-trash"></i></g:link>
                                </div>
                            </td>
                        </tr>
                    </g:each>

                </tbody>
            </table>
            %{--<div class="pagination">--}%
                %{--<g:paginate total="${total ?: 0}" maxsteps="3" />--}%
            %{--</div>--}%
            <g:paginate total="${total ?: 0}" maxsteps="3"/>
        </div>
    </div>
</body>
</html>