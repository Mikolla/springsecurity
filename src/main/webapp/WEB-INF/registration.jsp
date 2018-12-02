<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Registration</title>
</head>
<body>
<div>
    <label>USER FORM</label>
    <c:if test="${param.error != null}">
        <div>
            <p>All fields must be filled.</p>
        </div>
    </c:if>
    <form method="post" action="/registration">
        <div>
            <label>Name</label>
        </div>
        <div>
            <input class="form-control" type="text" name="name">
        </div>

        <div class="fields-label">
            <label>Login</label>
        </div>
        <div>
            <input class="form-control" type="text" name="login">
        </div>

        <div class="fields-label">
            <label>Password</label>
        </div>
        <div>
            <input class="form-control" type="text" name="password">
        </div>

        <div class="fields-label">
            <label>Role</label>
        </div>
        <div>
            <select class="form-control" name="role">
                <option></option>
                <option>User</option>
                <option>Admin</option>
            </select>
        </div>
        <br>
        <div>
            <input class="btn btn-success form-control" type="submit" value="Registration">
            <a class="btn btn-danger form-control" id="button-margin" href="/login">Back</a>
        </div>
        <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
    </form>
</div>
</body>
</html>
