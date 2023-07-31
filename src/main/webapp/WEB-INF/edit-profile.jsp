<%--
  Created by IntelliJ IDEA.
  User: jamesosullivan
  Date: 7/27/23
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Edit your profile</title>
</head>
<body>


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


</body>
</html>
