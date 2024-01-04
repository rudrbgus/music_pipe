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
    <%@include file="../include/static-head.jsp"%>
    <style>

        /*@import url(http://weloveiconfonts.com/api/?family=entypo);*/
        /*@import url(https://fonts.googleapis.com/css?family=Roboto);*/

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
            justify-content: left;
            align-content: center;
            /*background-image: url("/assets/img/overlay.png"), url("/assets/img/bg.jpg");*/
            /*height: 100vh;*/
            /*background-size: cover;*/
            /*background-repeat: no-repeat;*/
        }
        .form {
            display: flex;
            flex-direction: column;
            width: 100%;
            align-items: center;


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
        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }
        :root {
            --clr-dark: rgb(13, 17, 19);
            --clr-light: #fff;
            --clr-secondary: #0a84ff;
        }
        body {
            font-family: sans-serif;
            /*background: var(--clr-dark);*/
            color: var(--clr-light);
            min-height: 100vh;
            display: flex;
            place-items: center;
        }

        h1,
        h2,
        h3,
        p {
            margin: 0;
        }
        img {
            max-width: 100%;
        }
        .btn {
            cursor: pointer;
            padding: 0.5em 1em;
            border: 0;
            background: var(--clr-secondary);
            color: var(--clr-light);
            font-weight: bold;
            border-radius: 12px;
        }
        .game {
            position: relative;
            width: 12rem;
            margin: 60px;
        }
        .streamers {
            display: flex;
            text-align: center;
            img {
                width: 2rem;
                height: 2rem;
                border-radius: 50%;
            }
        }
        .front {
            transition: 200ms;
            & > img {
                border-radius: 12px;
            }
            .name {
                margin: 0.75em 0;
            }
            .status {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .streamers img {
                border: 1px solid var(--clr-dark);
                &:nth-child(1) {
                    z-index: 1;
                    transform: translateX(15px);
                }
                &:nth-child(2) {
                    transform: translateX(10px);
                }
            }
        }

        .back {
            position: absolute;
            top: 56%;
            left: 0;
            right: 0;
            opacity: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1em;
            .streaming-info {
                columns: 2;
                column-rule: 1px solid rgba(255, 255, 255, 0.6);
            }
            .game-stat {
                font-size: 1.2rem;
                text-align: center;
                span {
                    display: block;
                    font-size: 0.8rem;
                }
            }
            .streamers {
                display: flex;
            }
        }
        .backgroundWrapper {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgb(36, 40, 42);
            z-index: -1;
            transform: scale(0.2, 0.8);
            opacity: 0;
            border-radius: 12px;
        }
        .game:hover {
            .front {
                transform: translateY(-25%) scale(0.8);
                .name {
                    animation: gameName 150ms forwards;
                }
                .status {
                    opacity: 0;
                }
            }
            .back {
                opacity: 1;
                .streamers {
                    width: 100%;
                    justify-content: space-between;
                }
                .streamer {
                    font-size: 0.9rem;
                }
                .name {
                    font-weight: bold;
                }
            }
            .rank {
                top: -35px;
                right: -30px;
            }
            .backgroundWrapper {
                transition: transform 200ms ease-in-out, opacity 100ms linear;
                opacity: 1;
                transform: scale(1.4, 1.2);
            }
        }

        .rank {
            position: absolute;
            right: 15px;
            font-weight: bold;
            font-size: 1.12rem;
            color: white;
            background: rgba(0, 0, 0, 0.75);
            padding: 0.5em 0.5em;
            clip-path: polygon(100% 0%, 100% 100%, 50% 85%, 0 100%, 0 0);
            transition: 250ms ease-in-out;
        }

        @keyframes gameName {
            0% {
                text-align: left;
                opacity: 1;
            }
            20% {
                text-align: left;
                opacity: 0;
            }
            50% {
                text-align: center;
                opacity: 0;
            }
            100% {
                text-align: center;
                opacity: 1;
            }

        }
        .board{
            display: flex;
            flex-wrap: wrap;
            width: 1600px;
            /*background-color: white;*/
            min-height: 1000px;
            /*box-shadow: 12px 12px 7px rgba(0, 0, 0, 0.7);*/
        }
        .board:nth-child(3n+1) {
            clear: left;
        }
        .game-box{
            background-color: white;
        }
        .qwer{
            display: flex;
            height: 100vh;
            margin-top: 120px;
            justify-content: center;
            align-items: flex-start;
            width: 100%;

        }
        .navDiv{
            overflow: auto;
            clear: both;
            width: 10%;
            /*margin: 10% auto;*/
            background: #ffffff;
            margin-top: 120px;
            margin-right: 50px;
        }

        .navDiv ul {
            height: 100vh;
            list-style: none;
            margin: 0px;
            padding: 0px;
            width: 200px;
        }

        .navDiv li{
            float: none;
            width: 100%;
        }

        .navDiv li a{
            display: block;
            width: 100%;
            padding: 20px;
            border-left: 5px solid;
            position: relative;
            z-index: 2;
            text-decoration: none;
            color: #444;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
        }

        .navDiv li a:hover{ border-bottom: 0px; color: #fff;}
        .navDiv li:first-child a{ border-left: 10px solid #3498db; }
        .navDiv li:nth-child(2) a{ border-left: 10px solid #ffd071; }
        .navDiv li:nth-child(3) a{ border-left: 10px solid #f0776c; }
        .navDiv li:last-child a{ border-left: 10px solid #1abc9c; }

        .navDiv li a:after {
            content: "";
            height: 100%;
            left: 0;
            top: 0;
            width: 0px;
            position: absolute;
            transition: all 0.3s ease 0s;
            -webkit-transition: all 0.3s ease 0s;
            z-index: -1;
        }

        .navDiv li a:hover:after{ width: 100%; }
        .navDiv li:first-child a:after{ background: #3498db; }
        .navDiv li:nth-child(2) a:after{ background: #ffd071; }
        .navDiv li:nth-child(3) a:after{ background: #f0776c; }
        .navDiv li:nth-child(4) a:after{ background: #f0776c; }
        .navDiv li:nth-child(5) a:after{ background: #f0776c; }
        .navDiv li:nth-child(6) a:after{ background: #f0776c; }
        .navDiv li:nth-child(7) a:after{ background: #f0776c; }
        .navDiv li:last-child a:after{ background: #1abc9c; }



        @font-face {
            font-family: 'Lato';
            font-style: normal;
            font-weight: 100;
            src: local('Lato Hairline'), local('Lato-Hairline'), url(http://themes.googleusercontent.com/static/fonts/lato/v6/boeCNmOCCh-EWFLSfVffDg.woff) format('woff');
        }
        @font-face {
            font-family: 'Lato';
            font-style: normal;
            font-weight: 300;
            src: local('Lato Light'), local('Lato-Light'), url(http://themes.googleusercontent.com/static/fonts/lato/v6/KT3KS9Aol4WfR6Vas8kNcg.woff) format('woff');
        }
        @font-face {
            font-family: 'Lato';
            font-style: normal;
            font-weight: 400;
            src: local('Lato Regular'), local('Lato-Regular'), url(http://themes.googleusercontent.com/static/fonts/lato/v6/9k-RPmcnxYEPm8CNFsH2gg.woff) format('woff');
        }
        @font-face {
            font-family: 'Lato';
            font-style: normal;
            font-weight: 700;
            src: local('Lato Bold'), local('Lato-Bold'), url(http://themes.googleusercontent.com/static/fonts/lato/v6/wkfQbvfT_02e2IWO3yYueQ.woff) format('woff');
        }

    </style>
</head>
<body class="list_body">

<%@ include file="../include/header.jsp" %>
<div class="navDiv">
    <ul>
        <li><a href="">피아노</a></li>
        <li><a href="">드럼</a></li>
        <li><a href="">통기타</a></li>
        <li><a href="">일렉기타</a></li>
        <li><a href="">바이올린</a></li>
        <li><a href="">베이스</a></li>
        <li><a href="">하프</a></li>
        <li><a href="">가야금</a></li>
    </ul>
</div>
<div class="qwer">
<div class="form">
    <hr>
    <h2>게시판</h2>
    <hr>
    <div class="board">
    </div>
</div>
</div>
<hr style="border: solid 1px black;">
<br>
<br>
<!--유저 게시판 리스트 구현 끝-->
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
        let i=1;
        // 데이터를 기반으로 카드를 동적으로 생성하는 함수
        function createCards(users) {
            // 기존의 카드 그룹 내의 요소를 모두 삭제
            $('.card-group').empty();

            // 각 유저 데이터에 대해 카드 생성 및 추가
            users.forEach(function(user) {

                console.log(user);
                const{nickname,age,sex,regDate,teamId}=user
                var card = `
            <div class="game">
            <div class="game-box">
            <div class="rank">\${i}</div>
            <div class="front">
                <img src="data:image/png;base64,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" alt="game">
                <h3 class="name">\${nickname}</h3>
                <div class="status">
                    <p class="viewers">132.5k</p>
                    <div class="streamers">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="">
                        <img src="https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=3759e09a5b9fbe53088b23c615b6312e" alt="">
                    </div>
                </div>
            </div>
            <div class="back">
                <div class="streaming-info">
                    <p class="game-stat">174.4k <span>Watching</span></p>
                    <p class="game-stat">3,172<span>Streams</span></p>
                </div>
                <button class="btn">See more streams</button>
                <div class="streamers">
                    <div class="streamer">
                        <div class="icon">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="">
                        </div>
                        <p class="name">gamer 1</p>
                        <p class="number">18k</p>
                    </div>
                    <div class="streamer">
                        <div class="icon">
                            <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="">
                        </div>
                        <p class="name">gamer 2</p>
                        <p class="number">9,600</p>
                    </div>
                    <div class="streamer">
                        <div class="icon">
                            <img src="https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=3759e09a5b9fbe53088b23c615b6312e" alt="">
                        </div>
                        <p class="name">gamer 3</p>
                        <p class="number">7,407</p>
                    </div>
                </div>
            </div>
            <div class="backgroundWrapper"></div>
            </div>
            <%--자바스ㅡ립트 구현--%>
        </div>
            `;
                // 생성한 카드를 board에 추가
                $('.board').append(card);
                i++;
            });
        }

        // 페이지 로드 시 데이터 가져오기
        fetchGetUserList();

    });


</script>




</script>
</body>