<%@ page import="gr.meerkat.User" %>
<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 12/22/15
  Time: 8:15 PM
--%>

<ul id="dropdown1" class="dropdown-content">
    <li><a href="#!">Dashboard</a></li>
    <sec:ifLoggedIn>
    <userTagLib:ifNotGuide username="${sec.username()}">
    <li><a href="/user/upgradeUserToGuide/${userTagLib.getAppUser(username: sec.username()).id}">Become Guide</a></li>
    </userTagLib:ifNotGuide>
    </sec:ifLoggedIn>
    <li class="divider"></li>
    <form action="/logout" name="logoutForm" method="post"><li><a onclick="document.logoutForm.submit();">Sing Out</a></li></form>
</ul>

<nav role="navigation" class="theme-color">
    <div class="nav-wrapper container">
        <a id="logo-container" href="/" class="brand-logo"><img  style="padding-top: 6px" src="${assetPath(src: 'lark_logo_nav.png')}"></a>
        <ul class="right hide-on-med-and-down">
            <li class="${(controllerName == null && actionName == null ? 'active' : '')}"><a href="/">Home</a></li>
            <li class="${(controllerName == 'place' && (actionName == 'showPlaces'||actionName == 'showNearby'||actionName == 'searchPlaces') ? 'active' : '')}"><a id="mapNearbyMain" href="/place/showNearby">Explore</a></li>
            <sec:ifLoggedIn>
                <li><a class="dropdown-button" href="#!" data-activates="dropdown1">${userTagLib.getAppUser(username: sec.username()).firstName}<i class="material-icons right">arrow_drop_down</i></a></li>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li class="${(controllerName == 'login' && actionName == 'auth' ? 'active' : '')}"><a href="/login/auth">Sign In</a></li>
                <li class="${(controllerName == 'auth' && actionName == 'register' ? 'active' : '')}"><a href="/auth/register">Register</a></li>
            </sec:ifNotLoggedIn>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li class="${(controllerName == null && actionName == null ? 'active' : '')}"><a href="/">Home</a></li>
            <li class="${(controllerName == 'place' && (actionName == 'showPlaces'||actionName == 'showNearby'||actionName == 'searchPlaces') ? 'active' : '')}"><a id="mapNearbyMobile" href="/place/showNearby">Explore</a></li>
            <sec:ifLoggedIn>
                <li><a href="#!">Dashboard</a></li>
                <form action="/logout" name="logoutForm2" method="post"><li><a onclick="document.logoutForm2.submit();">Sing Out</a></li></form>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li class="${(controllerName == 'login' && actionName == 'auth' ? 'active' : '')}"><a href="/login/auth">Sign In</a></li>
                <li class="${(controllerName == 'auth' && actionName == 'register' ? 'active' : '')}"><a href="/auth/register">Register</a></li>
            </sec:ifNotLoggedIn>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>

</nav>
