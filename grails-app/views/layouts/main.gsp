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
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- Navbar -->
    <g:render template="/templates/navbar"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
       <g:layoutBody/>
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
        <div class="p-3">
            <h5>Title</h5>
            <p>Sidebar content</p>
        </div>
    </aside>
    <!-- /.control-sidebar -->

    %{--Alert--}%
    <g:render template="/templates/alert"/>
    <!-- Main Footer -->
    <g:render template="/templates/footer"/>

</div>
<!-- ./wrapper -->'
<asset:javascript src="application.js"/>
%{--<script type="text/javascript">--}%
    %{--<g:if test="${flash?.message && flash?.message?.info}">--}%

    %{--jQuery(document).ready(function () {--}%
        %{--messageBox.showMessage(Boolean(${flash.message?.success}), "${flash.message?.info}");--}%
    %{--});--}%
    %{--</g:if>--}%
%{--</script>--}%
<script src="https://kit.fontawesome.com/c8c9906cce.js" crossorigin="anonymous"></script>



</body>

</html>
