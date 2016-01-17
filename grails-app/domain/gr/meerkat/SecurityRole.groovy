package gr.meerkat

class SecurityRole implements Serializable {

    private static final long serialVersionUID = 1

    String authority

    SecurityRole(String authority) {
        this()
        this.authority = authority
    }

    @Override
    int hashCode() {
        authority?.hashCode() ?: 0
    }

    @Override
    boolean equals(other) {
        is(other) || (other instanceof SecurityRole && other.authority == authority)
    }

    @Override
    String toString() {
        authority
    }

    static constraints = {
        authority blank: false, unique: true
    }

    static mapping = {
        cache true
    }
}
