<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>
        testes
    </title>
</head>
<body>
    <sec:ifLoggedIn>
        <sec:loggedInUserInfo field="fullname"/>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <a class="d-block">No User</a>
    </sec:ifNotLoggedIn>
</body>
</html>
