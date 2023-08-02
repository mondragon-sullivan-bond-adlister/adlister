<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Adlister" />
    </jsp:include>
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
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to Adlister</h1>
    </div>
    <div class="container">
        <div class="d-flex justify-content-center my-5">
            <div class="card text-center">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">Just Window shopping?</h5>
                    <p class="card-text text-dark">Check out all our ads in one place and enjoy the show.</p>
                    <a class="btn btn-secondary" href="<c:url value="/ads"/>">View All Ads</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="d-flex justify-content-evenly my-5">
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">For Sale</h5>
                    <p class="card-text text-dark">From toothpaste to RPG's we got it all... I think</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="1">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">For trade</h5>
                    <p class="card-text text-dark">Tired of that old couch? trade up for a new one!</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="2">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">For Free</h5>
                    <p class="card-text text-dark">FREE, FREE, FREE. Not much more to say about free.</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">Job Post</h5>
                    <p class="card-text text-dark">Looking to see what jobs are out there. Take a look.</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="d-flex justify-content-evenly my-5">
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">Job Search</h5>
                    <p class="card-text text-dark">Are you desperate for work and just dont wanna look?</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">Services</h5>
                    <p class="card-text text-dark">Need a contractor or just some guy who knows what he is doing?</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">Community Events</h5>
                    <p class="card-text text-dark">Check out the events that are happening in your community.</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body bg-secondary bg-gradient bg-opacity-50">
                    <h5 class="card-title text-dark">Housing</h5>
                    <p class="card-text text-dark">Looking to move and dont know where to start? Start here!</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

<%--    <div class="card-container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-12">--%>
<%--                <div class="card mb-3 mx-auto" style="max-width: 800px;">--%>
<%--                    <div class="row no-gutters">--%>
<%--                        <div class="col-md-4">--%>
<%--                            <img src="https://picsum.photos/150" class="img-fluid rounded float-end" alt="...">--%>
<%--                        </div>--%>
<%--                        <div class="col-md-8">--%>
<%--                            <div class="card-body">--%>
<%--                                    <h5 class="card-title">Category</h5>--%>
<%--                                <p class="card-text text-dark">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-12">--%>
<%--                <div class="card2 mb-3 mx-auto" style="max-width: 800px;">--%>
<%--                    <div class="row no-gutters2">--%>
<%--                        <div class="col-md-8 order-md-1">--%>
<%--                            <div class="card-body2">--%>
<%--                                <h5 class="card-title">Category</h5>--%>
<%--                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                                <p class="card-text"><small class="text-muted"></small></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4 order-md-2">--%>
<%--                            <img src="https://picsum.photos/150" class="img-fluid rounded" alt="...">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-12">--%>
<%--                <div class="card mb-3 mx-auto" style="max-width: 800px;">--%>
<%--                    <div class="row no-gutters">--%>
<%--                        <div class="col-md-4">--%>
<%--                            <img src="https://picsum.photos/150" class="img-fluid rounded float-end" alt="...">--%>
<%--                        </div>--%>
<%--                        <div class="col-md-8">--%>
<%--                            <div class="card-body">--%>
<%--                                <h5 class="card-title">Category</h5>--%>
<%--                                <p class="card-text text-dark">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                                <p class="card-text"><small class="text-muted"></small></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-12">--%>
<%--                <div class="card2 mb-3 mx-auto" style="max-width: 800px;">--%>
<%--                    <div class="row no-gutters2">--%>
<%--                        <div class="col-md-8 order-md-1">--%>
<%--                            <div class="card-body2">--%>
<%--                                <h5 class="card-title">Category</h5>--%>
<%--                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
<%--                                <p class="card-text"><small class="text-muted"></small></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-4 order-md-2">--%>
<%--                            <img src="https://picsum.photos/150" class="img-fluid rounded-start" alt="...">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
