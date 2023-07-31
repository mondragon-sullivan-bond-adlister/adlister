<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="<c:url value="/ads"/>">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="<c:url value="/login"/>">Login</a></li>
            <li><a href="<c:url value="/logout"/>">Logout</a></li>
        </ul>
    </div>
</nav>
