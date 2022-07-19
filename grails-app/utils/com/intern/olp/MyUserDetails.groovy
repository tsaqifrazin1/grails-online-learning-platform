package com.intern.olp

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority

class MyUserDetails extends GrailsUser {

    final String fullname

    MyUserDetails(String email, String password, boolean enabled,
                  boolean accountNonExpired, boolean credentialsNonExpired,
                  boolean accountNonLocked,
                  Collection<GrantedAuthority> authorities,
                  long id, String fullname) {
        super(email, password, enabled, accountNonExpired,
                credentialsNonExpired, accountNonLocked, authorities, id)

        this.fullname = fullname
    }
}
