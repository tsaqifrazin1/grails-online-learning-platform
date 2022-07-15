package com.intern.olp

class DashboardController {

    def springSecurityService

    def index() {
        def user = springSecurityService.getCurrentUser()
        println(user)
        if(user) {
            [me: user]
        }
    }
}
