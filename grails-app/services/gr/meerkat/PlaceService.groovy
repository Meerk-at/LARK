package gr.meerkat

import grails.transaction.Transactional

@Transactional
class PlaceService {

    def distanceService;

    def findPlaceByLikeTitle(String title) {
        Place.findAllByTitleIlike("%"+title+"%");
    }

    def findPlaceByTitle(String title){
        Place.findByTitle(title);
    }

    def findPlaceByCategory(Category category){
        category.places;
    }

    def sortByTitle(places){
        places.sort();
    }

    def sortByDistance(center,places){
        def list = [];
        places.each{
            list.add([place: it,distance: distanceService.distanceLatLong(center,it.location)])
        }
        list.sort {it.distance};
    }

    def findPlaceNear(Location center,double radius,int max){
        def currentDist;
        def places = Place.getAll();
        def inRange = [];
        places.each {
            currentDist = distanceService.distanceLatLong(center,it.location);
            if (currentDist <=radius){
                inRange.add([place: it,distance: currentDist]);
            }
        }
        inRange.sort {it.distance};
        inRange.take(max);
    }
}
