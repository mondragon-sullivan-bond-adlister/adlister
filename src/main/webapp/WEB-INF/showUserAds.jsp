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
        div.card.mb-3 {
            background: #7090A4;
        }
        button.card-button.btn.btn-primary {
            background-color: #161A22;
            color: white;
            border-color: transparent;
        }
        button.card-button.btn.btn-primary:hover {
            background-color: #7090A4;
            color: white;
            border-color: #161A22;
        }
        button.btn.btn-primary {
            background-color: #161A22;
            color: white;
            border-color: transparent;
        }
        button.btn.btn-primary:hover {
            background-color: #7090A4;
            color: white;
            border-color: #161A22;
        }
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp"/>
<c:choose>
    <c:when test="${empty userAds}">
        <h3>No ads found for this user.</h3>
    </c:when>
    <c:otherwise>

        <div class="container">
        <div class="row my-5">
        <c:forEach items="${userAds}" var="ad">
            <c:if test="${ad.getUserId() eq user.id}">


                <div class="col-4">
                    <div class="card mb-3">
                        <div class="card-body mb-3">
                            <h5 class="card-title">${ad.title}</h5>
                                <%--              <p class="card-text">${ad.description}</p>--%>
                            <div class="d-flex justify-content-center align-items-center">
                                <button class="card-button btn btn-primary col-6 p-1"><a
                                        href="<c:url value='/edit-ads?id='/><c:out value='${ad.id}'/>"
                                        class="card-link"></a>Edit
                                </button>
                                <form action="/delete-ad" method="post" class="col-6 my-auto card-button p-1">
                                    <input type="hidden" name="id" value="${ad.id}">
                                    <button type="button" class="btn btn-primary"
                                            onclick="deleteAlert(${ad.id}); return false">Delete
                                    </button>
                                </form>
                            </div>
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
