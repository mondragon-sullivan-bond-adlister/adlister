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
            color: #7090A4;
        }
        .card-title {
            color: #161A22;
        }
        .card-body {
            background: #7090A4;
            /*color: #161A22;*/
        }
        .btn {
            background-color: #161A22;
            color: white;
            border-color: transparent;
        }
        .btn:hover {
            background-color: #7090A4;
            color: white;
            border-color: #161A22;
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
                <div class="card-body">
                    <h5 class="card-title">Just Window shopping?</h5>
                    <p class="card-text">Check out all our ads in one place and enjoy the show.</p>
                    <a class="btn btn-secondary" href="<c:url value="/ads"/>">View All Ads</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="d-flex justify-content-evenly my-5">
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body" >
                    <h5 class="card-title">For Sale</h5>
                    <p class="card-text">From toothpaste to RPG's we got it all... I think</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="1">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">For trade</h5>
                    <p class="card-text">Tired of that old couch? trade up for a new one!</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="2">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">For Free</h5>
                    <p class="card-text">FREE, FREE, FREE. Not much more to say about free.</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Job Post</h5>
                    <p class="card-text">Looking to see what jobs are out there. Take a look.</p>
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
                <div class="card-body">
                    <h5 class="card-title text-dark">Job Search</h5>
                    <p class="card-text text-dark">Are you desperate for work and just dont wanna look?</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title text-dark">Services</h5>
                    <p class="card-text text-dark">Need a contractor or just some guy who knows what he is doing?</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title text-dark">Community Events</h5>
                    <p class="card-text text-dark">Check out the events that are happening in your community.</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title text-dark">Housing</h5>
                    <p class="card-text text-dark">Looking to move and dont know where to start? Start here!</p>
                    <form action="<c:url value="/ads"/>" method="post">
                        <button class="btn btn-secondary" name="cat" value="3">View Ads</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
