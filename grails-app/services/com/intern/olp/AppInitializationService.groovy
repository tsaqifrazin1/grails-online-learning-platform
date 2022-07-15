package com.intern.olp

import grails.transaction.Transactional

@Transactional
class AppInitializationService {

    static initialize() {
        initMember()

    }
    private static initMember() {
        def roleAdmin = new Role(
                authority : "ROLE_ADMIN"
        )

        roleAdmin.validate()
        if (!roleAdmin.hasErrors()) {
            roleAdmin.save()
        }
        def roleUser = new Role(
                authority : "ROLE_USER"
        )

        roleUser.validate()
        if (!roleUser.hasErrors()) {
            roleUser.save()
        }
        def user = new User(
                fullname: "System Administrator",
                email: "ocb@domain.com",
                password: "123456"
        )
        user.validate()
        if (!user.hasErrors()) {
            user.save()
            UserRole.create(user, roleAdmin)
        }
    }
}
