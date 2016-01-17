package gr.meerkat

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import javax.swing.JApplet

@Secured('IS_AUTHENTICATED_ANONYMOUSLY')
class ApiController {

    def index() {}

    def placesByCategory(){
        def categoryId = Long.parseLong(params.catId)
        def places = Place.createCriteria().list {
            categories{
                eq('id', categoryId)
            }
        }
        def results = []
        places.each {
            results.add(['title':it.title,'location':['lat':it.location.latitude,'lng':it.location.longitude,'address':it.location.address]])
        }
        render results as JSON

    }
    def categories(){
        def categories = Category.all
        def results = [];
        categories.each {
            results.add(['id':it.id,'tittle':it.title])
        }

        render  results as JSON
    }
}
