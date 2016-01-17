<%--
  Created by IntelliJ IDEA.
  User: dimflo
  Date: 1/17/16
  Time: 12:29 PM
--%>

<%@ page import="gr.meerkat.Place" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Discover</title>
    <meta name="layout" content="main"/>
</head>

<body>

<g:uploadForm controller="place" action="saveNewContent">
    <div class="container-fluid">
        <input hidden name="place_id" value="${place_id}">
        <div class="row">

            <div class="input-field col s12 m12 l12">
                <i class="material-icons prefix">room</i>
                <input value=" " id="title" type="text" name="title" class="validate">
                <label for="title">Content's Title</label>
            </div>

            <div class="input-field col s12 m12 l12">
                <i class="material-icons prefix">room</i>
                <textarea id="description" name="description" class="materialize-textarea"
                          placeholder="Write your content..."></textarea>
                <label for="description">Content's Description</label>
            </div>
        </div>

        <div class="row">

            <div class="input-field col s12 m12 l12">
                <i class="material-icons prefix">room</i>
                <textarea id="longtext1" name="longtext1" class="materialize-textarea"
                          placeholder="Write your content..."></textarea>
                <label for="longtext1">Text</label>
            </div>

            <div class="input-field col s12 m12 l6">
                <i class="material-icons prefix">room</i>
                <input value=" " id="text1" type="text" name="text1" class="validate">
                <label for="text1">Caption</label>
            </div>

            <div class="file-field input-field col s12 m12 l6">
                <div class="btn"><span>Image</span>
                    <input name="image_actual_1" type="file" id="image_actual_1" value="Image">
                </div>

                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
                </div>
            </div>
        </div>
        <div class="row">

            <div class="input-field col s12 m12 l12">
                <i class="material-icons prefix">room</i>
                <textarea id="longtext2" name="longtext2" class="materialize-textarea"
                          placeholder="Write your content..."></textarea>
                <label for="longtext2">Text</label>
            </div>

            <div class="input-field col s12 m12 l6">
                <i class="material-icons prefix">room</i>
                <input value=" " id="text2" type="text" name="text2" class="validate">
                <label for="text2">Caption</label>
            </div>

            <div class="file-field input-field col s12 m12 l6">
                <div class="btn"><span>Image</span>
                    <input name="image_actual_2" type="file" id="image_actual_2" value="Image">
                </div>

                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
                </div>
            </div>
        </div>
        <div class="row">

            <div class="input-field col s12 m12 l12">
                <i class="material-icons prefix">room</i>
                <textarea id="longtext3" name="longtext3" class="materialize-textarea"
                          placeholder="Write your content..."></textarea>
                <label for="longtext3">Text</label>
            </div>

            <div class="input-field col s12 m12 l6">
                <i class="material-icons prefix">room</i>
                <input value=" " id="text3" type="text" name="text3" class="validate">
                <label for="text3">Caption</label>
            </div>

            <div class="file-field input-field col s12 m12 l6">
                <div class="btn"><span>Image</span>
                    <input name="image_actual_3" type="file" id="image_actual_3" value="Image">
                </div>

                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
                </div>
            </div>

            <button class="btn waves-effect  waves-light" type="submit" name="action">Submit
                <i class="material-icons right">send</i>
            </button>

        </div>

    </div>

</g:uploadForm>

</body>
</html>