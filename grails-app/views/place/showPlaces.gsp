<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 1/8/16
  Time: 7:57 PM
--%>

<%@ page import="gr.meerkat.Place" contentType="text/html;charset=UTF-8" %>
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
                    <g:render template="/global/searchFormSimple"/>
                </div>
            </div>

            <div class="divider"></div>

            <div class="row">
                <div class="section">
                    <g:render template="placeListTemplate" model="['places': places]"/>
                </div>
            </div>
        </div>

        <div class="col m5 hide-on-small-and-down scrollable-section">
            <g:render template="/location/mapPlaces" model="['places': places]"/>
        </div>
    </div>
</div>

<div class="fixed-action-btn click-to-toggle" style="bottom: 45px; right: 100px;">
    <a href="#!" id="tour-floating-button" class="btn-floating btn-large yellow darken-3">
        <i class="large material-icons tooltipped" data-tooltip="Tour Me" data-position="left"
           data-delay="50">call_split</i>
    </a>
</div>
<script>
    var tourPlaces = [];
    <g:each in="${places}" var="place" status="i">

    $("#card-${i}").mouseover(selectMarker(mapMarkers[${i}], mapPopups[${i}]));
    $("#card-${i}").click(function () {
        mapPopups[${i}].openOn(mapShow);
    });
    $("#card-${i}").mouseout(deselectMarker(mapMarkers[${i}], mapPopups[${i}]));

    mapMarkers[${i}].on('click', function (e) {
        var offset = $("#card-${i}").offset();
        var $main = $('#placeList');
        $("#placeList").animate({
            scrollTop: offset.top - ($main.offset().top - $main.scrollTop())
        }, 1000);
        $("#card-${i}").css('overflow', 'hidden');
        $("#card-reveal-${i}").css({display: 'block'}).velocity("stop", false).velocity({translateY: '-100%'}, {
            duration: 300,
            queue: false,
            easing: 'easeInOutQuad'
        });
    });
    $('#filled-in-box-${i}').change(function () {
        if ($(this).is(':checked')) {
            tourPlaces.push(${place.id})
        }
        else {
            var index = tourPlaces.indexOf(${place.id});
            console.log(index);
            if (index > -1) {
                tourPlaces.splice(index, 1);
            }
        }
        var navButton = $("#tour-floating-button");
        if (tourPlaces.length == 0) {
            navButton.attr("href", "#!");
            navButton.attr("target", "");
        } else {
            navButton.attr("href", "/tour/generateList?lat="+userPosition.lat+"&lng="+userPosition.lng);
            navButton.attr("target", "_blank");
            tourPlaces.forEach(function (id) {
                navButton.attr("href", navButton.attr("href") + '&ids=' + id);
            })
        }

    });
    </g:each>
</script>
</body>
</html>