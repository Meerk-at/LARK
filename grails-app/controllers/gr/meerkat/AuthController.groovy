package gr.meerkat

import grails.plugin.springsecurity.annotation.Secured

@Secured('IS_AUTHENTICATED_ANONYMOUSLY')
class AuthController {

    def register() {

    }

    def addUser(String username, String password, String firstName, String lastName, String eMail) {
        def appUser = new User(firstName: firstName, lastName: lastName, eMail: eMail).save();
        def testUser = new SecurityUser(username, password)
        testUser.appUser = appUser;
        testUser.save();
        def userRole = SecurityRole.get(2);
        SecurityUserSecurityRole.create testUser, userRole, true
        redirect(uri: "/")
    }
}
