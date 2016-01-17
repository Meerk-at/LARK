package gr.meerkat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Rating_contentController {

    static scaffold = Rating_content
}
