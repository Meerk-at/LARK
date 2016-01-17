<g:form controller="place" action="searchPlaces" class="col s12 valign center-block">

    <div class="input-field col s11 m6 offset-m3">
        <input autocomplete="on" name="searchQuery"
               placeholder="<g:message code="homepage.static.search.title"/>" id="search_id" type="text"
               class="validate" value="${params.searchQuery}">

    </div>

    <div class="input-field col s1">
        <button type="submit" class="waves-effect waves-teal btn-flat btn-large"><i
                class="medium material-icons theme-color-text text-lighten-2 center">send</i></button>
    </div>
</g:form>