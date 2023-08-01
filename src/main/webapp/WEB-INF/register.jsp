<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <title>Register</title></head>
<body>
    <jsp:include page="partials/navbar.jsp" />

    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="<c:url value="/register"/>" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${username}">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="email" value="${email}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>

    <script>
        <c:if test="${not empty Error}">
        alert("Username or Email is already taken! Please try again.");
        </c:if>
        <c:if test="${not empty Error1}">
        alert("One or more of the fields were empty! Please try again.");
        </c:if>
    </script>
</body>
</html>
