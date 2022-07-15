<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <script type="text/javascript">
        <g:if test="${flash?.message && flash?.message?.info}">
        jQuery(document).ready(function () {
            OLP.messageBox.showMessage(Boolean(${flash.message?.success}), "${flash.message?.info}");
        });
        </g:if>
    </script>

    <g:layoutHead/>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark rounded">
        <a class="navbar-brand" href="#">Grails Online Learning Platform</a>
        <a class="navbar-brand">
            <sec:ifLoggedIn>
                <g:link class="logout" controller="logout">${message(code: 'Logout')}</g:link>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <g:link class="login" controller="login">${message(code: 'Login')}</g:link>
            </sec:ifNotLoggedIn></a>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>

</header>
<div class="container-fluid">
    <div class="row">

        <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
            <ul class="list-group">
                <li class = "list-group-item"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li class = "list-group-item"><g:link controller="user" action="index"><g:message code = "User" args="['']"/></g:link></li>
                <li class = "list-group-item"><g:link controller="review" action="index"><g:message code = "Review" args="['']"/></g:link></li>
            </ul>
        </nav>


        <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
            <g:layoutBody/>
        </main>

    </div>
</div>
</body>
</html>
