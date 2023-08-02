<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/body.css">
    <link rel="stylesheet" type="text/css" href="css/Home.css">
    <style>
        h1 {
            text-decoration: none;
            text-align: center;
        }
        .card-title {
            color: #7090A4;
        }
    </style>
</head>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to Adlister</h1>
    </div>
    <div class="card-container">
        <div class="row">
            <div class="col-12">
                <div class="card mb-3 mx-auto" style="max-width: 800px;">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="https://picsum.photos/200/300" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                    <h5 class="card-title">Category</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card2 mb-3 mx-auto" style="max-width: 800px;">
                    <div class="row no-gutters2">
                        <div class="col-md-8 order-md-1">
                            <div class="card-body2">
                                <h5 class="card-title">Category</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted"></small></p>
                            </div>
                        </div>
                        <div class="col-md-4 order-md-2">
                            <img src="https://picsum.photos/200/300" class="img-fluid rounded-start" alt="...">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card mb-3 mx-auto" style="max-width: 800px;">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="https://picsum.photos/200/300" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Category</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted"></small></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card2 mb-3 mx-auto" style="max-width: 800px;">
                    <div class="row no-gutters2">
                        <div class="col-md-8 order-md-1">
                            <div class="card-body2">
                                <h5 class="card-title">Category</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted"></small></p>
                            </div>
                        </div>
                        <div class="col-md-4 order-md-2">
                            <img src="https://picsum.photos/200/300" class="img-fluid rounded-start" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</body>
</html>
