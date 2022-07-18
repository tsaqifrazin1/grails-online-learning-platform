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
        Sudah Login ${me.fullname}
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        Belum Login
    </sec:ifNotLoggedIn>

</body>
</html>
