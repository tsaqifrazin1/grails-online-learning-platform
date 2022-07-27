package com.intern.olp

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class RevtestController {

    RevtestService revtestService
    SpringSecurityService springSecurityService
    UserService userService

    def index() {
        def reviewList = revtestService.list(params)
        render(view: "/revtest/index", model:[reviewList: reviewList.list, total: reviewList.count])
    }

    def details(Integer id){
        def review = revtestService.getById(id)
        if(!response){
            render(view: "/revtest/index")
        } else {
            render(view: "/revtest/details", model: [review: review])
        }
    }

    def edit(){
        def userList= userService.all()
        def review= revtestService.getById(params.id)
        if(!review){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['Review']), false)
            redirect(action: "index")
            render status: 404
        }else{
            [userList: userList, review: review]
        }

    }

    def update() {
        def review = revtestService.getById(params.id)
        review.body = params.body
        review.user = userService.getById(params.user)
        review.validate()
        if(!review.hasErrors()){
            review.save()
            flash.message = AppUtil.infoMessage(g.message(code: "updated", args: ['Review']))
            redirect(controller: "revtest", action: "index")
        }else{
            review.errors.fieldErrors.each {
                def error -> flash.message = AppUtil.infoMessage(g.message(error: error), false)
            }
            respond review.errors, view: 'edit', model: [userList: userService.all(), review:   params]
        }

    }

    def delete() {
        def review = revtestService.getById(params.id)
        if (!review) {
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['Review']), false)
            redirect(controller: "revtest", action: "index")
        } else {
            def response = revtestService.delete(review)
            if (!response) {
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.delete", args: ['Review']), false)
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "deleted", args: ['Review']))
            }
            redirect(controller: "revtest", action: "index")
        }
    }

    def save(){
        def review = new Review()
        review.body = params.body
        review.user = userService.getById(params.user)
        review.validate()
        if(!review.hasErrors()){
            review.save()
            flash.message = AppUtil.infoMessage(g.message(code: "saved", args: ['Review']) as String)
            redirect(controller: "revtest", action: "index")
        }else{
            def userList = userService.all()
            respond review.errors, view: "create", model: [review: review, userList: userList]
        }

    }

    def create(){
        def userList = userService.all()
        render(view: "/revtest/create", model: [userList: userList])
    }

}