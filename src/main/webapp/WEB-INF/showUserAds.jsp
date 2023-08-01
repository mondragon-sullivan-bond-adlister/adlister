<%--
  Created by IntelliJ IDEA.
  User: jamesosullivan
  Date: 7/31/23
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="partials/head.jsp">
    <jsp:param name="title" value="View your ads!" />
  </jsp:include>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
<jsp:include page="partials/navbar.jsp" />

<c:choose>
  <c:when test="${empty userAds}">
    <h3>No ads found for this user.</h3>
  </c:when>
  <c:otherwise>
    <ul>
      <c:forEach items="${userAds}" var="ad">
        <c:if test="${ad.getUserId() eq user.id}">
          <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">${ad.title}</h5>
              <p class="card-text">${ad.description}</p>
              <a href="/edit-ads?id=${ad.id}" class="card-link">Edit</a>
<%--              <a href="/edit-ads?${Ad.getId()}" class="card-link">Card link</a>--%>
              <a href="#" class="card-link">Another link</a>
            </div>
          </div>


          <li>${ad.title} - ${ad.description}</li>
        </c:if>
      </c:forEach>
    </ul>
  </c:otherwise>
</c:choose>
</body>
</html>
