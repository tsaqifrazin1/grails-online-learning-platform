package com.intern.olp

import grails.plugin.springsecurity.annotation.Secured


@Secured('ROLE_ADMIN')
class ReviewController {

    ReviewService reviewService

    def index() {
        def response = reviewService.list(params)
        [reviewList: response.list, total: response.count]
    }

    def details(Integer id){
        def response = reviewService.getById(id)
        if(!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['Review']), false)
            redirect(controller: "review", action: "index")
        } else {
            [review: response]
        }
    }

    def create(){
//        respond new Review(params)
        [review: new Review(params)]
    }

    @Secured('permitAll')
    def save(){
        def response = reviewService.save(params)
        if(!response.isSuccess){
            flash.redirectParams = response.model
            flash.message = AppUtil.infoMessage(g.message(code: "unable.to.save", args: ['Review']), false)
            redirect(controller: "review", action: "create")
        } else {
            flash.message = AppUtil.infoMessage(g.message(code: "saved", args: ['Review']))
            redirect(controller: "review", action: "index")
        }
    }

    def edit(Integer id){
        if(flash.redirectParams) {
            [review: flash.redirectParams]
        } else {
            def response = reviewService.getById(id)
            if (!response){
                flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['Review']), false)
                redirect(controller: "review", action: "index")
            } else {
                [review: response]
            }
        }
    }

    def update() {
        def response = reviewService.getById(params.id)
        if(!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['Review']), false)
            redirect(controller: "review", action:"index")
        } else {
            response = reviewService.update(response, params)
            if(!response.isSuccess){
                flash.redirectParams = response.model
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.update", args: ['Review']), false)
                redirect(controller: "review", action: "edit")
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "updated", args: ['Review']))
                redirect(controller: "review", action: "index")
            }
        }
    }

    def delete() {
        def response = reviewService.getById(params.id)
        if(!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity", args: ['Review']), false)
            redirect(controller: "review", action:"index")
        } else {
            response = reviewService.delete(response)
            if (!response){
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.delete", args: ['Review']), false)
            } else {
                flash.message = AppUtil.infoMessage(g.message(code: "deleted", args: ['Review']), false)
            }
            redirect(controller: "review", action: "index")
        }
    }
}
