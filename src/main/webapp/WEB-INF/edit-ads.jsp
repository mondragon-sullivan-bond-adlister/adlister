<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Edit Your Ads" />
  </jsp:include>
</head>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
  <h1>Update your Ad</h1>
  <form action="/edit-ads" method="post">
    <input type="hidden" name="id" value="${param.id}">
    <div class="form-group">
      <label for="title">Title</label>
      <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
    </div>
    <div class="form-group">
      <label for="description">Description</label>
      <textarea id="description" name="description" class="form-control">${ad.description}</textarea>
    </div>
    <input type="submit" class="btn btn-block btn-primary">
  </form>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
