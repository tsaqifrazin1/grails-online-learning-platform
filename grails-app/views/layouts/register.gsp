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

    <g:layoutHead/>
</head>
<body class="hold-transition register-page">
<div class="register-box">
    <g:layoutBody/>
</div>
<asset:javascript src="application.js"/>
<script type="text/javascript">
    <g:if test="${flash?.message && flash?.message?.info}">
    jQuery(document).ready(function () {
        OLP.messageBox.showMessage(Boolean(${flash.message?.success}), "${flash.message?.info}");
    });
    </g:if>
</script>
</body>

</html>