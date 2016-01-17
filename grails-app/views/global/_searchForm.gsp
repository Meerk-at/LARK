<g:form controller="place" action="searchPlaces" class="col s12">
    <div class="row">
        <div class="input-field col s12 m6">
            <input id="searchQuery" name="searchQuery" autocomplete="on"
                   placeholder="<g:message code="homepage.static.search.title"/>" type="text"
                   class="validate" value="${params.searchQuery}">
            <label for="searchQuery">Search</label>
        </div>

        <div class="input-field col s12 m6">
            <select name="numOfPersons">
                <option value="" disabled selected>Choose your option</option>
                <option value="1">1 person</option>
                <option value="2">2 persons</option>
                <option value="3">family</option>
            </select>
            <label>Number of persons</label>
        </div>
    </div>
    <div class="row no-mar">
    <label class="col s12">Available time</label>
    </div>
    <div class="row valign-wrapper">
        <div class="input-field col s12 m6 valign">


            <div id="time-slider">
            </div>

            <p class="left" id="left-value"></p>

            <p class="right" id="right-value"></p>

        </div>

        <div class="center input-field col s12 m6 valign">

            <button class="btn waves-effect waves-light" type="submit" name="action">
                <i class="material-icons right">send</i>Search
            </button>

        </div>
    </div>
</g:form>

<script>

    var slider = document.getElementById('time-slider');
    leftSliderValue = document.getElementById('left-value');
    rightSliderValue = document.getElementById('right-value');
    noUiSlider.create(slider, {
        start: [20, 80],
        connect: true,
        step: 1,
        range: {
            'min': 0,
            'max': 100
        },
        format: wNumb({
            decimals: 0,
            prefix: '' //For centering text

        })
    });

    slider.noUiSlider.on('update', function (values, handle) {

        if (handle) {
            rightSliderValue.innerHTML = values[handle]+" minutes";
        } else {
            leftSliderValue.innerHTML = values[handle]+" minutes";
        }
    });
</script>