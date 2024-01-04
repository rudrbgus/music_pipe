<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Web Study</title>
    <%@include file="include/static-head.jsp"%>
    <link rel="stylesheet" href="assets/css/main.css">
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <style>
        input,
        textarea{
            width: 100%;
        }
    </style>
</head>
<body>
<%@include file="include/header.jsp"%>
<div class="main_box_first">
<!-- Wrapper-->
<div id="wrapper">

    <!-- Nav -->
    <nav id="nav">
        <a href="#" class="icon solid fa-home"><span>Home</span></a>
        <a href="#work" class="icon solid fa-sharp fa-regular fa-camera-retro"><span>Contact</span></a>
        <a href="#contact" class="icon solid fa-sharp fa-light fa-users"><span>Find a group</span></a>
        <a href="https://www.instagram.com/" class="icon brands fa-instagram"><span>Instagram</span></a>
    </nav>


    <!-- Main -->
    <div id="main">

        <!-- Me -->
        <article id="home" class="panel intro">
            <div class="header">
                <div class="txt_view actionTxtType8">
    <span class="txt">
        <span data-content="M">M</span>
<span data-content="u">u</span>
<span data-content="s">s</span>
<span data-content="i">i</span>
<span data-content="c" class="gap">c</span>

        <span data-content="p">p</span>
<span data-content="i">i</span>
<span data-content="p">p</span>
<span data-content="e">e</span>

        <br /><br/>

	</span>
                </div>
            </div>
            <a href="#work" class="jumplink pic">
                <span class="arrow icon solid fa-chevron-right"><span>See my work</span></span>
                <img src="assets/img/me.jpg" alt="" />
            </a>
        </article>

        <!-- Work -->
        <article id="work" class="panel">
            <div class="header">
                <h2>Work</h2>
            </div>
            <p>
                Phasellus enim sapien, blandit ullamcorper elementum eu, condimentum eu elit.
                Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
                luctus elit eget interdum.
            </p>
            <section>
                <div class="row">
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic01.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic02.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic03.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic04.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic05.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic06.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic07.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic08.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic09.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic10.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic11.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic12.jpg" alt=""></a>
                    </div>
                </div>
            </section>
        </article>

        <!-- Contact -->
        <article id="contact" class="panel">
            <div class="header">
                <h2>Contact Me</h2>
            </div>
            <form action="#" method="post">
                <div>
                    <div class="row">
                        <div class="col-6 col-12-medium">
                            <input type="text" name="name" placeholder="Name" />
                        </div>
                        <div class="col-6 col-12-medium">
                            <input type="text" name="email" placeholder="Email" />
                        </div>
                        <div class="col-12">
                            <input type="text" name="subject" placeholder="Subject" />
                        </div>
                        <div class="col-12">
                            <textarea name="message" placeholder="Message" rows="6"></textarea>
                        </div>
                        <div class="col-12">
                            <input type="submit" value="Send Message" />
                        </div>
                    </div>
                </div>
            </form>
        </article>

    </div>

<%--    <!-- Footer -->--%>
<%--    <div id="footer">--%>
<%--        <ul class="copyright">--%>
<%--            <li>&copy; Untitled.</li><li>from: <a href="#">MeatJellyBuger</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>

</div>
</div>
<div class="testH2">
    Find a teammate that suits you!</div>
<div class="main_box_second">
    <div class="container-agoda">
        <div class="swiper">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-card">
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<div class="main_box_third">
    <h2>Related videos<i class="fab fa-brands fa-youtube" style="margin-left: 50px"></i></h2>
    <iframe width="1200" height="615" src="https://www.youtube.com/embed/Y8JFxS1HlDo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
<div class="main_box_fourth">
    <ul class="copyright">
        <li>&copy; Untitled.</li><li>from: <a href="#">MeatJellyBuger</a></li>
    </ul>
</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script>

        const $fa_home = document.querySelector(".fa-home");
        const $body=document.getElementsByTagName("body");
        const firstColor = "#F29E38";
        document.addEventListener("DOMContentLoaded", function() {
            e.preventDefault();

            $fa_home.addEventListener("click", function() {
                // Get the first color from the gradient


                // Set the new background color
                document.body.style.background = `linear-gradient(to right, ${firstColor} 0%, ${firstColor} 100%)`;
            });
        });
</script>
<script type="module">
    import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs';

    // 비동기 데이터를 가져오고 Swiper를 초기화하는 함수
    async function initSwiperWithData() {
        try {
            // 서버에서 데이터를 가져옴
            const response = await fetch("/user/list", {
                method: "POST",
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify({ equipmentId: 1 })
            });
            const users = await response.json();

            // 가져온 데이터를 가지고 동적으로 카드 생성
            createCards(users);

            // Swiper를 초기화
            initSwiper();
        } catch (error) {
            console.error('데이터를 가져오는 중 에러 발생:', error);
        }
    }
    let i=1;
    // 데이터를 기반으로 카드를 동적으로 생성하는 함수
    function createCards(users) {
        $('.swiper-wrapper').empty();

        users.forEach(function (user) {
            const { nickname, age, sex, regDate, teamId } = user;
            var card = `
        <div class="swiper-slide" data-hash="slide1">
          <div class="swiper-card">
<div class="container">
  <div class="box">
    <div class="box__img">
      <img src="https://source.unsplash.com/random/300x420" alt="">
    </div>
    <div class="box__details">
      <h2>Here's the details</h2>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto, eius ea sit voluptate distinctio atque illo cumque incidunt fuga odio omnis in ad, iusto veritatis debitis, voluptatum corrupti voluptas?</p>
      <a href="#" class="cta">Click here...</a>
    </div>
  </div>
</div>
            </div>
        </div>
      `;
            // 생성한 카드를 swiper-wrapper에 추가
            $('.swiper-wrapper').append(card);
            i++;
        });
    }

    // Swiper 초기화 함수
    function initSwiper() {
        const swiper = new Swiper('.swiper-container', {
            direction: 'horizontal',
            loop: true,
            slidesPerView: 2,
            spaceBetween: 100,
        });
    }

    // 페이지 로드 시 데이터 가져오고 Swiper 초기화
    initSwiperWithData();
</script>


</body>
</html>