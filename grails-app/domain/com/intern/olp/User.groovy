package com.intern.olp

import grails.plugin.springsecurity.SpringSecurityService
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
//@ToString(excludes='password', includeNames=true, includePackage=false, includeSuperProperties = true)
class User implements Serializable {

	private static final long serialVersionUID = 1

	SpringSecurityService springSecurityService

	String password
	String email
	String fullname
	Integer experience
	String city
	String picture
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	Date dateCreated
	Date lastUpdated

	Set<Role> getAuthorities() {
		(UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
	static hasMany = [courses: Course, reviews: Review]
	static transients = ['springSecurityService']

	static constraints = {
		password blank: false, password: true
		email blank: false, unique: true, email: true
		fullname blank: false
		experience nullable: true
		city nullable: true
		picture nullable: true
	}

	static mapping = {
		password column: '`password`'
		reviews cascade: "all-delete-orphan"
	}

}
