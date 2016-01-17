package gr.meerkat

class User {

    String firstName;
    String lastName;
    String eMail;

    String toString(){
        return firstName;
    }

    static hasMany = [boughtContents:Content]

    static mappedBy = [boughtContents: "buyingUsers"]

    static constraints = {
        firstName(nullable: false);
        lastName(nullable: false);
        eMail(nullable: false);
    }
}
