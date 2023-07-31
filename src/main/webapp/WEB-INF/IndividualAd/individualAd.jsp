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
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>${ad.title}</h1>
    <p>${ad.description}</p>
    <!--ad details-->

<%--    <h2>Posted by: ${ad.user.username}</h2>--%>
<%--    <p>Contact: ${ad.user.email}</p>--%>
<%--    <!--user details-->--%>
</div>

</body>
</html>

