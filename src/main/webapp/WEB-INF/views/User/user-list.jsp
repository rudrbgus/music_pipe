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
        }

        .news-block {
            margin: auto;
            padding: 0;
            background-color: #F2F2F2;
            max-width: 1600px;
            min-width: 100px;
            /*border: 20px solid black;*/
            /*border-image-slice: 1;*/
            transition: all 0.6s ease;
            animation: blockAppear 0.6s ease-in-out;
            border-radius: 10px;
        }

        .underlay {
            padding: 0;
            max-height: 350px;
            max-width: 340px;
            /*background-color: #f5d682;*/
            /*border: 1px solid black;*/
            margin: 30px;
            /*box-shadow: 1px 1px 3px 1px #dadce0;*/
            border-radius: 10px;


        }

        .card {
            margin: 0;
            width: 340px;
            max-height: 350px;
            max-width: 340px;
            background-color: transparent;
            border: 20px solid rgb(0,0,0,0.1);
            border-image-slice: 1;
            transition: transform 0.6s ease;
            animation: blockAppear 0.6s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        .test{
            background-color: white;
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
            /*border-bottom: 20px solid transparent;*/
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
            height: 10%;
            transition: box-shadow 0.6s ease;
        }

        .card:hover:before {
            max-width: 340px;
            box-shadow: 60px 60px 20px RGBA(142, 142, 142, 0.6);
        }

        .card:hover .card-img-top {
            background: no-repeat center center/cover;
            width: 100%;
            height: 140px;
        }

        .card:hover .card-block {
            width: 337px;
            background-color: white;
        }

        .card-title{
            text-align: center;
        }
        .card:hover .card-title {
            text-align: center;
            color: white;
        }

        .card:hover .card-text {
            color: white;
        }

        .card-block {
            background-color: transparent;
            background-color: white;
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
                /*transform: translate(0, -50px);*/
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
        /* 공통사용 스타일 시작*/
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
        /* 공통사용 스타일끝*/

        body {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-content: center;
            background-color: #DAA394;
        }
        .form {
            display: flex;
            flex-direction: column;
            width: 100%;
        }
        .top_nav {
            align-items: center;
            display: flex;
            justify-content: center;
            align-items: center;
            /*margin: 10px;*/
            /*margin-bottom: 50px;*/
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

        /*상단 로그줄 구현끝*/

        /*유저 게시판 리스트 구현시작*/
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
            /*padding:19px;*/
        }
        .free_notice_board > ul > li:nth-child(2){
            /*text-align:right;*/
        }
        table.user_board{
            margin:10px;
        }


        /*채팅창용 시작*/
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


header{
    display: none;
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
        <a href="#" class="show-menu">
                <i class="fas fa-solid fa-bars fa-2x"></i>
        </a>

    </nav>
    <hr>
    <!--  상단 nav바 끝 -->
    <!--유저 게시판 작성 구현 시작-->

<%--    <div class="free_notice_board">--%>
<%--        <hr style="border: solid 1px black;">--%>
<%--        <ul>--%>
<%--            <li>유저 게시판</li>--%>
<%--        </ul>--%>

<%--    </div>--%>
<%--    <hr style="border: solid 1px black;">--%>
    <div class="test">
        <div class="container-fluid main-cont">
            <div class="row news-row">
                <div class="container-fluid col-md-12 col-sm-6 justify-content-center news-block">
                    <div class="card-group">
<%--                        js로 받아오는 곳--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr style="border: solid 1px black;">
    <br>
    <br>
    <!--유저 게시판 리스트 구현 끝-->
</div>
<!--========Cards========-->
<!--=======Scripts======-->
<script>

    $(document).ready(function() {
        // 서버에서 데이터를 가져오는 함수
        function fetchGetUserList() {
            return fetch("/user/list", {
                method: "POST",
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify({ equipmentId: 1 })
            }).then(res => {
                return res.json();
            }).then(users => {
                // 가져온 데이터를 가지고 동적으로 카드 생성
                createCards(users);
            }).catch(error => {
                console.error('데이터를 가져오는 중 에러 발생:', error);
            });
        }

        // 데이터를 기반으로 카드를 동적으로 생성하는 함수
        function createCards(users) {
            // 기존의 카드 그룹 내의 요소를 모두 삭제
            $('.card-group').empty();

            // 각 유저 데이터에 대해 카드 생성 및 추가
            users.forEach(function(user) {
                console.log(user);
                const{nickname,age,sex,regDate,teamId}=user
                var card = `
                <div class="underlay">
                <div class="card">
                    <div class="card-img-top" style="background-image: url('https://i.imgur.com/wLMJQPH.png')"></div>
                    <div class="card-block">
                        <h5 class="card-title" style="font-family: 'Anton' , sans-serif">\${nickname}</h5>
                        <p class="card-text">성별 : \${sex}<br>나이 : \${age}<br>가입 날짜 : \${regDate}<br>짧은 소개 : 요즘 우리 시대는 스낵 콘텐츠 시대, 동영상 콘텐츠 시대를 살아가면서 점점 텍스트를 만나는 일이 줄어들고 있다. 텍스트를 만나는 일이 줄어들면서 자연스럽게 텍스트로 표현하는 일도 줄어들고 있다. 트위터는 130자 한정으로 텍스트 출력의 단축을 이끌었고, 인스타그램은 이제 사진 한 장으로 충분하다. <br><a href="#"><u>Read More...</u></a></p>
                        <p class="card-text"><small class="text-muted">자세히보려면 클릭하세요!</small></p>
                    </div>
                </div>
                </div>
            `;
                // 생성한 카드를 card-group에 추가
                $('.card-group').append(card);
            });
        }

        // 페이지 로드 시 데이터 가져오기
        fetchGetUserList().then(main);

    });

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
                $('.news-block').css({'border': '0'});
                $('.underlay').slideDown(1000);

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
            $(this).find('.card-text').slideDown(600);
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
    const $menu = document.querySelector('.show-menu');
    const header = document.getElementsByTagName('header')[0];

    $menu.addEventListener('click', (e) => {
        header.style.display = 'block'; // 헤더를 보이게 함

        // 3000 밀리초(3초) 후에 다시 숨김
        setTimeout(() => {
            header.style.display = 'none';
        }, 3000);
    });



</script>
</body>