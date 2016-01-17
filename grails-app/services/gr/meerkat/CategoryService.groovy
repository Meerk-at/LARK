package gr.meerkat

import grails.transaction.Transactional

@Transactional
class CategoryService {

    def findCategoryLikeTitle(String title) {
        Category.findAllByTitleIlike("%"+title+"%");
    }
}
