package com.intern.olp

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured


@Secured('permitAll')
class RegistrationController {

    RegistrationService registrationService

    def index() {
        [user: new User(params)]
    }

    def save(){
        def response = registrationService.save(params)
        if(!response.isSuccess){
            flash.message = AppUtil.infoMessage(g.message(code: "unable.to.save", args: ['User']), false)
            redirect(action: "index")
        } else {
            flash.message = AppUtil.infoMessage(g.message(code: "saved", args: ['User']))
            SpringSecurityUtils.reauthenticate(params.email, params.password)
            redirect(controller: "dashboard", action: "index")
        }
    }
}
