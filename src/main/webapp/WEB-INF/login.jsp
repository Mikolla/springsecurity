<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login page</title>
</head>
<body style="background-color: lightyellow">
    <div id="login-form">
        <label id="login-label">LOGIN FORM</label>
        <form method="POST" action="" name="loginForm">
            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    <p>Log out successfully.</p>
                </div>
            </c:if>
            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    <p>Invalid username and password.</p>
                </div>
            </c:if>
            <div>
                <input class="form-control" type="text" name="username" placeholder="Login"/>
            </div>
            <div id="div-margin-top">
                <input class="form-control" type="password" name="password" placeholder="Password">
            </div>
            <div id="button-margin">
                <input class="btn btn-primary form-control" name="submit" type="submit" value="Login"/>
            </div>
            <div id="link-position">
                <a href="/registration" style="color: black">Registry</a>
            </div>
            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
        </form>
    </div>
</body>
</html>
