<%--<jsp:useBean id="ad" scope="request" type="com.sun.imageio.spi.FileImageOutputStreamSpi"/>--%>
<%--
  Created by IntelliJ IDEA.
  User: danielmondragon
  Date: 7/27/23
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Individual Ad" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/body.css">
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



</body>
</html>

