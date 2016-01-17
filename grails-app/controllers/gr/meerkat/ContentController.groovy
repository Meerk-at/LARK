package gr.meerkat

import grails.plugin.springsecurity.annotation.Secured


@Secured('IS_AUTHENTICATED_ANONYMOUSLY')
class ContentController {

    static scaffold = Content

    static allowedMethods = [addRating: "POST", buyContent: "POST"]

    def test() {
        render "TEST"
    }

    def addRating(long id, String comment, double value, long userId) {

        def rating = (Rating_content) Rating_content.createCriteria().get {
            user {
                idEq(userId)
            }
            and {
                content {
                    idEq(id)
                }
            }
        }


        if (rating == null) {
            def newRating = new Rating_content(content: Content.get(id), value: value, comment: comment, user: User.get(userId));
            newRating.save(flush: true);
            println newRating
        } else {
            rating.value = value;
        }
        render "OK"
    }

    def findContentByGuide(int id) {
        def guide = Guide.get(id);

        def contents = guide.contents.toList();

        render(template: 'contentListTemplate', model: [contents: contents])
    }

    def findContentByPlace(int id) {
        def place = Place.get(id);

        def contents = place.contents.toList();

        render(template: 'contentListTemplate', model: [contents: contents])
    }

    def getRatings(long id) {
        def c = Rating_content.createCriteria();
        def ratings = c.list {
            content {
                eq('id', id)
            }
        }

        render "${ratings}"
    }

    def contents(int id) {
        def place = Place.get(id);
        render(view: "contents", model: [place: place])
    }

    def buyContent(int id, int userId) {
        def content = Content.get(id);
        def user = User.get(userId);
        user.addToBoughtContents(content);
        user.save(flush: true);
        render "${[result: 'success', contentId: id]}"
    }

    def loadImages(Content contentInstance) {
        render(template: "contentImageSlider", model: [content: contentInstance, images: contentInstance.images]);
    }

    def loadTexts(Content contentInstance) {
        render(template: "contentText", model: [content: contentInstance, texts: contentInstance.texts]);
    }

}
