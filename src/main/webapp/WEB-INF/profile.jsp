<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container text-center mb-3">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <div class="container-fluid">
        <div class="d-flex flex-row justify-content-evenly bd-highlight ">
            <div class="p-2 bd-highlight">
                <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='/edit-profile'">Update Profile</button>
            </div>
            <div class="p-2 bd-highlight">
                <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='/showUserAds'">View your ads</button>
            </div>
            <div class="p-2 bd-highlight">
                <form action="/delete-user" method="post">
                    <input type="hidden" name="username" value="${user.username}">
                    <button type="submit" class="btn btn-primary btn-block" onclick="deleteAlert('${sessionScope.user.username}'); return false;">Delete User</button>
                </form>
            </div>
        </div>
    </div>
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
    <jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
