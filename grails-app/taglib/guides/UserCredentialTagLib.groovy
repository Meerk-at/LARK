package guides

class UserCredentialTagLib {
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static returnObjectForTags = ['getAppUser','isContentBought ']
    static namespace = "userTagLib"
    def userService

    def ifGuide = {attrs, body ->
        def username = attrs['username']

        // Do something with the params

        if (userService.isGuide(username)){
            out << body()
        }
    }

    def ifNotGuide = {attrs, body ->
        def username = attrs['username']

        // Do something with the params

        if (!userService.isGuide(username)){
            out << body()
        }
    }

    def ifContentBought = {attrs, body ->
        def username = attrs['username']
        def contentId = attrs['contentId']

        // Do something with the params

        if (userService.isContentBought(username,contentId)){
            out << body()
        }
    }

    def isContentBought = {attrs, body ->
        def username = attrs['username']
        def contentId = attrs['contentId']

        userService.isContentBought(username,contentId)

    }

    def ifContentNotBought = {attrs, body ->
        def username = attrs['username']
        def contentId = attrs['contentId']

        // Do something with the params

        if (!userService.isContentBought(username,contentId)){
            out << body()
        }
    }

//  Call with  ${userTagLib.getAppUser(username: sec.username()).firstName}
    def getAppUser = { attrs, body ->
        def username = attrs['username']
        userService.getUser(username)
    }

}
