package com.intern.olp

class Tag {

    String name

    Date dateCreated
    Date lastUpdated
    static constraints = {
    }
    static belongsTo = Course
    static hasMany = [courses: Course]
}
