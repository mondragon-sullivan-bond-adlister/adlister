<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.title}" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <div class="row justify-content-center">
        <div class="col-sm-12 col-md-8 col-lg-6"> <!-- Change these numbers to affect the size -->
            <div class="card">
                <img src="https://picsum.photos/200/300" class="card-img-top" alt="...">
                <div class="card-body">
                    <h1>${ad.title}</h1>
                    <p>${ad.description}</p>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>

