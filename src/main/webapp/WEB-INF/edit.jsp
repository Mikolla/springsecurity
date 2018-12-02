<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Edit user</title>
</head>
<body>
    <div>
        <label >EDIT FORM</label>
        <c:if test="${param.error != null}">
            <div>
                <p>All fields must be filled.</p>
            </div>
        </c:if>
        <form method="post" action="/admin/edit">
            <div>
                <label>Name</label>
            </div>
            <div>
                <input type="text" name="name" value="${user.name}">
            </div>

            <div>
                <label>Login</label>
            </div>
            <div>
                <input type="text" name="login" value="${user.login}">
            </div>

            <div>
                <label>Password</label>
            </div>
            <div>
                <input type="text" name="password" value="${user.password}">
            </div>

            <div>
                <label>Role</label>
            </div>
            <div>
                <select  name="role">
                <option></option>
                <option>User</option>
                <option>Admin</option>
            </select>
            </div>
            <br>
            <div>
                <input type="submit" value="Edit">
                <input type="hidden" name="id" value="${user.id}">
                <a  href="/admin">Back</a>
            </div>
            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
        </form>
    </div>
</body>
</html>
