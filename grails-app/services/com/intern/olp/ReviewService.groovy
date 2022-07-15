package com.intern.olp

import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ReviewService {

    def save(GrailsParameterMap params){
        Review review = new Review(params)
        def response = AppUtil.saveResponse(false, review)
        if (review.validate()){
            review.save(flush:true)
            if(!review.hasErrors()){
                response.isSuccess = true
            }
        }

        return response
    }

    def update(Review review, GrailsParameterMap params){
        review.properties = params
        def response = AppUtil.saveResponse( false, review)
        if (review.validate()){
            review.save(flush:true)
            if(!review.hasErrors()){
                response.isSuccess = true
            }
        }

        return response
    }

    def getById(Serializable id) {
        return Review.get(id)
    }

    def list(GrailsParameterMap params){
        params.max = params.max ?: 5
        if(params?.colName == 'user'){
            params.colName = "u.email"
        }
        List<Review> reviewList = Review.createCriteria().list(params){
            createAlias("user", "u")
            if (params?.colName && params?.colValue){
                like(params.colName, "%" + params.colValue + "%")
            }
            if (!params.sort){
                order("id", "desc")
            }
        }

        return [list: reviewList, count: Review.count()]
    }

    def delete(Review review){
        try{
            review.delete(flush: true)
        } catch(Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }
}
