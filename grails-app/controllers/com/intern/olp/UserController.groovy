package com.intern.olp

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured('permitAll')
//@Transactional(readOnly = true)
class UserController {

    UserService userService

    def index() {
        def response = userService.list(params)
        [userList: response.list, total: response.count]
    }

    def details(Integer id){
        def response = userService.getById(id)
        if(!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['User']), false)
            redirect(controller: "user", action: "index")
        } else {
            [user: response]
        }
    }

    def create(){
//        respond new User(params)
        [user: new User(params), roleList: Role.findAll()]
    }

    @Secured('permitAll')
    def save(){
        def response = userService.save(params)
        if(!response.isSuccess){
            respond response.model.errors, view: "create", model: [user: response.model, roleList: Role.findAll(), role: params.role]
        } else {
            flash.message = AppUtil.infoMessage(g.message(code: "saved", args: ['User']))
            redirect(controller: "user", action: "index")
        }
    }

    def edit(){
        def response = userService.getById(params.id)
        if (!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['User']), false)
            redirect(controller: "user", action: "index")
        } else {
            [user: response]
        }
    }

    def update() {
        def response = userService.getById(params.id)
        if(!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['User']), false)
            redirect(controller: "user", action:"index")
        } else {
            response = userService.update(response, params)
            if(!response.isSuccess){
                respond response.model.errors, view: 'edit', model: [user: response.model]
            } else {
                redirect(controller: "user", action: "index")
            }
        }
    }

    @Transactional
    def delete() {
        def response = userService.getById(params.id)
        if(!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['User']), false)
            redirect(controller: "user", action:"index")
        } else {
            response = userService.delete(response)
            if (!response){
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.delete", args: ['User']), false)
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "deleted", args: ['User']), false)
            }
            redirect(controller: "user", action: "index")
        }
    }

}
