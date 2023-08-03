<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/AllAds.css">
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
    <div class="row">
    <c:forEach var="ad" items="${ads}" varStatus="status">
        <div class="col-sm-6 col-md-4 col-lg-3">
            <div class="card" >
                <img src="https://picsum.photos/200/300" class="card-img-top mx-auto d-block" alt="...">
                <div class="card-body">
                    <h4>${ads.get(ads.size() - 1 - status.index).title}</h4>
                </div>
                <div class="card-body">
                    <a class="mi" href="/ad?${ad.id}">More Info</a>
                </div>
            </div>

        </div>
    </c:forEach>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
