<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
    <style>
        body {
            background-color: #161A22;
        }
        h1, label{
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post" >
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <h5 class="mt-2 text-light">Category</h5>
            <input type="checkbox" id="cat1" name="cat1" value="1">
            <label for="cat1">For Sale | </label>
            <input type="checkbox" id="cat2" name="cat2" value="2">
            <label for="cat2">For Trade | </label>
            <input type="checkbox" id="cat3" name="cat3" value="3">
            <label for="cat3">For Free | </label>
            <input type="checkbox" id="cat4" name="cat4" value="4">
            <label for="cat4">Job Post | </label>
            <input type="checkbox" id="cat5" name="cat5" value="5">
            <label for="cat5">Job Search | </label>
            <input type="checkbox" id="cat6" name="cat6" value="6">
            <label for="cat6">Services | </label>
            <input type="checkbox" id="cat7" name="cat7" value="7">
            <label for="cat7">Community Events | </label>
            <input type="checkbox" id="cat8" name="cat8" value="8">
            <label for="cat8">Housing | </label>
            <div class="row d-flex justify-content-center m-5">
                <input type="submit" class="btn btn-block btn-primary w-50">
            </div>

        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
