package com.intern.olp

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class UserService {

    SpringSecurityService springSecurityService
    
    def save(GrailsParameterMap params){
        User user = new User(params)
        def response = AppUtil.saveResponse(false, user)
        user.validate()
        if (!user.hasErrors()) {
            user.save(flush: true)
            def roleUser = Role.findById(params.role)
            UserRole userRole = UserRole.create(user, roleUser)
            userRole.validate()
            if(!userRole.hasErrors()){
                userRole.save(flush: true)
                response.isSuccess = true
            }
        }

        return response
    }

    def update(User user, GrailsParameterMap params){
        user.properties = params
        def response = AppUtil.saveResponse( false, user)
        if (user.validate()){
            user.save(flush:true)
            if(!user.hasErrors()){
                response.isSuccess = true
            }
        }

        return response
    }

    def getById(Serializable id) {
        return User.get(id)
    }

    def list(GrailsParameterMap params){
        params.max = params.max ?: 5

        List<User> userList = User.createCriteria().list(params){
            if (params?.colName && params?.colValue){
                like(params.colName, "%" + params.colValue + "%")
            }
            if (!params.sort){
                order("id", "desc")
            }
        }
        return [list: userList, count: User.count()]
    }

    def delete(User user){
        try{
            user.delete(flush: true)
        } catch(Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }
    def all(){
        return User.findAll()
    }
}
