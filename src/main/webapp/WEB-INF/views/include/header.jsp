<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<header>
    <div class="inner-header">

        <h1 class="logo">
            <a href="/">
                <img src="/assets/img/logo.png" alt="로고이미지">
            </a>
        </h1>

        <div class="search">
            <input type="text" class="form-control" name="keyword" value="${s.keyword}">
            <button class="btn btn-primary" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </div>

        <a href="#" class="menu-open">
            <span class="lnr lnr-menu"></span>
        </a>

        <a href="/user/sign-in">Login</a>

<%--        <c:if test="${not empty login}">--%>
<%--            <a href="#"><img src="${login.profile_img}"></a>--%>
<%--            <p>${login.profile_nikname}</p>--%>
<%--        </c:if>--%>

    </div>

    <nav class="gnb">
        <a href="#" class="close">
            <span class="lnr lnr-cross"></span>
        </a>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">together</a></li>
            <li><a href="#"></a></li>
<%--            <c:if test="${not empty login}">
                <li><a href="#">My Page</a></li>
                <li><a href="/members/sign-out">Sign Out</a></li>
            </c:if>--%>
        </ul>
    </nav>

</header>
<!— //header —>