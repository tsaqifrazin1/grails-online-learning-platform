package com.intern.olp

class Course {

    String name
    String level
    String decription
    CourseCategory courseCategory
    String picture
    Integer courseXp

    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
    static belongsTo = User
    static hasMany = [users: User, tags: Tag, modules: Module]
}
