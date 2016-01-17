<div class="row">
    <g:if test="${contents}">
        <g:each var="content" in="${contents}" status="i">
            <div class="col s12 m6">

                <div class="card hoverable blue-grey darken-1 waves-effect waves-block waves-light"
                     href="#modal-content-${content.id}" id="modal-trigger-${content.id}">
                    <sec:ifLoggedIn>
                        <userTagLib:ifContentBought username="${sec.username()}" contentId="${content.id}">
                            <script>

                                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                                $('#modal-trigger-${content.id}').leanModal({
                                    ready: function () {

                                        meerkatRemoteFunction('content', 'loadImages', 'GET', {id:${content.id}}, function (data) {
                                            console.log("successsss "+data);
                                            $("#preloader-${content.id}").hide();
                                            document.getElementById('image-slider-${content.id}').innerHTML = data;
                                            $('.slider').slider({full_width: true});
                                        }, function () {

                                        });
                                        meerkatRemoteFunction('content', 'loadTexts', 'GET', {id:${content.id}}, function (data) {
                                            console.log("successsss "+data);
                                            document.getElementById('texts-${content.id}').innerHTML = data;
                                        }, function () {

                                        });

                                    }
                                });

                            </script>
                        </userTagLib:ifContentBought>
                    </sec:ifLoggedIn>

                    <div class="card-content white-text">
                        <div class="row">
                            <div class="col s12 truncate">
                                <span class="card-title ">${content.title}</span>
                            </div>

                            <div class="col">
                                <input id="input-id-${content.id}" class="rating" type="number" data-size="xs"
                                       data-min="0"
                                       data-max="5"
                                       data-step="0.5" data-show-caption="false" data-glyphicon="false">
                                <script>
                                    $("#input-id-${content.id}").rating({disabled: true});
                                    %{--$("#input-id-${i}").rating('rate', ${contentTagLib.getContentRating(id: content.id)});--}%
                                    $("#input-id-${content.id}").rating('update', ${contentTagLib.getContentRating(id: content.id)});
                                </script>
                            </div>

                            <div class="col s12">
                                <p>${content.text}</p>
                            </div>
                        </div>
                    </div>

                    <div class="card-action valign-wrapper">

                        <sec:ifLoggedIn>
                            <userTagLib:ifContentBought username="${sec.username()}" contentId="${content.id}">
                                <g:if test="${content.price == 0}">
                                    <a href="#">Free</a>
                                </g:if>
                                <g:else>
                                    <a href="#!">${content.price} &euro;</a>
                                </g:else>
                                <i class="material-icons white-text tooltipped" data-position="right"
                                   data-delay="50" data-tooltip="Bought">done</i>
                                <script>
                                    $('#input-id-${content.id}').rating('refresh', {disabled: false});
                                    $('#input-id-${content.id}').on('rating.change', function (event, value, caption) {
                                        meerkatRemoteFunction('content', 'addRating', 'POST', {
                                            id: ${content.id},
                                            comment: "",
                                            value: value,
                                            userId: ${userTagLib.getAppUser(username: sec.username()).id}
                                        }, function (data) {
                                            console.log('successYo' + data);

                                        }, function (xhr, status) {
                                            console.error(xhr);
                                            console.error('errorYo' + status);
                                        });
                                    });
                                </script>
                            </userTagLib:ifContentBought>
                            <userTagLib:ifContentNotBought username="${sec.username()}" contentId="${content.id}">
                                <g:if test="${content.price == 0}">
                                    <a href="#" onclick="meerkatRemoteFunction('content', 'buyContent', 'POST', {
                                        id: ${content.id},
                                        userId: ${userTagLib.getAppUser(username: sec.username()).id}
                                    }, function (data) {
                                        console.log('successYo' + data);
                                        Materialize.fadeInImage('#bought-icon-${content.id}');
                                        $('#input-id-${content.id}').rating('refresh', {disabled: false});
                                        $('#input-id-${content.id}').on('rating.change', function (event, value, caption) {
                                            meerkatRemoteFunction('content', 'addRating', 'POST', {
                                                id: ${content.id},
                                                comment: '',
                                                value: value,
                                                userId: ${userTagLib.getAppUser(username: sec.username()).id}
                                            }, function (data) {
                                                console.log('successYo' + data);

                                            }, function (xhr, status) {
                                                console.error(xhr);
                                                console.error('errorYo' + status);
                                            });
                                        });
                                        $('#modal-trigger-${content.id}').leanModal({
                                    ready: function () {

                                        meerkatRemoteFunction('content', 'loadImages', 'GET', {id:${content.id}}, function (data) {
                                            console.log('successsss '+data);
                                            $('#preloader-${content.id}').hide();
                                            document.getElementById('image-slider-${content.id}').innerHTML = data;
                                            $('.slider').slider({full_width: true});
                                        }, function () {

                                        });
                                        meerkatRemoteFunction('content', 'loadTexts', 'GET', {id:${content.id}}, function (data) {
                                            console.log('successsss '+data);
                                            document.getElementById('texts-${content.id}').innerHTML = data;
                                        }, function () {

                                        });

                                    }
                                });

                                    }, function (xhr, status) {
                                        console.error(xhr);
                                    })">Free</a>
                                </g:if>
                                <g:else>
                                    <a href="#" onclick="meerkatRemoteFunction('content', 'buyContent', 'POST', {
                                        id: ${content.id},
                                        userId: ${userTagLib.getAppUser(username: sec.username()).id}
                                    }, function (data) {
                                        console.log('successYo' + data);
                                        Materialize.fadeInImage('#bought-icon-${i}');
                                        $('#input-id-${content.id}').rating('refresh', {disabled: false});
                                        $('#input-id-${content.id}').on('rating.change', function (event, value, caption) {
                                            meerkatRemoteFunction('content', 'addRating', 'POST', {
                                                id: ${content.id},
                                                comment: '',
                                                value: value,
                                                userId: ${userTagLib.getAppUser(username: sec.username()).id}
                                            }, function (data) {
                                                console.log('successYo' + data);

                                            }, function (xhr, status) {
                                                console.error(xhr);
                                                console.error('errorYo' + status);
                                            });
                                        });
                                        $('#modal-trigger-${content.id}').leanModal({
                                    ready: function () {

                                        meerkatRemoteFunction('content', 'loadImages', 'GET', {id:${content.id}}, function (data) {
                                            console.log('successsss '+data);
                                            $('#preloader-${content.id}').hide();
                                            document.getElementById('image-slider-${content.id}').innerHTML = data;
                                            $('.slider').slider({full_width: true});
                                        }, function () {

                                        });
                                        meerkatRemoteFunction('content', 'loadTexts', 'GET', {id:${content.id}}, function (data) {
                                            console.log('successsss '+data);
                                            document.getElementById('texts-${content.id}').innerHTML = data;
                                        }, function () {

                                        });

                                    }
                                });

                                    }, function (xhr, status) {
                                        console.error(xhr);
                                    })">${content.price} &euro;</a>
                                </g:else>
                            </userTagLib:ifContentNotBought>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <g:if test="${content.price == 0}">
                                <a href="/login/auth">Free</a>
                            </g:if>
                            <g:else>
                                <a href="/login/auth">${content.price} &euro;</a>
                            </g:else>
                        </sec:ifNotLoggedIn>
                        <i id="bought-icon-${content.id}" class="material-icons white-text"
                           style="opacity:0;">done</i>
                    </div>
                </div>
            </div>
            <sec:ifLoggedIn>
                <div id="modal-content-${content.id}" class="modal modal-fixed-footer">
                    <div class="modal-content">
                        <h4>${content.title}</h4>
                        <input id="modal-input-id-${content.id}" class="rating" type="number" data-size="xs"
                               data-min="0"
                               data-max="5"
                               data-step="0.5" data-show-caption="false" data-glyphicon="false">
                        <script>

                            $("#modal-input-id-${content.id}").rating('update', ${contentTagLib.getContentRating(id: content.id)});

                            $("#modal-input-id-${content.id}").on('rating.change', function (event, value, caption) {
                                meerkatRemoteFunction('content', 'addRating', "POST", {
                                    id: ${content.id},
                                    comment: "",
                                    value: value,
                                    userId: ${userTagLib.getAppUser(username: sec.username()).id}
                                }, function (data) {
                                    console.log('successYo' + data);

                                }, function (xhr, status) {
                                    console.error(xhr);
                                    console.error('errorYo' + status);
                                });
                            });
                        </script>


                        <div id="preloader-${content.id}" class="preloader-wrapper big active">
                            <div class="spinner-layer spinner-blue-only">
                                <div class="circle-clipper left">
                                    <div class="circle"></div>
                                </div>

                                <div class="gap-patch">
                                    <div class="circle"></div>
                                </div>

                                <div class="circle-clipper right">
                                    <div class="circle"></div>
                                </div>
                            </div>
                        </div>

                        <div id="image-slider-${content.id}" class="row-fluid">

                        </div>

                        <div id="texts-${content.id}" class="row-fluid">

                        </div>

                    </div>

                    <div class="modal-footer">
                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
                    </div>
                </div>
            </sec:ifLoggedIn>
        </g:each>
        <sec:ifLoggedIn>
            <userTagLib:ifGuide username="${sec.username()}">
                <div class="col s12 m6">
                    <div class="card blue-grey lighten-2">
                        <div class="card-content white-text">
                            <span class="card-title">New Content</span>

                            <p>Add a new content for this place.</p>
                        </div>

                        <div class="card-action">
                            <a href="#">Add</a>
                        </div>
                    </div>
                </div>
            </userTagLib:ifGuide>
        </sec:ifLoggedIn>
    </g:if>
    <g:else>
        <div class="col s12 m6">
            <div class="card grey darken-1">
                <div class="card-content white-text">
                    <span class="card-title">No content</span>

                    <p>Sorry, we were unable to find a content for this place.</p>
                </div>

                <div class="card-action">
                    <sec:ifLoggedIn>
                        <userTagLib:ifGuide username="${sec.username()}">
                            <a href="#">Add one</a>
                        </userTagLib:ifGuide>
                    </sec:ifLoggedIn>
                </div>
            </div>
        </div>
    </g:else>
</div>