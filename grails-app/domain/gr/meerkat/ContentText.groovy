package gr.meerkat

class ContentText {

    Content content
    String contentText
    static constraints = {
        contentText(nullable: false)
    }
    static mapping = {
        contentText type: 'text'
    }
}
