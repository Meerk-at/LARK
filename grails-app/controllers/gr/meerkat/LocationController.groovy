package gr.meerkat

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('IS_AUTHENTICATED_ANONYMOUSLY')
class LocationController {

    static scaffold = Location

    def placeService

    def map(List<Place> places){
        places = placeService.findPlaceByLikeTitle("%"+"Μουσ"+"%");
        print places
        render(template:"mapPlaces", model:[places: places])
    }
}
