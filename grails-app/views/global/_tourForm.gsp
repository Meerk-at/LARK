<g:form controller="tour" action="generateFromForm" class="col s12">
    <div class="row">
        <div class="input-field col s12">
            <select id="tourStyle" name="tourStyle" required>
                <g:if test="${params.tourStyle.equals('1')}">
                    <option value="" disabled>Choose your tour style</option>
                    <option value="1" selected>Museums</option>
                    <option value="2">Nature</option>
                    <option value="3">Architecture</option>
                    <option value="4">Metropolitan</option>
                    <option value="5">Churches</option>
                    <option value="6">Byzantine Era</option>
                </g:if>
                <g:elseif test="${params.tourStyle.equals('2')}">
                    <option value="" disabled>Choose your tour style</option>
                    <option value="1">Museums</option>
                    <option value="2" selected>Nature</option>
                    <option value="3">Architecture</option>
                    <option value="4">Metropolitan</option>
                    <option value="5">Churches</option>
                    <option value="6">Byzantine Era</option>
                </g:elseif>
                <g:elseif test="${params.tourStyle.equals('3')}">
                    <option value="" disabled>Choose your tour style</option>
                    <option value="1">Museums</option>
                    <option value="2">Nature</option>
                    <option value="3" selected>Architecture</option>
                    <option value="4">Metropolitan</option>
                    <option value="5">Churches</option>
                    <option value="6">Byzantine Era</option>
                </g:elseif>
                <g:elseif test="${params.tourStyle.equals('4')}">
                    <option value="" disabled>Choose your tour style</option>
                    <option value="1">Museums</option>
                    <option value="2">Nature</option>
                    <option value="3">Architecture</option>
                    <option value="4" selected>Metropolitan</option>
                    <option value="5">Churches</option>
                    <option value="6">Byzantine Era</option>
                </g:elseif>
                <g:elseif test="${params.tourStyle.equals('5')}">
                    <option value="" disabled>Choose your tour style</option>
                    <option value="1">Museums</option>
                    <option value="2">Nature</option>
                    <option value="3">Architecture</option>
                    <option value="4">Metropolitan</option>
                    <option value="5" selected>Churches</option>
                    <option value="6">Byzantine Era</option>
                </g:elseif>
                <g:elseif test="${params.tourStyle.equals('6')}">
                    <option value="" disabled>Choose your tour style</option>
                    <option value="1">Museums</option>
                    <option value="2">Nature</option>
                    <option value="3">Architecture</option>
                    <option value="4">Metropolitan</option>
                    <option value="5">Churches</option>
                    <option value="6" selected>Byzantine Era</option>
                </g:elseif>
                <g:else>
                    <option value="" disabled selected>Choose your tour style</option>
                    <option value="1">Museums</option>
                    <option value="2">Nature</option>
                    <option value="3">Architecture</option>
                    <option value="4">Metropolitan</option>
                    <option value="5">Churches</option>
                    <option value="6">Byzantine Era</option>
                </g:else>
            </select>
            <label for="tourStyle">Tour style</label>
        </div>

        <div class="input-field col s12">
            <select id="numOfPersons" name="numOfPersons" required>
                <g:if test="${params.numOfPersons.equals('1')}">
                    <option value="" disabled>Choose your option</option>
                    <option value="1" selected>Lone traveler</option>
                    <option value="2">Couple</option>
                    <option value="3">Family</option>
                    <option value="4">Group of friends</option>
                </g:if>
                <g:elseif test="${params.numOfPersons.equals('2')}">
                    <option value="" disabled>Choose your option</option>
                    <option value="1">Lone traveler</option>
                    <option value="2" selected>Couple</option>
                    <option value="3">Family</option>
                    <option value="4">Group of friends</option>
                </g:elseif>
                <g:elseif test="${params.numOfPersons.equals('3')}">
                    <option value="" disabled>Choose your option</option>
                    <option value="1">Lone traveler</option>
                    <option value="2">Couple</option>
                    <option value="3" selected>Family</option>
                    <option value="4">Group of friends</option>
                </g:elseif>
                <g:elseif test="${params.numOfPersons.equals('4')}">
                    <option value="" disabled>Choose your option</option>
                    <option value="1">Lone traveler</option>
                    <option value="2">Couple</option>
                    <option value="3">Family</option>
                    <option value="4" selected>Group of friends</option>
                </g:elseif>
                <g:else>
                    <option value="" disabled selected>Choose your option</option>
                    <option value="1">Lone traveler</option>
                    <option value="2">Couple</option>
                    <option value="3">Family</option>
                    <option value="4">Group of friends</option>
                </g:else>
            </select>
            <label for="numOfPersons">People</label>
        </div>
    </div>

    <div class="row no-mar">
        <label class="col s12">Available time</label>
    </div>

    <div class="row">
        <div class="input-field col s12">

            <div id="time-slider">
            </div>

            <p class="left" id="left-value"></p>

            <p class="right" id="right-value"></p>
            <input name="minTime" id="minTime" type="text" value="${params.minTime}"
                   hidden readonly>

            <input name="maxTime" id="maxTime" type="text" value="${params.maxTime}"
                   hidden readonly>

        </div>

        <div class="center input-field col s12">

            <input name="lat" id="user-lat-input" type="text" value="0"
                   hidden readonly>

            <input name="lng" id="user-lng-input" type="text" value="0"
                   hidden readonly>

            <button class="btn waves-effect waves-light" type="submit" name="action">
                <i class="material-icons right">send</i>Tour Me
            </button>

        </div>
    </div>
</g:form>

<script>

    var slider = document.getElementById('time-slider');
    var leftSliderLabel = document.getElementById('left-value');
    var rightSliderLabel = document.getElementById('right-value');
    var leftSliderValue = document.getElementById('minTime');
    var rightSliderValue = document.getElementById('maxTime');
    noUiSlider.create(slider, {
        %{--start: [${params.minTime}, ${params.maxTime}],--}%
        start: [60, 150],
        connect: true,
        step: 10,
        range: {
            'min': 30,
            'max': 180
        },
        format: wNumb({
            decimals: 0,
            prefix: '', //For centering text
            encoder: function (a) {
                return Math.round(a * 100) / 100;
            }

        })
    });
    <g:if test="${params.minTime}">
        slider.noUiSlider.set([${params.minTime}, ${params.maxTime}]);
    </g:if>
    slider.noUiSlider.on('update', function (values, handle) {

        if (handle) {
            rightSliderLabel.innerHTML = values[handle] + " minutes";
            rightSliderValue.value = values[handle];
        } else {
            leftSliderLabel.innerHTML = values[handle] + " minutes";
            leftSliderValue.value = values[handle];
        }
    });
</script>