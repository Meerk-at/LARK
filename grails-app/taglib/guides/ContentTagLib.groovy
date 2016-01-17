package guides

class ContentTagLib {
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static returnObjectForTags = ['getContentRating']
    static namespace = "contentTagLib"
    def contentService

    //  Call with  ${contentTagLib.getContentRating(id: id)}
    def getContentRating = { attrs, body ->
        long id = attrs['id']
        contentService.getRating(id)
    }

}
