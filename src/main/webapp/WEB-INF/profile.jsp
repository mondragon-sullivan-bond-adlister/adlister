<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>--%>
    <link rel="stylesheet" type="text/css" href="css/body.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container text-center mb-3">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-sm-2 mb-3">
                <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='/edit-profile'">Update Profile</button>
            </div>
            <div class="col-sm-2 mb-3">
                <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='/showUserAds'">View your ads</button>
            </div>
            <div class="col-sm-2 mb-3">
                <form action="/delete-user" method="post">
                    <input type="hidden" name="username" value="${user.username}">
                    <button type="submit" class="btn btn-primary btn-block">Delete User</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
