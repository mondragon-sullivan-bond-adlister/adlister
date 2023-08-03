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
<div class="container my-3">
    <div class="row d-flex justify-content-center">
        <div class="card bg-secondary bg-gradient" style="width: 25vw;">
            <img src="https://picsum.photos/150/200" class="rounded mt-3" alt="...">
            <div class="card-body">
                <h1 class="card-title">${ad.title}</h1>
                <p class="card-text">${ad.description}</p>
                <a href="" class="btn btn-secondary">Contact Lister</a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>

