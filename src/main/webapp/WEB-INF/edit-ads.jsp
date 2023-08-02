<%--
  Created by IntelliJ IDEA.
  User: jamesosullivan
  Date: 8/1/23
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Edit Your Ads" />
  </jsp:include>
</head>
</head>
<body>
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
</body>
</html>
