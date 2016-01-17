package gr.meerkat

class Guide extends User{

    static hasMany = [contents:Content]

    static constraints = {
    }
}
