<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
<%--    <link rel="stylesheet" type="text/css" href="css/index.css">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            color: black;--%>
<%--            background: linear-gradient(180deg,black,dimgrey,grey,darkgray,lightgrey,whitesmoke,white);--%>
<%--        }--%>
<%--    </style>--%>
</head>
</head>
<body>

    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to the Adlister!</h1>
    </div>
</body>
</html>
