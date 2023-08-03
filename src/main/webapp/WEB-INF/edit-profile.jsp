<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="edit-profile" value="Edit Profile" />
    </jsp:include>
    <style>
        h1, label {
            color: #7090A4;
        }
        input.btn.btn-primary.btn-block {
            background-color: #7090A4;
            color: white;
            border-color: transparent;
        }
        input.btn.btn-primary.btn-block:hover {
            background-color: #161A22;
            color: white;
            border-color: #7090A4;
        }
    </style>
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
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
