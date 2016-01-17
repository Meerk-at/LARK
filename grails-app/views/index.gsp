<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
        <div class="container">
            <br><br>

            <h1 class="header center white-text text-lighten-2" style="font-weight: bold;"><g:message code="homepage.static.title"/></h1>

            <div class="row center">
                <h5 class="header col s12 light" style="font-weight: bold;"><g:message code="homepage.static.subtitle"/></h5>
            </div>

        </div>
    </div>

    <div class="parallax"><asset:image src="background1.jpg" alt="Unsplashed background img 1"/></div>
</div>

<div class="container">
    <div class="section">

        <div class="container">
            <div class="container">
                <div class="section">
                    <g:render template="/global/tourForm"/>
                </div>
            </div>
        </div>

        <div class="divider"></div>

        <div class="row center">
            <div class="section">
                <h5>Landmark search</h5>
            </div>
        </div>

        <div class="row center">
            <g:render template="/global/searchFormSimple"/>

        </div>
        <!--   Icon Section   -->
        <div class="row">

        </div>

    </div>
</div>

<div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
        <div class="container">
            <div class="row center">
                <h5 class="header col s12 light"><g:message code="homepage.static.header1"/></h5>
            </div>
        </div>
    </div>

    <div class="parallax"><asset:image src="background2.jpg" alt="Unsplashed background img 2"/></div>
</div>

<div class="container">
    <div class="section">

        <div class="row">
            <div class="col s12 m3">
                <div class="icon-block">
                    <h2 class="center theme-color-text text-lighten-2"><i class="material-icons">schedule</i></h2>
                    <h5 class="center"><g:message code="homepage.static.icon1.title"/></h5>

                    <p class="light text-justify"><g:message code="homepage.static.icon1.content"/></p>
                </div>
            </div>

            <div class="col s12 m3">
                <div class="icon-block">
                    <h2 class="center theme-color-text text-lighten-2"><i class="material-icons">perm_identity</i></h2>
                    <h5 class="center"><g:message code="homepage.static.icon2.title"/></h5>

                    <p class="light text-justify"><g:message code="homepage.static.icon2.content"/></p>
                </div>
            </div>

            <div class="col s12 m3">
                <div class="icon-block">
                    <h2 class="center theme-color-text text-lighten-2"><i class="material-icons">language</i></h2>
                    <h5 class="center"><g:message code="homepage.static.icon3.title"/></h5>

                    <p class="light text-justify"><g:message code="homepage.static.icon3.content"/></p>
                </div>
            </div>

            <div class="col s12 m3">
                <div class="icon-block">
                    <h2 class="center theme-color-text text-lighten-2"><i class="material-icons">grade</i></h2>
                    <h5 class="center"><g:message code="homepage.static.guides.title"/></h5>

                    <p class="light text-justify"><g:message code="homepage.static.guides.content"/></p>

                </div>
            </div>
        </div>

    </div>
</div>


<div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
        <div class="container">
            <div class="row center">
                <h5 class="header col s12 light"><g:message code="homepage.static.header2"/></h5>
            </div>
        </div>
    </div>

    <div class="parallax"><asset:image src="background3.jpg" alt="Unsplashed background img 3"/></div>
</div>
</body>
</html>