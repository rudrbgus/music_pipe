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
    <link href="https://fonts.googleapis.com/css?family=Anton" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        /*@import url(http://weloveiconfonts.com/api/?family=entypo);*/
        /*@import url(https://fonts.googleapis.com/css?family=Roboto);*/
        /* Cards */
        .main-cont {
            background-color: #DAA394;
            padding: 0;
            margin: 0;
            top: -215px;
        }

        .news-row {
            margin: 0;
            margin-top: 240px;
            margin-bottom: 50px;
        }

        .news-block {
            margin: auto;
            padding: 0;
            background-color: transparent;
            max-width: 1060px;
            min-width: 100px;
            border: 20px solid transparent;
            border-image: linear-gradient(
                    to bottom right,
                    rgba(255, 255, 255, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgb(245, 245, 245),
                    rgb(245, 245, 245),
                    rgb(254, 254, 254),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75)
            );
            border-image-slice: 1;
            transition: all 0.6s ease;
            animation: blockAppear 0.6s ease-in-out;
        }

        .underlay {
            margin: 0;
            padding: 0;
            max-height: 350px;
            max-width: 340px;
        }

        .card {
            margin: 0;
            width: 340px;
            max-height: 350px;
            max-width: 340px;
            background-color: transparent;
            border: 20px solid transparent;
            border-image: linear-gradient(
                    to bottom right,
                    rgba(255, 255, 255, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75)
            );
            border-image-slice: 1;
            transition: transform 0.6s ease;
            animation: blockAppear 0.6s ease-in-out;
        }

        @keyframes blockAppear {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            40% {
                opacity: 0;
                transform: translateY(20px);
                box-shadow: 0 10px 35px rgba(0, 0, 0, 0.15), 0 1px 0 rgba(0, 0, 0, 0.15);
            }
            80% {
                opacity: 1;
                transform: translateY(-5px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
                box-shadow: none;
            }
        }

        .card:hover {
            z-index: 999;
            max-height: 800px;
            width: 400px;
            max-width: 400px;
            border: none;
            border-right: 60px solid transparent;
            border-bottom: 20px solid transparent;
            margin-right: -20px;
            transform: translate(-30px, -50px);
        }

        .card:before {
            box-shadow: none;
            display: block;
            content: "";
            position: absolute;
            width: 100%;
            max-width: 400px;
            height: 100%;
            transition: box-shadow 0.6s ease;
        }

        .card:hover:before {
            max-width: 300px;
            box-shadow: 60px 60px 20px RGBA(142, 142, 142, 0.6);
        }

        .card:hover .card-img-top {
            height: 300px;
        }

        .card:hover .card-block {
            width: 300px;
            background-image: linear-gradient(
                    to top left,
                    rgb(72, 85, 108),
                    rgb(27, 33, 43) 50%,
                    rgb(20, 25, 34) 51%,
                    rgb(53, 59, 69) 100%
            );
        }

        .card:hover .card-title {
            color: white;
        }

        .card:hover .card-text {
            color: white;
        }

        .card-block {
            background-color: transparent;
            background-image: linear-gradient(
                    to bottom right,
                    rgba(255, 255, 255, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgb(245, 245, 245),
                    rgb(245, 245, 245),
                    rgb(254, 254, 254),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75)
            );
            background-repeat: no-repeat;
        }

        .card-text {
            display: none;
        }

        .card-img-top {
            width: 300px;
            height: 250px;
            background-color: #fff;
            transition: height 0.8s ease;
        }

        @media (max-width: 1120px) {
            .bar-cont {
                width: 100%;
            }
            .news-block {
                max-width: 720px;
            }
            .card:hover {
                margin-right: -20px;
            }
            .card:hover .card-block {
                width: 300px;
            }
        }

        @media (max-width: 800px) {
            .news-block {
                min-width: 380px;
            }
            .card:hover {
                border-left: 20px solid transparent;
                margin-right: -40px;
                transform: translate(0, -50px);
            }
            .card:hover:before {
                box-shadow: 0px 60px 40px RGBA(142, 142, 142, 0.5);
            }
            .card:hover .card-block {
                width: 300px;
            }
        }

        @media (max-width: 580px) {
            .news-block {
                max-width: 380px;
            }
        }
        @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap");
        // 공통사용 스타일 시작
           * {
               font-family: "Noto Sans KR", sans-serif;
               margin: 0;
               padding: 0;
               text-decoration: none;
               color: black;
           }
        img {
            box-shadow: 1px 2px 5px rgba(0, 0, 0, 1);
            transition: all 0.4s, transform 0.2s;
            object-fit: cover;
            border-radius: 10px;
        }
        hr{
            border : solid 2px brown;
        }
        img:hover {
            transform: scale(1.05);
        }
        .sflex {
            padding-top: 30px;
            padding-bottom: 10px;
            display: flex;
            justify-content: space-between;
        }
        a:hover p{
            color: brown;
        }
        a:hover {
            color: brown;
        }
        .select > p {

            padding-bottom: 10px;
            padding-left: 10px;
            padding-right: 10px;
            width: auto;
            color: brown;
        }
        .select > div > p {

            padding-bottom: 10px;
            padding-left: 10px;
            padding-right: 10px;
            width: auto;
            color: brown;
        }
        // 공통사용 스타일끝

        // 상단 로그줄 구현시작
           .board_head {
               display: flex;
               .board_tap {
                   flex-grow: 5;
                   align-content: center;
                   display: flex;
                   justify-content: space-between;
                   margin-bottom: 40px;
                   align-items: center;

                   .logo {
                       p {
                           color: brown;
                       }
                       p:nth-child(1) {
                           font-size: 40px;
                       }
                       p:nth-child(2) {
                           font-size: 10px;
                           padding-left: 10px;
                       }
                   }
                   .logo_base {
                       font-size: 20px;
                   }
               }
               .board_login {
                   flex-grow: 2;
                   align-content: center;
                   display: flex;
                   justify-content: flex-end;
                   margin-bottom: 40px;
                   align-items: center;
                   a {
                       margin: 10px;
                   }
               }
           }
        body {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-content: center;
        }
        .form {
            display: flex;
            flex-direction: column;
            width: 1200px;
        }
        .top_nav {
            align-items: center;
            display: flex;
            margin: 10px;
            margin-bottom: 50px;
        }
        .top_nav p {
            text-align: center;
            display: inline-block;
            font-size: 18px;
            font-weight: bold;
            vertical-align: middle;
        }
        .top_nav a {
            width: 200px;
            padding: 10px;
        }
        h3 {
            font-size: 25px;
        }
        
          .free_notice_board{
              font-size:40px;
              display: flex;
              justify-content: center;
          }
        .free_notice_board {

        }
        .sign_ui{
            display:inline-flex;
            padding-top:30px;
            padding-left:30px;
        }
        .sign{
            padding-left:10px;
            font-size:20px;
            list-style:none;
            text-align:center;
        }

        .free_notice_board > ul{
            list-style:none;
            display:flex;
        }

        .free_notice_board > ul > li{
            padding:19px;
        }
        .free_notice_board > ul > li:nth-child(2){
            text-align:right;
        }
        table.user_board{
            margin:10px;
        }
        /*댓글구현시작*/
        .comment_detali {
            list-style: none;
            display:flex;
            justify-content: space-between;
            padding-top: 10px;
            margin-left: 20px;
            margin-right: 20px;
            align-items: center;
            width:99%;
        }

        .commentt {
            padding-left: 20px;
            word-wrap: break-word; /* 긴 댓글이 줄바꿈되도록 함 */
            max-width: 40%;
        }

        .commentn {
            display: flex;
            justify-content: flex-start;
            font-size: 12px;
        }

        .commentd {
            font-size: 12px;
        }

        .comment_detali > li:nth-child(1) {
            flex-grow: 10;


        }

        .comment_detali > li:nth-child(2) {
            flex-grow: 0;
        }

          .popup_nav {
              width: 60px;
              height: 600px;
              position: absolute;
              margin: 50px;
              margin-top: 100px;
              background-color: lightgray;
              z-index: 999999;
              border-radius: 100px;
              box-shadow: 1px 2px 5px rgba(0, 0, 0, 1);
          }
        .popup_body {
            margin: 20px;
            position: sticky;
            height: 0;
            top: 0;
        }
          .draggable {
              position: absolute;
              top: 50%;
              left: 50%;
              width: 500px;
              height: 500px;
              background-color: lightgray;
              cursor: move;
              display :none;
              box-shadow: 1px 2px 5px rgba(0, 0, 0, 1);
          }
        /*This was all taken from https://tympanus.net/Development/ButtonStylesInspiration/ but I needed to see it in CodePen
        */
        @import url(https://fonts.googleapis.com/css?family=Raleway:200,300,400,500,600);
        @font-face {
            font-weight: normal;
            font-style: normal;
            font-family: 'codropsicons';
            /*src: url("../fonts/codropsicons/codropsicons.eot");*/
            /*src: url("../fonts/codropsicons/codropsicons.eot?#iefix") format("embedded-opentype"), url("../fonts/codropsicons/codropsicons.woff") format("woff"), url("../fonts/codropsicons/codropsicons.ttf") format("truetype"), url("../fonts/codropsicons/codropsicons.svg#codropsicons") format("svg");*/
        }
        *,
        *:after,
        *:before {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        /* Top Navigation Style */

        /* Related demos */

        /* Box colors */

        /* Common button styles */
        .button {
            float: left;
            min-width: 15px;
            max-width: 150px;
            display: block;
            margin: 1em;
            padding: 1em 2em;
            border: none;
            background: none;
            color: inherit;
            vertical-align: middle;
            position: relative;
            z-index: 1;
            -webkit-backface-visibility: hidden;
            -moz-osx-font-smoothing: grayscale;
        }

        /* Text color adjustments (we could stick to the "inherit" but that does not work well in Safari) */
        /* Sizes */
        /* Typography and Roundedness */
        .button--round-s {
            border-radius: 5px;
        }
        /* Borders */
        .button--border-thin {
            border: 1px solid;
        }
        /* Individual button styles */
        /* Winona */
        .button--winona {
            overflow: hidden;
            padding: 0;
            -webkit-transition: border-color 0.3s, background-color 0.3s;
            transition: border-color 0.3s, background-color 0.3s;
            -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
            transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
        }
        .button--winona::after {
            content: attr(data-text);
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            opacity: 0;
            color:brown;
            -webkit-transform: translate3d(0, 25%, 0);
            transform: translate3d(0, 25%, 0);
        }
        .button--winona > span {
            display: block;
        }

        .button--winona::after,
        .button--winona > span {
            padding: 1em 2em;
            -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
            transition: transform 0.3s, opacity 0.3s;
            -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
            transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
        }
        .button--winona:hover {
            border-color: brown;


        }
        .button--winona.button--inverted:hover {
            border-color: brown;
            background-color:brown;
        }
        .button--winona:hover::after {
            opacity: 1;
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }
        .button--winona:hover > span {
            opacity: 0;
            -webkit-transform: translate3d(0, -25%, 0);
            transform: translate3d(0, -25%, 0);
        }


    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="form">
    <hr>
    <!--  상단 nav바 시작-->
    <nav class="top_nav">
        <a href="#">
            <div>
                <p>피아노</p>
            </div>
        </a>
        <a href="#">
            <div>
                <p>드럼</p>
            </div>
        </a>
        <a href="#">
            <div  class="select">
                <p>통기타</p>
            </div>
        </a>
        <a href="#">
            <div>
                <p>바이올린</p>
            </div>
        </a>
        <a href="#">
            <div>
                <p>트럼펫</p>
            </div>
        </a>
        <a href="#">
            <div>
                <p>플룻</p>
                </p>
            </div>
        </a>
        <a href="#">
            <div>
                <p>첼로</p>
            </div>
        </a>
        <a href="#">
            <div>
                <p>일렉 기타
                </p>
            </div>
        </a>
    </nav>
    <!--  상단 nav바 끝 -->
    <!--유저 게시판 작성 구현 시작-->

    <div class="free_notice_board">
        <ul>
            <li>게시판</li>
        </ul>

    </div>
    <br>
    <hr style="border: solid 1px black;">
    <br>
    <tbody class="test">
    </table>
    <br>
    <br>
    <hr style="border: solid 1px black;">
    <br>
    <br>
    <hr style="border: solid 1px black;">
    <table class="puser_board">
        <tbody class="test">
    </table>
    <br>
    <br>
    <hr style="border: solid 1px black;">
    <br>
    <br>

    <!--유저 게시판 리스트 구현 끝-->
</div>
<%--<c:forEach var="user" items="${userList}">--%>
<%--<div class="user-card">--%>
<%--    <div class="card-container" style="display:flex; justify-content:center;">--%>
<%--        <div class="card mb-3" style="width: 60%">--%>
<%--            <div class="row g-0">--%>
<%--                <div class="col-md-3">--%>
<%--                    <img src="..." class="img-fluid rounded-start" alt="...">--%>
<%--                    <p class="nickname">${user.nickname}</p>--%>
<%--                </div>--%>
<%--                <div class="col-md-9">--%>
<%--                    <div class="card-body">--%>
<%--                        <p class="card-text">자기소개: 저는${user.age}살이고요 성별은 ${user.sex}입니다 저는 ${user.teamId}의 팀입니다</p>--%>
<%--                        <div>악기</div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    </c:forEach>--%>
<!--======Pixel Grid======-->
<!--========Cards========-->
<%--<div class="container-fluid main-cont">--%>
<%--    <div class="row news-row">--%>
<%--        <div class="container-fluid col-md-12 col-sm-6 justify-content-center news-block">--%>
<%--            <div class="card-group">--%>
<%--                <c:forEach var="user" items="${userList}">--%>
<%--                <div class="underlay">--%>
<%--                    <div class="card">--%>
<%--                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/wLMJQPH.png')"></div>--%>
<%--                        <div class="card-block" >--%>
<%--                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">${user.nickname}<hr></h5>--%>
<%--                            <p class="card-text" >Canon will have a full slate of new and updated products to show attendees at this year’s NAB Show. The company has announced its new Compact-Servo 70-200mm telephoto zoom lens <a href="#"><u>Read More...</u></a></p>--%>
<%--                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!------------------------>
<!--=======Scripts======-->
<script>
    var main = function () {
        $('.push-bar').on('click', function(event){
            if (!isClicked){
                event.preventDefault();
                $('.arrow').trigger('click');
                isClicked = true;
            }
        });

        $('.arrow').css({
            'animation': 'bounce 2s infinite'
        });
        $('.arrow').on("mouseenter", function(){
            $('.arrow').css({
                'animation': '',
                'transform': 'rotate(180deg)',
                'background-color': 'black'
            });
        });
        $('.arrow').on("mouseleave", function(){
            if (!isClicked){
                $('.arrow').css({
                    'transform': 'rotate(0deg)',
                    'background-color': 'black'
                });
            }
        });

        var isClicked = false;

        $('.arrow').on("click", function(){
            if (!isClicked){
                isClicked = true;
                $('.arrow').css({
                    'transform': 'rotate(180deg)',
                    'background-color': 'black',
                });

                $('.bar-cont').animate({
                    top: "-15px"
                }, 300);
                $('.main-cont').animate({
                    top: "0px"
                }, 300);
                // $('.news-block').css({'border': '0'});
                // $('.underlay').slideDown(1000);

            }
            else if (isClicked){
                isClicked = false;
                $('.arrow').css({
                    'transform': 'rotate(0deg)',       'background-color': 'black'
                });

                $('.bar-cont').animate({
                    top: "-215px"
                }, 300);
                $('.main-cont').animate({
                    top: "-215px"
                }, 300);
            }
            console.log('isClicked= '+isClicked);
        });

        $('.card').on('mouseenter', function() {
            $(this).find('.card-text').slideDown(300);
        });

        $('.card').on('mouseleave', function(event) {
            $(this).find('.card-text').css({
                'display': 'none'
            });
        });
    };

    $(document).ready(main);

</script>
<script name="toggle-grid" type="text/javascript">
    $(document).ready(function(){
        $(document).on("keypress", function(event) {
            // If 'alt + g' keys are pressed:
            if (event.which === 169){
                $('#toggle-grid').toggle();
            }
        });

        $('#toggle-grid').on("click", function() {
            $('.pixel-grid').toggle();
            $('#toggle-grid').toggleClass('orange');
        });
    });
</script>
</body>