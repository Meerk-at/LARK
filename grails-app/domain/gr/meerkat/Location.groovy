package gr.meerkat

class Location {

    double latitude;
    double longitude;
    String address;

    String toString(){
        return address;
    }

    static constraints = {
        latitude(null: false);
        longitude(null: false);
    }
}
