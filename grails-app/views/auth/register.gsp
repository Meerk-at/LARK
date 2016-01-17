<%--
  Created by IntelliJ IDEA.
  User: dimflo
  Date: 1/9/16
  Time: 8:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Registration</title>
    <meta name="layout" content="main"/>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col s12 m12 l12 ">
            <h3>Register</h3>
        <g:form controller="auth" action="addUser">
            <p>
                <label for='username'>Username:</label>
                <input type='text' class='text_' name='username' id='username'/>
            </p>

            <p>
                <label for='password'>Password:</label>
                <input type='password' class='text_' name='password' id='password'/>
            </p>

            <p>
                <label for='firstName'>First Name:</label>
                <input type='text' class='text_' name='firstName' id='firstName'/>
            </p>

            <p>
                <label for='lastName'>Last Name:</label>
                <input type='text' class='text_' name='lastName' id='lastName'/>
            </p>

            <p>
                <label for='eMail'>eMail:</label>
                <input type='email' class='text_' name='eMail' id='eMail'/>
            </p>

            <p>
                <input type='submit' id="submit" value='Register'/>
            </p>
        </g:form>
        </div>
    </div>
</div>
<script type='text/javascript'>
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
</script>

</body>
</html>