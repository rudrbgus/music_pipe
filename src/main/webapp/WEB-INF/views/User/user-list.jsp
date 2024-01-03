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

        @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap");
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
            background: var(--clr-dark);
            color: var(--clr-light);
            min-height: 100vh;
            display: grid;
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
    <div class="game">
        <div class="rank">2</div>
        <div class="front">
            <img src="https://thumbs.dreamstime.com/z/dj-dog-listening-to-music-behind-empty-blank-wood-wall-victory-peace-fingers-43357579.jpg" alt="game">
            <h3 class="name">Just Chatting</h3>
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