import gr.meerkat.Guide
import gr.meerkat.SecurityRole
import gr.meerkat.SecurityUser
import gr.meerkat.SecurityUserSecurityRole
import gr.meerkat.User

class BootStrap {

    def init = {
        /*def adminRole = new SecurityRole('ROLE_ADMIN').save()
        def userRole = new SecurityRole('ROLE_USER').save()
        def appUser = new User(firstName: 'Dimitris', lastName: 'Floros',eMail: 'me@me.gr').save()
        def appGuide = new Guide(firstName: 'Spiros', lastName: 'Bond',eMail: 'me@me.gr').save()
        def appAdmin = new Guide(firstName: 'Kostas', lastName: 'Mylo',eMail: 'me@me.gr').save()
        def testUser = new SecurityUser('dim', 'password');
        def testUser2 = new SecurityUser('spi', 'password');
        def testUser3 = new SecurityUser('kos', 'password');
        testUser.appUser = appUser;
        testUser2.appUser = appGuide;
        testUser3.appUser = appAdmin;
        testUser.save();
        testUser2.save();
        testUser3.save();
        SecurityUserSecurityRole.create testUser, userRole, true
        SecurityUserSecurityRole.create testUser2, userRole, true
        SecurityUserSecurityRole.create testUser3, adminRole, true
*/
    }
    def destroy = {
    }
}
