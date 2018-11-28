<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin page</title>
</head>
<body>
 <c:set var="Admin1" value="${adminRole}"/>
    <c:set var="User1" value="${userRole}"/>

    <div align="right">
        <div>
            <div>
                <label>You are authorized as, ${adminName}.</label>
            </div>
            <div align="right">
                <a  href="/logout">Logout</a>
            </div>
        </div>
    </div>

    <div align="center">
        <table border="1" cellpadding="5">
            <thead>
            <tr>
                <td align="center">ID</td>
                <td align="center">Login</td>
                <td align="center">Name</td>
                <td align="center">Password</td>
                <td align="center">Role</td>
                <td align="center">Actions</td>
            </tr>
            </thead>

            <c:forEach var="user" items="${users}">
                <c:set var="roles" value="${user.roles}"/>
                <c:choose>
                    <c:when test="${roles.contains(Admin1)}">

                        <tbody>
                        <tr>
                            <td align="center">${user.id}</td>
                            <td align="center">${user.login}</td>
                            <td align="center">${user.name}</td>
                            <td align="center">${user.password}</td>
                            <td align="center">Admin</td>

                            <td align="center">
                                <a  href="<c:url value="admin/edit/${user.id}"/>">Edit</a>
                                <a  href="<c:url value="/delete/${user.id}"/>">Delete</a>
                            </td>
                        </tr>
                        </tbody>

                    </c:when>
                    <c:when test="${roles.contains(User1)}">
                        <tbody>
                        <tr>
                            <td align="center">${user.id}</td>
                            <td align="center">${user.login}</td>
                            <td align="center">${user.name}</td>
                            <td align="center">${user.password}</td>
                            <td align="center">User</td>

                            <td align="center">
                                <a href="<c:url value="admin/edit/${user.id}"/>">Edit</a>
                                <a href="<c:url value="/delete/${user.id}"/>">Delete</a>
                            </td>
                        </tr>
                        </tbody>
                    </c:when>
                </c:choose>
            </c:forEach>
        </table>

        <div align="right">
            <h3><a  href="/admin/add">Add user</a> </h3>
        </div>
    </div>
</body>
</html>
