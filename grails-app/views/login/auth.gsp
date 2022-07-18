<html lang="en">
<head>
    <meta name="layout" content="register"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>

<body>
<div id="login">
    <div class="inner d-flex justify-content-center">
        <div class="card card-info col p-0">
            <div class="card-header bg-gradient-blue">
                <h3 class="card-title"><g:message code='springSecurity.login.header'/></h3>
            </div>
            <g:if test='${flash.message}'>
                <g:if test='${!flash.message.info && !flash.message.success}'>
                    <div class="login_message">${flash.message}</div>
                </g:if>
            </g:if>

            <div class="card-body">
                <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="form" autocomplete="off" style="margin-bottom: 0">
                    <p class="text-left" style="margin-bottom: 0"><g:message code='springSecurity.login.email.label'/></p>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" id="username" name="${usernameParameter ?: 'username'}" placeholder="Email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <p class="text-left" style="margin-bottom: 0"><g:message code='springSecurity.login.password.label'/></p>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                                <label for="remember_me" class="form-check-label"><g:message code='springSecurity.login.remember.me.label'/></label>

                            </div>
                        </div>

                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block" id="submit">${message(code: 'springSecurity.login.button')}</button>
                        </div>
                </form>
            </div>
        </div>
        <div class="card-footer text-center pt-0">
            <g:link controller="registration" action="index" class="text-center mb-10">I don't have a membership</g:link>
        </div>
    </div>
</div>
</body>
</html>
