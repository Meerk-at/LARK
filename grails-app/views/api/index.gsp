<%--
  Created by IntelliJ IDEA.
  User: mylo
  Date: 16/1/2016
  Time: 6:30 μμ
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Lark Api</title>
    <meta name="layout" content="main"/>
</head>

<body>
<h1 class="teal-text text-lighten-2 center-align">LARK API</h1>
<div class="card-panel">
<div><p class="flow-text">Lark provides data for POIs in Thessaloniki city via this api in json format. There are 2 kinds of queries:
<ul class="collection">
    <li class="collection-item">Category query</li>
    <li class="collection-item">Place by category query</li>
</ul>
</p>
</div>
<div>
    <h4 class="text-lighten-2 left-align">Category query</h4>
    <p>Api user can see all the categories of POIs and use their ids for further queries.</p>
    <p>Example query: <a href="http://lark.gr/api/categories">http://lark.gr/api/categories</a></p>
</div>

<div>
    <h4 class="text-lighten-2 left-align">Places by category</h4>
    <p>Api user can see all the places which belong in the requested category </p>
    <p>Example query: <a href="http://lark.gr/api/placesByCategory?catId=1">http://lark.gr/api/placesByCategory?catId=1</a>
    ,where catId should be the id of the desired category.</p>
</div>
</div>
</body>
</html>