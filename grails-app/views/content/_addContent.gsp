<%@ page import="gr.meerkat.Place" %>
<div id="addContent" class="modal bottom-sheet" style="height: 50vh">
    <g:form controller="place" action="addContent" class="col s12">
        <div class="modal-content">

            <h4>Add New Content</h4>


            <div class="row">
                <div class="input-field col s12">
                    <select required id="place" name="place" required>
                        <option value="" disabled selected>Choose the Place</option>

                        <g:each in="${Place.all}">
                            <option value="${it.id}">${it}</option>
                        </g:each>

                        <optgroup label="team 1">
                            <option value="1">Option 1</option>
                            <option value="2">Option 2</option>
                        </optgroup>
                        <optgroup label="team 2">
                            <option value="3">Option 3</option>
                            <option value="4">Option 4</option>
                        </optgroup>
                    </select>
                    <label for="place">Places</label>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button type="submit" class="modal-action waves-effect waves-teal btn-flat">Save</button>
            <a href="#" class="red white-text modal-close waves-effect waves-teal btn-flat">Cancel</a>
        </div>
    </g:form>

</div>

<script>


    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $("#addContentFB").leanModal();
    });

</script>