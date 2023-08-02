<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/body.css">
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
        <form class="form-inline" method="post" action="<c:url value="/ads"/>">
            <label for="cat">Category</label>
            <select name="cat" id="cat">
                <option value="0"></option>
                <option value="1">For Sale</option>
                <option value="2">For Trade</option>
                <option value="3">For Free</option>
                <option value="4">Job Post</option>
                <option value="5">Job Search</option>
                <option value="6">Services</option>
                <option value="7">Community Events</option>
                <option value="8">Housing</option>
            </select>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <c:if test="${not empty Error}">
        <div>
            <h1>Sorry there are no ads that match your Search or Category selection!</h1>
        </div>
    </c:if>
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
