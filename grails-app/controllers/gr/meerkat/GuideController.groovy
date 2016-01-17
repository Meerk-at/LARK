package gr.meerkat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class GuideController {

    static scaffold = Guide

    static allowedMethods = [addContent: "POST"]

    def findGuideByFirstName(String firstName) {
        def c = Guide.createCriteria()

        def guides = c.list {
            like("firstName", "%" + firstName + "%")
            order("firstName", "desc")
        }
        render "${guides}"
    }

    def findGuideByLastName(String lastName) {
        def c = Guide.createCriteria()

        def guides = c.list {
            like("lastName", "%" + lastName + "%")
            order("lastName", "desc")
        }
        render "${guides}"
    }

    def findGuideByUserName(String userName) {
        def c = Guide.createCriteria()

        def guides = c.list {
            like("userName", "%" + userName + "%")
            order("userName", "desc")
        }
        render "${guides}"
    }

}
