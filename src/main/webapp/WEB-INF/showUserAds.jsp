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
    <h3>No ads found for this user.</h3>
  </c:when>
  <c:otherwise>
      <c:forEach items="${userAds}" var="ad">
        <c:if test="${ad.getUserId() eq user.id}">
          <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">${ad.title}</h5>
              <p class="card-text">${ad.description}</p>
              <a href="<c:url value='/edit-ads?id='/><c:out value='${ad.id}'/>" class="card-link">Edit</a>
              <form action="/delete-ad" method="post">
                <input type="hidden" name="id" value="${ad.id}">
                <button type="button" class="btn btn-link card-link" onclick="deleteAlert(${ad.id}); return false">Delete</button>
              </form>
          </div>
        </c:if>
      </c:forEach>
  </c:otherwise>
</c:choose>
<script>
  function deleteAlert(adId) {
    if (confirm("Are you sure you want to delete this ad?")) {
      const form = document.createElement('form');
      form.method = 'post';
      form.action = '/delete-ad';
      const input = document.createElement('input');
      input.type = 'hidden';
      input.name = 'id';
      input.value = adId;
      form.appendChild(input);
      document.body.appendChild(form);
      form.submit();
    } else{
      return false
    }
  }
</script>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
