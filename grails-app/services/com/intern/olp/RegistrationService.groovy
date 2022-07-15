package com.intern.olp

import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class RegistrationService {

    def save(GrailsParameterMap params) {
        User user = new User(params)
        def response = AppUtil.saveResponse(false, user)
        user.validate()
        if (!user.hasErrors()) {
            user.save(flush: true)
            def roleUser = Role.findByAuthority('ROLE_USER')
            UserRole userRole = UserRole.create(user, roleUser)
            userRole.validate()
            if(!userRole.hasErrors()){
                userRole.save(flush: true)
                response.isSuccess = true
            }
        }
        return response
    }
}