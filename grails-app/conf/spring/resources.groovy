// Place your Spring DSL code here
import org.springframework.boot.context.embedded.FilterRegistrationBean
import org.springframework.core.Ordered
import org.springframework.web.filter.CharacterEncodingFilter
beans = {
/*

    multipartResolver(org.springframework.web.multipart.commons.CommonsMultipartResolver){
        maxInMemorySize=1000000
        maxUploadSize=100000000
        //uploadTempDir="/tmp"
    }
*/

    characterEncodingFilter(FilterRegistrationBean) {
        filter = bean(CharacterEncodingFilter) {
            encoding = "UTF-8"
            forceEncoding = true
        }
        urlPatterns = ['/*']
        order = Ordered.HIGHEST_PRECEDENCE + 10
    }
}
