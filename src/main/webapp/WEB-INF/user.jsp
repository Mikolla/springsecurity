<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User page</title>
</head>
<body>
<center>
    <div>
        <div>
            <label id="user-label">You are authorized as, ${user}.</label>
        </div>
        <div align="right">
            <a class="btn btn-danger" href="/logout">Logout</a>
        </div>
    </div>
</center>
</body>
</html>
