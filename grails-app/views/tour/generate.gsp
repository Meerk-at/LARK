<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 1/8/16
  Time: 7:57 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Discover</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div id="placeList" class="col s12 m7 l7 scrollable-section">
            <div class="row">
                <div class="section">
                    <g:render template="/global/tourForm"/>
                </div>
            </div>

            <div class="divider"></div>
            <g:each status="i" var="place" in="${places}">
            <div class="row">
                <div id="section-${i}" class="section">
                    <h4>${i+1}. ${place.title}</h4>
                    <g:render template="/content/contentListTemplate" model="['contents': place.contents]"/>
                    <div class="divider"></div>
                </div>
            </div>
            </g:each>
        </div>

        <div class="col m5 hide-on-small-and-down scrollable-section">
            <g:render template="/location/mapPlaces" model="['places': places]"/>
        </div>
        <div class="fixed-action-btn click-to-toggle" style="bottom: 45px; right: 100px;">
            <a target="_blank" id="navigation-button" class="btn-floating btn-large blue" href="">
                <i class="large material-icons tooltipped" data-tooltip="Navigate" data-position="left" data-delay="50">navigation</i>
            </a>
        </div>
    </div>
</div>
<script>
    $(document).ready(function (){
        var googleUrl = "https://www.google.com/maps/dir";

        <g:each in="${places}" var="place" status="i">
            googleUrl = googleUrl.concat('/${place.location.latitude},${place.location.longitude}');

            $("#section-${i}").mouseover(selectMarker(mapMarkers[${i}], mapPopups[${i}]));
            $("#section-${i}").click(function () {
                mapPopups[${i}].openOn(mapShow);
            });
            $("#section-${i}").mouseout(deselectMarker(mapMarkers[${i}], mapPopups[${i}]));

            mapMarkers[${i}].on('click', function (e) {
                var offset = $("#section-${i}").offset();
                var $main = $('#placeList');
                $("#placeList").animate({
                    scrollTop: offset.top - ($main.offset().top - $main.scrollTop())
                }, 1000);
            });
        </g:each>
//        googleUrl = googleUrl.concat('&directionsmode=walking');
        $('#navigation-button').attr("href", googleUrl);
        });
</script>
</body>
</html>