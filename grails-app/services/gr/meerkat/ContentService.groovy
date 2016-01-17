package gr.meerkat

import grails.transaction.Transactional

@Transactional
class ContentService {

    def getRating(long id) {
        def c = Rating_content.createCriteria();
        def ratings = c.list {
            content {
                eq('id', id)
            }
        }
        def mean = 0;
        def counter = 0;
        for(Rating_content rating : ratings){
            mean +=rating.value;
            counter++;
        }
        if(counter>0){
            mean = mean/counter;
        }
        return mean;
    }
}
