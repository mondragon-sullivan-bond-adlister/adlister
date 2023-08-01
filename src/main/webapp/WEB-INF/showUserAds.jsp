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
  <jsp:include page="partials/head.jsp">
    <jsp:param name="title" value="View your ads!" />
  </jsp:include>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />

<c:choose>
  <c:when test="${empty userAds}">
    <p>No ads found for this user.</p>
  </c:when>
  <c:otherwise>
    <ul>
      <c:forEach items="${userAds}" var="ad">
        <c:if test="${ad.getUserId() eq user.id}">
          <li>${ad.title} - ${ad.description}</li>
        </c:if>
      </c:forEach>
    </ul>
  </c:otherwise>
</c:choose>
</body>
</html>
