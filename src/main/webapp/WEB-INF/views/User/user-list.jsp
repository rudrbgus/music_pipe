<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="icon" type="image/png" href="…">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <%@include file="../include/static-head.jsp"%>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>

<body class="list_body">
<%@include file="../include/header.jsp"%>
<div class="header-list">
    <div class="box bg-1">
        <button class="button button--winona button--border-thin button--round-s" data-text="guitar"><span><img src="/assets/img/icon/icon-guitar.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s" data-text="Create New"><span><img src="/assets/img/icon/icon-piano.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s" data-text="Publish"><span><img src="/assets/img/icon/icon-drum.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s" data-text="Publish"><span><img src="/assets/img/icon/icon-microphone.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s" data-text="Publish"><span><img src="/assets/img/icon/icon-violin.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s" data-text="Publish"><span><img src="/assets/img/icon/icon-flute.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s" data-text="Publish"><span><img src="/assets/img/icon/icon-harp.png" alt="tq"></span></button>
    </div>
</div>
<div class="listBox1">

    <div class="emptyBox1"></div>
    <div class="contentBox1">
        <div class="content">
            <div class="slider1 slider"></div>
            <a href="#" class="content-card1 content-card">
                <img src="https://source.unsplash.com/random/300x420">
                <div class="content-text">
                    <div class="tag">
                        <div class="tagName">피아노</div>
                        <div class="tagName">바이올린</div>
                    </div>
                    <div class="title">슬기로운 밴드 생활</div>
                    <div class="information">미팅 유형 : 오프라인</div>
                    <div class="team-list">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                    </div>
                </div>
            </a>
        </div>
        <div class="content">
            <div class="slider2 slider"></div>
            <a href="#" class="content-card2 content-card">
                <img src="https://source.unsplash.com/random/300x420">
                <div class="content-text">
                    <div class="tag">
                        <div class="tagName">피아노</div>
                        <div class="tagName">바이올린</div>
                    </div>
                    <div class="title">슬기로운 밴드 생활</div>
                    <div class="information">미팅 유형 : 오프라인</div>
                    <div class="team-list">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                    </div>
                </div>
            </a>
        </div>
        <div class="content">
            <div class="slider1 slider"></div>
            <a href="#" class="content-card1 content-card">
                <img src="https://source.unsplash.com/random/300x420">
                <div class="content-text">
                    <div class="tag">
                        <div class="tagName">피아노</div>
                        <div class="tagName">바이올린</div>
                    </div>
                    <div class="title">슬기로운 밴드 생활</div>
                    <div class="information">미팅 유형 : 오프라인</div>
                    <div class="team-list">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                    </div>
                </div>
            </a>
        </div>
        <div class="content">
            <div class="slider2 slider"></div>
            <a href="#" class="content-card2 content-card">
                <img src="https://source.unsplash.com/random/300x420">
                <div class="content-text">
                    <div class="tag">
                        <div class="tagName">피아노</div>
                        <div class="tagName">바이올린</div>
                    </div>
                    <div class="title">슬기로운 밴드 생활</div>
                    <div class="information">미팅 유형 : 오프라인</div>
                    <div class="team-list">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                        <img src="https://source.unsplash.com/random/300x420">
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="emptyBox2"></div>

</div>

</body>
<script>
    // JavaScript 코드
    // JavaScript 코드
    function addHoverEffect(className, hoverColor, originalColor, hoverTitle,originalTitle) {
        document.querySelectorAll(className).forEach(function (card) {
            card.addEventListener('mouseenter', function () {
                card.querySelector('.title').style.color = hoverTitle;
            });

            card.addEventListener('mouseleave', function () {
                card.querySelector('.title').style.color = originalTitle;
            });
        });
    }

    addHoverEffect('.content-card1', '#212121', '#ffffff','#ffffff','#212121');
    addHoverEffect('.content-card2', '#ffffff', '#212121','#212121','#ffffff');
</script>

</body>
</html>