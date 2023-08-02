<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
        nav.navbar.navbar-default {
            background-color: #7090A4;
        }
        .d-inline {
            text-decoration: none;
            margin-right: 10px;
            color: #161A22 ;
        }
        a {
            text-decoration: none;
            color: #161A22 ;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #161A22" href="<c:url value="/index.jsp"/>">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right list-group-horizontal">
            <li class="d-inline"><a style="color: #161A22" href="<c:url value="/ads"/>">View Ads</a></li>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li><a class="d-inline" style="color: #161A22" href="<c:url value="/login"/>">Login</a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="d-inline" style="color: #161A22" href="<c:url value="/profile"/>">Profile</a></li>
                    <li><a class="d-inline" style="color: #161A22" href="<c:url value="/ads/create"/>">Create Ad</a></li>
                    <li><a class="d-inline" style="color: #161A22" href="<c:url value="/logout"/>">Logout</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>
</body>