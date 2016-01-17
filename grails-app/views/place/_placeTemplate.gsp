<body>
<g:each in="${places}">

    <div class="row">
        <div class="col s12 m6">
            <div class="card blue-grey darken-1">
                <div class="card-content white-text">
                    <span class="card-title">${it.title}</span>
                    <p>${it.location.address}
                        <g:each in="${it.categories}">
                        ${it}
                        </g:each></p>
                </div>
                <div class="card-action">
                    <a href="#">This is a link</a>
                    <a href="#">This is a link</a>
                </div>
            </div>
        </div>
    </div>
</g:each>