<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="edit-profile" value="Edit Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
      <h1>Edit Profile</h1>
      <form action="<c:url value="/edit-profile" />" method="post">
<%--          <input type="hidden" name="userId" value="${user.id}">--%>
          <div class="form-group">
          <label for="username">Username</label>
          <input id="username" name="username" class="form-control" type="text">
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input id="email" name="email" class="form-control" type="text">
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input id="password" name="password" class="form-control" type="password">
        </div>
        <div class="form-group">
          <label for="confirm_password">Confirm Password</label>
          <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn btn-primary btn-block">
      </form>
    </div>
<div>
    <h3>You will be redirected to login page after update</h3>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
