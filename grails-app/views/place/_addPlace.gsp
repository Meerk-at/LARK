<%@ page import="gr.meerkat.Category" %>
<div id="addPlace" class="modal bottom-sheet" style="max-height: 100%">
    <div class="modal-content">

        <h4 id="newPlaceHeader" data-position="bottom" data-delay="50"
            data-tooltip="Point the place by clicking on the map:">Add New Place</h4>

        <div class="row">
            <div id="map-add" style="height: 40vh;width:100%"></div>
        </div>
        <g:uploadForm controller="place" action="addPlace" class="col s12">
            <div class="row">

                <div class="input-field col s12 m12 l6">
                    <i class="material-icons prefix">room</i>
                    <input id="title" type="text" class="validate" name="title" required>
                    <label for="title">Title</label>
                </div>

                <div class="input-field col s6 m6 l3">
                    <i class="material-icons prefix">my_location</i>
                    <input value=" " id="latitude" type="text" name="latitude" class="validate" required readonly>
                    <label class="active" for="latitude">Latitude</label>
                </div>

                <div class="input-field col s6 m6 l3">
                    <input value=" " id="longitude" type="text" name="longitude" class="validate" required readonly>
                    <label class="active" for="longitude">Longitude</label>
                </div>

                <div class="input-field col s12 m12 l6">
                    <select multiple name="categories" id="categories">
                        <option value="" disabled selected>Choose one or more Categories</option>
                        <g:each in="${Category.all}">
                            <option value="${it.id}">${it}</option>
                        </g:each>
                    </select>
                    <label for="categories">Category</label>
                </div>

                <div class="file-field input-field col s12 m12 l6">
                    <div class="btn"><span>Image</span>
                        <input name="image_actual" type="file" id="image_actual" value="Image">
                    </div>

                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>

                <iframe id="hidden-upload-frame" name="hidden-upload-frame" style="display: none" onload="onUploadComplete">
                </iframe>

                <div class="file-field input-field col s12">
                    <textarea id="Description" name="description" class="materialize-textarea"
                              placeholder="Write a fresh description..."></textarea>
                    <label for="Description">Description</label>
                </div>
            </div>

            <div class="modal-footer">
                <button type="submit" class="modal-action waves-effect waves-teal btn-flat">Save</button>
                <a href="#" class="red white-text modal-close waves-effect waves-teal btn-flat">Cancel</a>
            </div>

        </g:uploadForm>

    </div>
</div>
<script type="text/javascript">
    function onUploadComplete(e) {
        // Handle upload complete
        alert("upload complete");
        // Evaluate iframe content or fire another ajax call to get the details for the previously uploaded file
    }
</script>
<script>

    var mapAdd = new L.map('map-add');
    var latLngAdd;
    var myTooltip;
    initMap(mapAdd);

    function onMapClick(e) {
        latLngAdd = e.latlng;
        var marker = new L.marker(latLngAdd, {
            icon: new L.Icon({
                iconUrl: '/assets/marker.png',
                iconAnchor: new L.point(13, 26)
            }),
            title: 'New Place',
            draggable: true
        });
        marker.on('dragend', function () {
            latLngAdd = marker.getLatLng();
            $("#latitude").val(latLngAdd.lat);
            $("#longitude").val(latLngAdd.lng);
        });
        marker.addTo(mapAdd);
        mapAdd.off('click', onMapClick);
        $("#latitude").val(latLngAdd.lat);
        $("#longitude").val(latLngAdd.lng);
    }

    mapAdd.on('click', onMapClick);

    function modalLoaded() {
        mapAdd.invalidateSize();
        myTooltip.mouseover();
    }

    $(document).ready(function () {
        myTooltip = $('#newPlaceHeader').tooltip();
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $("#addPlaceFB").leanModal({
            ready: modalLoaded,
            complete: function () {
                myTooltip.mouseout();
            } // Callback for Modal close
        });
    });

    var userPositionMarkerAdd = getUserPositionMarker();
    userPositionMarkerAdd.addTo(mapAdd);
    navigator.geolocation.watchPosition(function(position){
        userPositionMarkerAdd.setLatLng(new L.LatLng(position.coords.latitude,position.coords.longitude));
    });
</script>