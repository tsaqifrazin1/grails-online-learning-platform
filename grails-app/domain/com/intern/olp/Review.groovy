package com.intern.olp

class Review {

    String body
    User user
    Date dateCreated
    Date lastUpdated

    static constraints = {
        body blank:false, nullable: false
    }
    static mapping = {
    }

}
