package gr.meerkat

class Content {

    String text;
    String title;
    double price;
    Guide guide;
    Place place;

    static belongsTo = [User]

    static hasMany = [buyingUsers:User,images:ContentImage,texts:ContentText]
    static mappedBy = [buyingUsers: "boughtContents"]

    static constraints = {
        text(nullable: false)
        price(null: false)
        images(nullable: true)
        texts(nullable: true)
    }

    String toString(){
        return title;
    }

    static mapping = {
        text type: 'text'
    }
}
