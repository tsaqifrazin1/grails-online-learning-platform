<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="register"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div id="register">
    <g:if test='${flash.message}'>
        <g:if test='${!flash.message.info && !flash.message.success}'>
            <div class="login_message">${flash.message}</div>
        </g:if>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class = "d-flex justify-content-center">
        <div class="card card-info col p-0">
            <div class="card-header bg-gradient-blue">
                <h3 class="card-title">Sign Up</h3>
            </div>
            <div class="card-body">
                <g:form action="save">
                    <p class="text-left" style="margin-bottom: 0">Full Name</p>
                    <div class="input-group mb-3 fieldcontain required" style="margin-top: 0">
                        <input type="text" name="fullname" value required id="fullname" class="form-control" placeholder="Full name">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <p class="text-left" style="margin-bottom: 0">Email</p>
                    <div class="input-group mb-3 fieldcontain required" style="margin-top: 0">
                        <input type="email" name="email" required value id="email" class="form-control" placeholder="Email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <p class="text-left" style="margin-bottom: 0">Password</p>
                    <div class="input-group mb-3 fieldcontain required" style="margin-top: 0">
                        <input type="password" name="password" required value id="password" class="form-control" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block">Register</button>
                        </div>

                    </div>
                </g:form>
            </div>
            <div class="card-footer text-center pt-0">
                <g:link controller="login" action="auth" class="text-center mb-10">I already have a membership</g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>
