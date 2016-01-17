<%--
  Created by IntelliJ IDEA.
  User: dimflo
  Date: 1/8/16
  Time: 5:42 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Contents</title>

</head>

<body>

<div class="container">
    <div class="row">
        <div class="col  s12 m12 red-text text-lighten-2">
            <h1 class="theme-color-text">${place.title}</h1>
        </div>
    </div>
    <g:render template="contentListTemplate" model="[contents:place.contents]"/>
</div>

</body>


</html>