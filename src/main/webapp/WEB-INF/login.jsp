<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
    <style>
        p {
            align-self: center;
        }
        .form-control {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Please Log In</h1>
        <form action="<c:url value="/login"/>" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${username}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block w-100" value="Log In">
            <p>Don't have an account?</p>
        </form>
        <form method="GET" action="<c:url value="/register"/>" >
            <input class="btn btn-primary btn-block w-100" value="Register Here" type="submit"/>
        </form>
    </div>
    <script>
        <c:if test="${not empty Error}">
        alert("Username or Password was empty! Please try again");
        </c:if>
        <c:if test="${not empty Error1}">
        alert("Username was incorrect! Please try again");
        </c:if>
        <c:if test="${not empty Error2}">
        alert("Password was incorrect! Please try again");
        </c:if>
    </script>
    <jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
