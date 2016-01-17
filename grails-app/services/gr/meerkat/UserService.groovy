package gr.meerkat

import grails.transaction.Transactional

import javax.print.DocFlavor.STRING

@Transactional
class UserService {

    def isGuide(username) {
        def activeAppUser;
        if (username!="") {
            def activeSecurityUser = gr.meerkat.SecurityUser.findByUsername(username);

            activeAppUser = activeSecurityUser.appUser;
        }else{
            activeAppUser = null;
        }

        return activeAppUser.instanceOf(Guide);
    }

    def getUser(username) {
        def activeAppUser;
        if (username!="") {
            def activeSecurityUser = gr.meerkat.SecurityUser.findByUsername(username);

            activeAppUser = activeSecurityUser.appUser;
        }else{
            activeAppUser = null;
        }

        return activeAppUser;
    }

    def isContentBought(username,contentId) {
        def activeAppUser;
        if (username!="") {
            def activeSecurityUser = gr.meerkat.SecurityUser.findByUsername(username);

            activeAppUser = activeSecurityUser.appUser;
        }else{
            activeAppUser = null;
        }
        def content = Content.get(contentId);

        return activeAppUser.boughtContents.contains(content);
    }
}
