package com.intern.olp

class Module {

    String name
    Course course
    String description

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
    static hasMany = [subModule: SubModule]
}
