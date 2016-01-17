package gr.meerkat

class Place {

    String title;
    String image;
    String description;
    Location location;
    static hasMany = [categories:Category,contents:Content];

    String toString(){
        return title;
    }
    static constraints = {
        title(nullable: false,unique: true);
        location(nullable: false)
        image(nullable: true)
    }
    static mapping = {
        description type: 'text'
        image type: 'text'
    }
}
