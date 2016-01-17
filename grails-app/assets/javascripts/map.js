/**
 * Created by spirosbond on 1/8/16.
 */

function initMap(map) {
    map.setView([40.62229, 22.93396], 12);
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoic3B5ZGlrbyIsImEiOiJjaWo0ZGo0dWowMDE4dzNtM3pyYnNpOGI4In0.x2Tzfe-TuoQI-eJi7yWdCg', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1Ijoic3B5ZGlrbyIsImEiOiJjaWo0ZGo0dWowMDE4dzNtM3pyYnNpOGI4In0.x2Tzfe-TuoQI-eJi7yWdCg'
    }).addTo(map);

}

function selectMarker(marker, popup) {
    return function () {
        marker.setIcon(new L.Icon({
            iconUrl: '/assets/marker-selected.png',
            iconAnchor: new L.point(13, 26)
        }));
        marker.bindPopup(popup, {offset: new L.point(0, -18)});
    }
}

function deselectMarker(marker, popup) {
    return function () {
        marker.setIcon(new L.Icon({
            iconUrl: '/assets/marker.png',
            iconAnchor: new L.point(13, 26)
        }));
        marker.bindPopup(popup, {offset: new L.point(0, -18)});
    }
}

function fitMap(map, latLngs){
    map.fitBounds(new L.LatLngBounds(latLngs));
    //map.panInsideBounds(new L.LatLngBounds(latLngs));
}

function getUserPositionMarker(){
    var userPositionMarker = new L.marker(userPosition, {
        icon: new L.Icon({
            iconUrl: '/assets/here-dot.png',
            iconAnchor: new L.point(5, 5)
        }),
        title: 'You are here'
    });
    var userPositionPopup = new L.popup().setLatLng(userPosition).setContent('You are here');
    userPositionMarker.bindPopup(userPositionPopup);
    return userPositionMarker;
}