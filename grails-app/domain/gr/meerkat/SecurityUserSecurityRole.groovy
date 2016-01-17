package gr.meerkat

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache = true, includeNames = true, includePackage = false)
class SecurityUserSecurityRole implements Serializable {

    private static final long serialVersionUID = 1

    SecurityUser securityUser
    SecurityRole securityRole

    SecurityUserSecurityRole(SecurityUser u, SecurityRole r) {
        this()
        securityUser = u
        securityRole = r
    }

    @Override
    boolean equals(other) {
        if (!(other instanceof SecurityUserSecurityRole)) {
            return false
        }

        other.securityUser?.id == securityUser?.id && other.securityRole?.id == securityRole?.id
    }

    @Override
    int hashCode() {
        def builder = new HashCodeBuilder()
        if (securityUser) builder.append(securityUser.id)
        if (securityRole) builder.append(securityRole.id)
        builder.toHashCode()
    }

    static SecurityUserSecurityRole get(long securityUserId, long securityRoleId) {
        criteriaFor(securityUserId, securityRoleId).get()
    }

    static boolean exists(long securityUserId, long securityRoleId) {
        criteriaFor(securityUserId, securityRoleId).count()
    }

    private static DetachedCriteria criteriaFor(long securityUserId, long securityRoleId) {
        SecurityUserSecurityRole.where {
            securityUser == SecurityUser.load(securityUserId) &&
                    securityRole == SecurityRole.load(securityRoleId)
        }
    }

    static SecurityUserSecurityRole create(SecurityUser securityUser, SecurityRole securityRole, boolean flush = false) {
        def instance = new SecurityUserSecurityRole(securityUser, securityRole)
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(SecurityUser u, SecurityRole r, boolean flush = false) {
        if (u == null || r == null) return false

        int rowCount = SecurityUserSecurityRole.where { securityUser == u && securityRole == r }.deleteAll()

        if (flush) {
            SecurityUserSecurityRole.withSession { it.flush() }
        }

        rowCount
    }

    static void removeAll(SecurityUser u, boolean flush = false) {
        if (u == null) return

        SecurityUserSecurityRole.where { securityUser == u }.deleteAll()

        if (flush) {
            SecurityUserSecurityRole.withSession { it.flush() }
        }
    }

    static void removeAll(SecurityRole r, boolean flush = false) {
        if (r == null) return

        SecurityUserSecurityRole.where { securityRole == r }.deleteAll()

        if (flush) {
            SecurityUserSecurityRole.withSession { it.flush() }
        }
    }

    static constraints = {
        securityRole validator: { SecurityRole r, SecurityUserSecurityRole ur ->
            if (ur.securityUser == null || ur.securityUser.id == null) return
            boolean existing = false
            SecurityUserSecurityRole.withNewSession {
                existing = SecurityUserSecurityRole.exists(ur.securityUser.id, r.id)
            }
            if (existing) {
                return 'userRole.exists'
            }
        }
    }

    static mapping = {
        id composite: ['securityUser', 'securityRole']
        version false
    }
}
