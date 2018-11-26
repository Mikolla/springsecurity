<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>User list</title>
</head>
<body>
<center>
    <h1>User list</h1>


    <form action="${pageContext.servletContext.contextPath}/admin/adduser" method="POST">

            <label for="uName">Username:</label>
            <input type="text" id="uName" name="name" placeholder="Input name"/>

            <label for="uLogin">Login:</label>
            <input type="text" id="uLogin" name="login" placeholder="Input login"/>

            <label for="uPassword">Password:</label>
            <input type="text" id="uPassword" name="password" placeholder="Input password"/>


        <select class="form-control" name="role">
            <option></option>
            <option>User</option>
            <option>Admin</option>
        </select>



            <input type="submit" align="center" value="Submit"/>
    </form>

</center>


<div align="center">

    <table border="1" cellpadding="5">

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Login</th>
            <th>Password</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>

        <c:forEach items="${users}" var="user" varStatus="status">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.login}</td>
                <td>${user.password}</td>
                <td>"shmara"</td>
                <td>
                    <a href="${pageContext.servletContext.contextPath}/admin/edituser/${user.id}">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.servletContext.contextPath}/admin/deluser/${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>

        <tr>
            <form action="${pageContext.servletContext.contextPath}/admin/adduser" method="POST">

                <td></td>
                <td>
                    <input type="text" id="1uName" name="name" placeholder="Input name"/>
                </td>

                <td>
                    <input type="text" id="1uLogin" name="login" placeholder="Input login"/>
                </td>

                <td>
                    <input type="text" id="1uPassword" name="password" placeholder="Input password"/>
                </td>

                <td>

                    <select class="form-control" name="role">
                        <option></option>
                        <option>User</option>
                        <option>Admin</option>
                    </select>

                </td>

                <td>
                    <input type="submit" align="center" value="add new"/>
                </td>


            </form>
        </tr>

    </table>

</div>
</body>
</html>