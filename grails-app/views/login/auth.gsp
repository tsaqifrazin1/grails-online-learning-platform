<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>

<body>
<div id="login">
    <div class="inner d-sm-flex justify-content-center">
        <div class="card card-info col-4" style="padding: 0">
            <div class="card-header bg-gradient-gray">
                <h3 class="card-title"><g:message code='springSecurity.login.header'/></h3>
            </div>
            <g:if test='${flash.message}'>
                <g:if test='${!flash.message.info && !flash.message.success}'>
                    <div class="login_message">${flash.message}</div>
                </g:if>
            </g:if>

            <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="form" autocomplete="off">
                <div class="card-body">
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label"><g:message code='springSecurity.login.email.label'/></label>
                        <div class="col-sm-9" style="padding-left: 0">
                            <input type="email" class="form-control" id="username" name="${usernameParameter ?: 'username'}" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row">

                        <label for="password" class="col-3 col-form-label"><g:message code='springSecurity.login.password.label'/></label>
                        <div class="col-sm-9" style="padding-left: 0">
                            <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
                        </div>
                    </div>
                    <div class="form-group row" style="margin-bottom: 0">
                        <div class="offset-sm-3 col-sm-8" style="padding-left: 0">
                            <div class="form-check" style="padding-left: 0">
                                <p id="remember_me_holder">
                                    <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                                    <label for="remember_me" class="form-check-label"><g:message code='springSecurity.login.remember.me.label'/></label>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer" style="padding-top: 0">
                    <button type="submit" class="btn btn-info bg-gradient-gray btn-outline-info" id="submit">${message(code: 'springSecurity.login.button')}</button>
                </div>

            </form>

        </div>
    </div>
</div>

<asset:javascript src="application.js"/>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
