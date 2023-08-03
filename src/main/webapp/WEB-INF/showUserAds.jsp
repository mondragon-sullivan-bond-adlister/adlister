<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="View your ads!"/>
    </jsp:include>
    <style>
        .card-button {
            height: 80%;
            width: 40%;
        }
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp"/>
<c:choose>
    <c:when test="${empty userAds}">
        <div class="container">
            <div class="row d-flex justify-content-center text-center">
                <h3 class="text-light m-5">No ads found for this user.</h3>
                <a class="btn btn-secondary w-75 m-5" href="<c:url value='/ads/create'/>">Create an ad</a>
            </div>
        </div>

    </c:when>
    <c:otherwise>

        <div class="container">
            <div class="row d-flex justify-content-evenly my-5">
                <a class="btn btn-secondary w-75 m-5 col-12" href="<c:url value='/ads/create'/>">Create an ad</a>
                <c:forEach items="${userAds}" var="ad">
                 <c:if test="${ad.getUserId() eq user.id}">
                    <div class="card text-center bg-secondary bg-gradient bg-opacity-50 m-3" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title text-dark">${ad.title}</h5>
                            <p class="card-text text-dark">${ad.description}</p>
                            <div class="d-flex flex-row justify-content-evenly">
                                <form action="<c:url value='/edit-ads'/>" method="get">
                                    <button class="card-link btn btn-secondary" name="id" value="${ad.id}">Edit</button>
                                </form>
                                <form action="<c:url value='/delete-ad'/>" method="post">
                                    <button type="button" class="card-link btn btn-secondary" name="id" value="${ad.id}" onclick="deleteAlert(${ad.id}); return false">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
            </c:if>
        </c:forEach>
        </div>
        </div>
    </c:otherwise>
</c:choose>
<script>
    function deleteAlert(adId) {
        if (confirm("Are you sure you want to delete this ad?")) {
            const form = document.createElement('form');
            form.method = 'post';
            form.action = '/delete-ad';
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'id';
            input.value = adId;
            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        } else {
            return false
        }
    }
</script>
<jsp:include page="/WEB-INF/partials/script.jsp"/>
</body>
</html>
