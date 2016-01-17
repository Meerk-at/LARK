package gr.meerkat

class Rating_content {

    double value;
    String comment;
    User user;
    static belongsTo = [content:Content];

    static constraints = {
        value(nullable: false,range: 0..5);
        comment(nullable: true);
        user(nullable: false);
    }
}
