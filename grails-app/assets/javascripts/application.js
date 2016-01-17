// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.1.3.js
//= require_tree .
//= require_self

var userPosition = new L.LatLng(0,0);
navigator.geolocation.getCurrentPosition(function(position) {
    userPosition = new L.LatLng(position.coords.latitude,position.coords.longitude);
    console.log(userPosition);
    Materialize.toast('Your location is acquired!', 3000, 'rounded'); // 'rounded' is the class I'm applying to the toast
    var tourMeFB = $("#tour-floating-button");
    tourMeFB.attr("href",'/tour/generateList?lat='+userPosition.lat+'&lng='+userPosition.lng);
    var userLatInput = document.getElementById('user-lat-input');
    var userLngInput = document.getElementById('user-lng-input');
    userLatInput.value = userPosition.lat;
    userLngInput.value = userPosition.lng;
    //document.getElementById("tour-floating-button").style.display = "";
    Materialize.fadeInImage('#tour-floating-button')
});

navigator.geolocation.watchPosition(function(position){
    userPosition = new L.LatLng(position.coords.latitude,position.coords.longitude);
    var userLatInput = document.getElementById('user-lat-input');
    var userLngInput = document.getElementById('user-lng-input');
    userLatInput.value = userPosition.lat;
    userLngInput.value = userPosition.lng;
});

$(document).ready(function() {
    $('select').material_select();
});

(function($){
    $(function(){

        $('.button-collapse').sideNav();
        $('.parallax').parallax();

    }); // end of document ready
})(jQuery); // end of jQuery name space

/**
 * Create an async call to a controller and returns an HTML template
 * @param controller The name of the controller
 * @param action The name of the action
 * @param params H hash map with the parameters
 * @param sucFun A function to run on success
 * @param errFun A function to run on error
 * @return The function for the ajax call
*/
function meerkatRemoteFunction(controller,action,type,params,sucFun,errFun){
    $.ajax({
        url: '/'+controller+'/'+action,
        data: params,
        type: type,
        dataType: "html",
        success: sucFun,
        error: errFun
    });
}