package gr.meerkat

import grails.plugin.springsecurity.annotation.Secured
import groovy.json.JsonSlurper

@Secured('IS_AUTHENTICATED_ANONYMOUSLY')
class TourController {

    def placeService;
    def distanceService

    static scaffold = Tour

    def generate(List<Place> places,double maxTime) {

        print places
        double[][] distance_table = new double[places.size()][places.size()]
        for (int i = 0; i < places.size(); i++) {
            for (int j = 0; j < places.size(); j++) {
                distance_table[i][j] = distanceService.distanceLatLong(places.get(i).location, places.get(j).location)
            }
        }
        int[] path = new int[places.size()]
        for (int i = 0; i < places.size() ; i++){
            path[i] = i
        }
        double inf = Double.POSITIVE_INFINITY;
        def best
        def bpath
        (best,bpath) = distanceService.tspBF(distance_table,inf,path,path,0,0)
        print bpath
        def timeForNextStop = 0;
        def returnPlaces = []
        for (int i = 0 ; i< places.size() ; i++){
            returnPlaces.add(places[bpath[i]])
            maxTime = maxTime - 15
            if (i != places.size()-1){
                timeForNextStop = distance_table[bpath[i]][bpath[i+1]] / 60;
            }

            if (maxTime - timeForNextStop - 15 < 0 ){
                break;
            }else {
                maxTime = maxTime - timeForNextStop
            }
        }
        render(view:'generate', model: [places:returnPlaces])
    }

    def generateList(){
        def places = Place.getAll(params.ids)
        if (Double.parseDouble(params.lat) != 0 && Double.parseDouble(params.lng) !=0){
            Location loc = new Location(latitude: Double.parseDouble(params.lat),longitude: Double.parseDouble(params.lng))
//            print loc.latitude
            places = placeService.sortByDistance(loc,places).place
        }
        generate(places,(double)180)
    }

    def generateFromForm(){
//        params.lat = "40.626669"
//        params.lng = "22.960326"
        println params
        //Todo find tour based on params: tourStyle:1, numOfPersons:1, minTime:20, maxTime:80
        def catId
        def places = []
        if (Double.parseDouble(params.tourStyle) == 1){
            catId = 2
            places =  Place.createCriteria().list() {
                categories{
                    eq('id',(long)catId)
                }
            }
            long seed = System.nanoTime();
            Collections.shuffle(places, new Random(seed));
            places = places.take(8)
        }else if (Double.parseDouble(params.tourStyle) == 2){
            catId = [4,5]
            places =  Place.createCriteria().list() {
                categories{
                    or {
                        eq('id',(long)catId[0])
                        eq('id',(long)catId[1])
                    }
                }
            }
            long seed = System.nanoTime();
            Collections.shuffle(places, new Random(seed));
            places = places.take(8)
        }
        else if (Double.parseDouble(params.tourStyle) == 3){
            catId = [6,1,3]
            places =  Place.createCriteria().list() {
                categories{
                    or{
                        eq('id',(long)catId[0])
                        eq('id',(long)catId[1])
                        eq('id',(long)catId[2])
                    }
                }
            }
            long seed = System.nanoTime();
            Collections.shuffle(places, new Random(seed));
            places = places.take(8)
        }
        else if (Double.parseDouble(params.tourStyle) == 4){
            catId = [5,4]
            places =  Place.createCriteria().list() {
                categories{
                    or{
                        eq('id',(long)catId[0])
                        eq('id',(long)catId[1])
                    }
                }
            }
            long seed = System.nanoTime();
            Collections.shuffle(places, new Random(seed));
            places = places.take(8)
        }else if (Double.parseDouble(params.tourStyle) == 5){
            catId = [3,1]
            places =  Place.createCriteria().list() {
                categories{
                    or{
                        eq('id',(long)catId[0])
                        eq('id',(long)catId[1])
                    }
                }
            }
            long seed = System.nanoTime();
            Collections.shuffle(places, new Random(seed));
            places = places.take(8)
        }else {
            catId = 1
            places =  Place.createCriteria().list() {
                categories{
                    eq('id',(long)catId)
                }
            }
            long seed = System.nanoTime();
            Collections.shuffle(places, new Random(seed));
            places = places.take(8)
        }
        println(places)


        if (Double.parseDouble(params.lat) != 0 && Double.parseDouble(params.lng) !=0){
            Location loc = new Location(latitude: Double.parseDouble(params.lat),longitude: Double.parseDouble(params.lng))
//            print loc.latitude
            places = placeService.sortByDistance(loc,places).place
        }
        generate(places,Double.parseDouble(params.maxTime))
    }
}
