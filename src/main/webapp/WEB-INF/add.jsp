<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Adding user</title>
</head>
<body>
    <div>
        <label>ADDING FORM</label>
        <c:if test="${param.error != null}">
            <div>
                <p>All fields must be filled.</p>
            </div>
        </c:if>
        <form method="post" action="">
            <div>
                <label>Name</label>
            </div>
            <div>
                <input  type="text" name="name">
            </div>

            <div>
                <label>Login</label>
            </div>
            <div>
                <input  type="text" name="login">
            </div>

            <div>
                <label>Password</label>
            </div>
            <div>
                <input  type="text" name="password">
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
                <input  type="submit" value="Add">
                <a  href="/admin">Back</a>
            </div>
            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
        </form>
    </div>
</body>
</html>
