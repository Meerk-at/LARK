<g:if test="${images.size() > 0}">
    <div class="slider" id="${content.id}">
        <ul class="slides">
            <g:each var="image" in="${images}" status="i">
                <li>
                    <g:if test="${image.url.startsWith("http")}">
                        <img src="${image.url}">
                    </g:if>
                    <g:else>
                        <img src="${createLink(controller: 'place', action: 'loadImages', params: [imageName: image.url])}"/>
                    </g:else>
                    <div class="caption left-align">
                        <h5 class="light white-text clear-text-shadow"><strong>${image.description}</strong></h5>
                        %{--<h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>--}%
                    </div>
                </li>
            </g:each>
        </ul>
    </div>
</g:if>