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

    <script>
        function deleteAlert(user) {
            if (confirm("Are you sure you want to delete your profile?")) {
                const form = document.createElement('form');
                form.method = 'post';
                form.action = '/delete-user';
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'id';
                input.value = user;
                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            } else{
                return false;
            }
        }
    </script>

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <button type="button" class="btn btn-primary" onclick="window.location.href='/edit-profile'">Update Profile</button>
    <button type="button" class="btn btn-primary" onclick="window.location.href='/showUserAds'">View your ads</button>
<%--    <button type="button" class="btn btn-primary" onclick="window.location.href='/delete-user'">Delete your entire profile</button>--%>
    <form action="/delete-user" method="post">
        <!-- Include any other form fields here -->
        <input type="hidden" name="username" value="${user.username}">
        <button type="submit" class="btn btn-primary" onclick="deleteAlert('${sessionScope.user.username}'); return false;">Delete User</button>
    </form>

</body>
</html>
