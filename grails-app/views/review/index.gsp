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

            %{--Search Panel --}%
            <div class="btn-group">
                <g:form controller="review" action="index" method="GET" name="se">
                    <div class="input-group" id="search-area">
                        %{--<select name="colName" class="form-control" id="colName" onselect="console.log(this)" >--}%
                            %{--<option value="body">Body</option>--}%
                            %{--<option value="user">User Email</option>--}%
                        %{--</select>--}%
                        <g:if test="${reviewList[0] != null}">
                            <olp:dropDownColName collection="${reviewList}"/>
                        </g:if>
                        %{--<g:select name="colName" class="form-control" from="[body: 'Body', user: 'User Email']" value="${params?.colName}" optionKey="key" optionValue="value" onselect="saveValue(this)"/>--}%
                        <input type="text" name="colValue" class="form-control" onkeyup="saveValue(this)" id="colValue">
                        <span class="input-group-btn">
                            <button class="btn btn-default" id="search-button" type="submit">Search</button>
                        </span>
                    </div>
                </g:form>
            </div>
            <div class="btn-group">
                <g:link controller="review" action="create" class="btn btn-success"><g:message code="create"/></g:link>
                <g:link controller="review" action="index" class="btn btn-primary"><g:message code="reload"/></g:link>
            </div>
        </span>
    </div>
    <div class="card-body">
        <g:if test="${reviewList[0] != null}">
            <olp:table collection="${reviewList}" withId="['id']"/>
        </g:if>
        <div class="paginate">
            <g:paginate total="${total ?: 0}" maxsteps="3" />
        </div>
    </div>
</div>
</body>
</html>
