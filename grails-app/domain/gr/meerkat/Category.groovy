package gr.meerkat

class Category {

    String title;
    static hasMany = [places:Place];
    static belongsTo = Place;
    String toString(){
        return title;
    }
    static constraints = {
        title(nullable: false,unique: true)
    }
}
