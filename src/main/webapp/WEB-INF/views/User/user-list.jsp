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

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <style>
        body {
            background: grey;
            height: 100vh;
        }

        .container-agoda {
            width: 1586px;
            margin: 0 auto;
        }

        .swiper {
            width: 100%;
            margin-top: 70px;
            position: relative;
        }
        .swiper-container {
            margin-top: 100px;
            width: 60%;
            height: 50vh;
        }
        .swiper-card {
            background: #fff;
            height: 100%;
            border-radius:28px
        }

        .container{
            margin: 0;
            padding: 0;
            display: flex;
            height: 100%;
        }

        .box {
            position: relative;
            width: 100vh;
            height: 100%;
            background: #262626;
            margin: 0 auto;
            box-shadow: 0px 5px 25px rgba(0,0,0,.7);
            overflow: hidden;
            border-radius:28px
        }

        .box__img {
            position: absolute;
            top:0;
            left:0;
            transition: transform .5s linear;
            height: 100%;

        }
        .box__img img {
            height: 100%;
            width: 100%;
        }

        .box__details{
            color: #fff;
            padding: 10px 25px;
        }

        .box__details h2 {
            text-align: center;
            color: #ccc;
        }

        .box:hover .box__img {
            transform: translateX(-100%);
        }

        .cta {
            display: block;
            text-decoration: none;
            color: #fff;
            border: 1px solid #fff;
            padding: 10px 20px;
            margin-top: 50px;
            text-align: center;
        }

        .cta:hover {
            background: orange;
            border-radius: 10px;
        }


.title_list{
    margin-top: 220px;
    margin-left: 20vh;
    display: flex;
    align-items: center;
    justify-content: left;

}
    </style>
</head>

<body class="list_body">
<%@include file="../include/header.jsp"%>
<h2 class="title_list">팀원 찾기 게시판</h2>
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
</body>
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
<script>
    $('.cover').on('click', function() {
        $('.next').toggleClass('anmt');
        $('.content').toggleClass('anmt');
    });
</script>
</body>