<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Welcome To Lark</title>

    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <asset:stylesheet src="materialize.css"/>
    <asset:stylesheet src="nouislider.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="jquery-ui.css"/>
    <asset:stylesheet src="style.css"/>

    <asset:javascript src="materialize.js"/>
    <asset:javascript src="nouislider.js"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="application.js"/>

    <asset:javascript src="leaflet.js"/>
    <asset:javascript src="map.js"/>
    <asset:stylesheet src="leaflet.css"/>

    <asset:javascript src="star-rating.min.js"/>
    <asset:stylesheet src="star-rating.min.css"/>

    %{--Import Polymer resources here. See bower_components in assets for full list.
    To install new component got inside assets folder and run
        bower install --save PolymerElements/%componentname%
    Full element list: https://elements.polymer-project.org/    --}%
    %{--<link rel="import" href="${assetPath(src: 'paper-header-panel/paper-header-panel.html')}">--}%
    %{--<link rel="import" href="${assetPath(src: 'paper-toolbar/paper-toolbar.html')}">--}%
    %{--<link rel="import" href="${assetPath(src: 'iron-flex-layout/iron-flex-layout.html')}">--}%

    <g:layoutHead/>
</head>

<body>

<g:render template="/global/navbar"/>
<g:layoutBody/>
<g:render template="/global/footer"/>

<sec:ifLoggedIn>
    <userTagLib:ifGuide username="${sec.username()}">
        <div class="fixed-action-btn click-to-toggle" style="bottom: 45px; right: 25px;">
            <a class="btn-floating btn-large theme-color">
                <i class="large material-icons">add</i>
            </a>
            <ul>
                <li><a class="btn-floating yellow darken-3 tooltipped modal-trigger" href="#addPlace" id="addPlaceFB"
                       data-tooltip="Add Place" data-position="left" data-delay="50"><i class="material-icons">room</i>
                </a></li>
                <li><a class="btn-floating teal tooltipped modal-trigger" id="addContentFB" href="#addContent" data-tooltip="Add Content" data-position="left"
                       data-delay="50"><i class="material-icons">dashboard</i></a></li>
            </ul>
        </div>

        <g:render template="/place/addPlace"/>
        <g:render template="/content/addContent"/>
    </userTagLib:ifGuide>

</sec:ifLoggedIn>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

<script>
    if (typeof jQuery !== 'undefined') {
        (function ($) {
            $('#spinner').ajaxStart(function () {
                $(this).fadeIn();
            }).ajaxStop(function () {
                $(this).fadeOut();
            });
        })(jQuery);

    }
</script>
</body>
</html>
