package com.intern.olp

class CourseCategory {

    String name
    String description
    String picture

    Date dateCreated
    Date lastUpdated

    static hasMany = [courses: Course]
    static constraints = {
    }
}
