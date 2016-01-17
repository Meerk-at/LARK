package gr.meerkat

class ContentImage {
    Content content
    String url
    String description
    static constraints = {
        url(nullable: false)
        description(nullable: true)
    }
    static mapping = {
        url type: 'text'
    }
}
