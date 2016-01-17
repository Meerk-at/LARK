<div class="row">
    <g:if test="${places}">

        <g:each status="i" var="place" in="${places}">
            <div class="col s12 m12 l4">
                <div id="card-${i}" class="card small hoverable blue-grey darken-1 theme-color-text text-lighten-4">
                    <div class="card-image waves-effect waves-block waves-light">
                        <g:if test="${place.image == null}">
                            <asset:image src="no-image.png" class="activator" alt="No Image"/>
                        </g:if>
                        <g:elseif test="${place.image.startsWith("http")}">
                            <img src="${place.image}" class="activator" alt="No Image"/>
                        </g:elseif>
                        <g:else>
                            <img src="${createLink(controller: 'place', action: 'loadImages', params: [imageName: place.image])}" class="activator" alt="No Image"/>
                        </g:else>
                        <span class="card-title-text card-title activator background-container col s12">${place.title}</span>
                    </div>

                    <div class="card-content">
                        <span class="activator"><p class="truncate">${place.location.address}</p><i
                                class="material-icons right white-text"
                                style="cursor: pointer; cursor: hand;">more_vert</i></span>

                        <p><a class="blue-text text-lighten-2"
                              href="<g:createLink controller="content" action="contents"
                                                  params="[id: place.id]"/>">Contents</a></p>
                        <p>
                            <input type="checkbox" class="filled-in" id="filled-in-box-${i}" autocomplete="off"/>
                            <label class="white-text" for="filled-in-box-${i}">Add to Tour</label>
                        </p>
                    </div>

                    <div id="card-reveal-${i}" class="card-reveal">
                        <span class="card-title grey-text text-darken-4">${place.title}<i
                                class="material-icons right">close</i></span>

                        <p class="text-justify">${raw(place.description)}</p>
                    </div>
                </div>
            </div>
        </g:each>
    </g:if>
    <g:else>
        <div class="col s12 m12 l4">
            <div class="card hoverable blue-grey darken-1 red-text text-lighten-3">
                <div class="card-image waves-effect waves-block waves-light">
                    <asset:image src="no-results.png" class="activator" alt="No Image"/>
                    <span class="card-title activator black-text"></span>
                </div>

                <div class="card-content">
                    <span class="activator"><p class="truncate">Even if we searched hard...</p><i
                            class="material-icons right white-text"
                            style="cursor: pointer; cursor: hand;">more_vert</i></span>

                    <p><a class="blue-text text-lighten-2"
                          href="#">...really hard</a></p>
                </div>

            </div>
        </div>
    </g:else>
</div>