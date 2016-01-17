package gr.meerkat

import grails.plugin.springsecurity.annotation.Secured


@Secured('IS_AUTHENTICATED_ANONYMOUSLY')
class PlaceController {

    def placeService;
    def categoryService;
    def userService;
    def springSecurityService


    static scaffold = Place

    def test() {


    }

    def findPlaceByLikeTitle(String title) {
        def places = placeService.findPlaceByLikeTitle(title);
        render(template: "placeTemplate", model: [places: places])
    }

    def findPlaceByTitle(String title) {
        def place = placeService.findPlaceByTitle(title);
        render(template: "placeTemplate", model: [places: place])
    }

    def findPlaceByCategory(Category category) {
        def places = placeService.findPlaceByCategory(category);
        render(template: "placeTemplate", model: [places: places])
    }

    def sortByTitle(places) {
        placeService.sortByTitle(places);
        render(template: "placeTemplate", model: [places: places])
    }

    def sortByDistance(center, places) {
        def list = placeService.sortByDistance(center, places);
        render(template: "placeTemplate", model: [places: list])
    }

    def findPlaceNear(Location center, double radius, int max) {
        def inRange = placeService.findPlaceNear(center, radius, max);
        render(template: "placeTemplate", model: [places: inRange.place])
    }

    def searchPlaces(String searchQuery) {
        //TODO: searchQuery preprocessing (about accents)
        //TODO: make searching elastic (about accents)
//        searchQuery = Normalizer.normalize(searchQuery, Normalizer.Form.NFD);
//        searchQuery = searchQuery.replaceAll(".[\\p{InCombiningDiacriticalMarks}]", "%");
        if (searchQuery == null) {
            searchQuery = "%"
        }
        def places = placeService.findPlaceByLikeTitle(searchQuery)
        println places
        def categories = categoryService.findCategoryLikeTitle(searchQuery)
        println categories
        for (Category category : categories) {
            def tempPlaces = placeService.findPlaceByCategory(category)
            for (Place place : tempPlaces) {
                if (!places.contains(place)) {
                    places.add(place);
                    println place
                }
            }
        }
        showPlaces(places)
    }

    def showNearby(double lat, double lng) {
        def places;
        print lat
        print lng
        if (lat == 0.0d || lng == 0.0d) {
            places = Place.all;
        } else {
            Location userLoc = new Location(latitude: lat, longitude: lng);
            def inRange = placeService.findPlaceNear(userLoc, 2000, 30)
            places = inRange.place;
        }
        showPlaces(places);
    }

    def showPlaces(List<Place> places) {
        render(view: "showPlaces", model: [places: places])
    }


    def addPlace(double latitude, double longitude, long categories) {
        Location location = new Location(latitude: latitude, longitude: longitude, address: "Thessaloniki")
        if (location.validate()) {
            location.save(flush: true)
        } else {
            location.errors.allErrors.each {
                println it
            }
            render(status: 400, text: 'Given information is wrong.')
        }
        def f = request.getFile('image_actual')
        def destFile = new File(request.getSession().getServletContext().getRealPath("/") + f.getOriginalFilename());
        Place place = new Place()
        place.image = f.getOriginalFilename().toString()
        place.title = params.title
        place.description = params.description
        place.location = location
        place.addToCategories(Category.get(categories))
        if (place.validate()) {
            f.transferTo(destFile)
            place.save(flush: true)
            redirect(controller: "content", action: "contents", params: [id: place.id])
        } else {
            place.errors.allErrors.each {
                println it
            }
            render(status: 400, text: 'Given information is wrong.')
        }


    }

    def loadImages(String imageName) {
        def img = new File(request.getSession().getServletContext().getRealPath("/") + imageName).getBytes()
        response.setHeader('Content-length', String.valueOf(img.length))
        response.contentType = 'image/png' // or the appropriate image content type
        response.outputStream << img
        response.outputStream.flush()
    }

    def addContent(long place) {
        println(params.place)
        println(place)
        redirect(controller: 'place', action: 'uploadContent', params: ['place_id': place])
    }

    def uploadContent(long place_id) {
        render(view: 'uploadContent', model: [place_id: place_id])
    }

    def saveNewContent(String title, String description, String text1, String text2, String text3, String longtext1, String longtext2, String longtext3, long place_id) {

        def f1 = request.getFile('image_actual_1')
        def destFile1 = new File(request.getSession().getServletContext().getRealPath("/") + f1.getOriginalFilename());
        def f2 = request.getFile('image_actual_2')
        def destFile2 = new File(request.getSession().getServletContext().getRealPath("/") + f2.getOriginalFilename());
        def f3 = request.getFile('image_actual_3')
        def destFile3 = new File(request.getSession().getServletContext().getRealPath("/") + f3.getOriginalFilename());
        def place = Place.get(place_id)

        def principal = springSecurityService.principal

        def guide = userService.getUser(principal.username)
        if (!guide.instanceOf(Guide)) {
            render(status: 402, text: 'Not allowed.')
        } else {
            def content = new Content(place: place, title: title, text: description, guide: guide)
            if (!content.validate()) {
                render(status: 400, text: 'Error in content properties.')
            } else {
                content.save(flush: true)
                ContentText contentText1 = new ContentText(contentText: longtext1, content: content)
                ContentText contentText2 = new ContentText(contentText: longtext2, content: content)
                ContentText contentText3 = new ContentText(contentText: longtext3, content: content)
                ContentImage contentImage1 = new ContentImage(url: f1.getOriginalFilename().toString(),description: text1,content: content)
                ContentImage contentImage2 = new ContentImage(url: f2.getOriginalFilename().toString(),description: text2,content: content)
                ContentImage contentImage3 = new ContentImage(url: f3.getOriginalFilename().toString(),description: text3,content: content)
                if (contentText1.validate()){
                    contentText1.save(flush: true)
                }
                if (contentText2.validate()){
                    contentText2.save(flush: true)
                }
                if (contentText3.validate()){
                    contentText3.save(flush: true)
                }
                if (contentImage1.validate()){
                    f1.transferTo(destFile1)
                    contentImage1.save(flush: true)
                }
                if (contentImage2.validate()){
                    f2.transferTo(destFile2)
                    contentImage2.save(flush: true)
                }
                if (contentImage3.validate()){
                    f3.transferTo(destFile3)
                    contentImage3.save(flush: true)
                }
            }
        }


    }
}
