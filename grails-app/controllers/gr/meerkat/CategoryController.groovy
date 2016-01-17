package gr.meerkat

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('IS_AUTHENTICATED_ANONYMOUSLY')
class CategoryController {

    static scaffold = Category

}
