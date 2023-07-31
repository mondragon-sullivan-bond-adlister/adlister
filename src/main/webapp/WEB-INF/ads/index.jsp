<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>
    <div class="container">
        <form class="form-inline" method="post" action="<c:url value="/ads"/>">
            <input type="text" name="search" class="form-control" placeholder="">
            <button type="submit" class="btn btn-primary">Search</button>
            <button type="submit" class="btn btn-primary" name="all" value="all" >All Ads</button>
        </form>
    </div>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
<%--            <form action="/ad" method="post">--%>
<%--                <button type="submit" name="ad1" value="${ad.id}" >more info</button>--%>
<%--            </form>--%>
            <a href="/ad?${ad.id}">Check this out</a>
        </div>
    </c:forEach>
</div>
</body>
</html>
