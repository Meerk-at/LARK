package gr.meerkat

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.sql.Sql

@Secured('IS_AUTHENTICATED_ANONYMOUSLY')
class UserController {

    def springSecurityService

    static scaffold = User

    static allowedMethods = [buyContent: "POST"]

    def dataSource

    def getRatings(long id){
        def c = Rating_content.createCriteria();
        def ratings = c.list {
            user {
                eq('id', id)
            }
        }

        render "${ratings}"
    }

    def getContentsHistory(long id){
        def c = Content.createCriteria();
        def contents = c.list {
            buyingUsers {
                eq('id', id)
            }
        }

        render "${contents}"
    }

    def upgradeUserToGuide(long id){
        def sql = new Sql(dataSource)
        def user = User.get(id)
        def loggedInId = springSecurityService.principal.id
        print loggedInId
        println user.firstName
        if (!user.instanceOf(Guide) && id == loggedInId){
            sql.executeUpdate('update user set class=? where id=?', [Guide.name, id])
        }
        redirect(uri: "/")
    }


}
