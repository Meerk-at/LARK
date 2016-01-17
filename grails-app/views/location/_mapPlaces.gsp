<div id="mapShow" style="height: 100%;width:100%"></div>

<script>

    var mapShow = new L.map('mapShow');
    var oms = new OverlappingMarkerSpiderfier(mapShow, {
        keepSpiderfied: true,
        nearbyDistance: 25
    });
    var mapMarkers = [];
    var mapPopups = [];
    var latLngs = [];

    initMap(mapShow);

    <g:each in="${places}" var="place" status="i">
    var latLng = new L.latLng(${place.location.latitude}, ${place.location.longitude});
    latLngs.push(latLng);

    var marker = new L.marker(latLng, {
        icon: new L.Icon({
            iconUrl: '/assets/marker.png',
            iconAnchor: new L.point(13, 26)
        }),
        title: '${place.title}'
    });

    var popup = new L.popup({
        offset: new L.point(0, -18)
    }, marker).setLatLng(latLng).setContent('<a class="black-text" href="<g:createLink controller="content" action="contents" params="[id: place.id]"/>"><b>${place.title}</b><i class="red-text text-lighten-1 small material-icons">info_outline</i></a>');
    mapPopups.push(popup);

    marker.bindPopup(popup, {offset: new L.point(0, -18)});

    marker.on('mouseover', selectMarker(marker, popup));
    marker.on('mouseout', deselectMarker(marker, popup));

    mapMarkers.push(marker);

    marker.addTo(mapShow);

    oms.addListener('click', function (marker) {
        mapShow.openPopup(marker.getPopup());
    });
    oms.addMarker(marker);
    </g:each>

    fitMap(mapShow, latLngs);
    var userPositionMarkerShow = getUserPositionMarker();
    userPositionMarkerShow.addTo(mapShow);
    navigator.geolocation.watchPosition(function(position){
        userPositionMarkerShow.setLatLng(new L.LatLng(position.coords.latitude,position.coords.longitude));
    });
</script>