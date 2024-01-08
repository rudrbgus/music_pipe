<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<body lang="ko">

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
</div>
    <div class="emptyBox2"></div>
</div>
<%--    <a href="#" class="top-btn"><img src='/assets/img/pic01.jpg'></a>--%>
<a href="#" class="page-top">TOP</a>
</body>
<script>
    let page = {pageNo:1,amount:3};
    let index = 1;
    let isDate=true;
    const $body = document.querySelector('.list_body');
    $(window).scroll(async function () {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 10 && isDate) {
            console.log(page.pageNo);
            try {
                // 서버에서 데이터를 가져옴
                const response = await fetch("/user/list", {
                    method: "POST",
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({ equipmentId: ${instrument}, pageNo: page.pageNo, amount: 3 })
                });
                const users = await response.json();

                // 가져온 데이터를 가지고 동적으로 카드 생성
                createCards(users.users);

            } catch (error) {
                console.log('asdf');
                isDate=false;
                $endBox=`<div class="endBox"> tqlkf...</div>`
                $('.contentBox1').append($endBox);
            }


        }
    });

    let a= 0;
    // 데이터를 기반으로 카드를 동적으로 생성하는 함수
    function createCards(users) {
        // $('.contentBox1').empty();
        console.log("씨발롬아"+users);
        users.forEach(function (user) {
            const { nickname, age, sex, regDate, teamId ,email,userProfileImagePath,introduceText,equipmentList} = user;


            let list= ['보컬','기타','피아노','드럼','섹소폰','트럼펫','플루트','베이스'];
            let tagName;


            let card = `
        <div class="content">
            <div class="slider\${index} slider"></div>
            <a href="/user/profile?email=\${email}" class="content-card\${index} content-card">
                <img src="/local\${userProfileImagePath}">
                <div class="content-text">
                    <div class="tag tag\${a}">
                    </div>
                    <div class="title">\${nickname}<div>\${introduceText}</div></div>
                    <div class="information">미팅 유형 : 오프라인</div>
                </div>
            </a>
        </div>
      `;

            console.log(a);
            // 생성한 카드를 contentBox1에 추가
            $('.contentBox1').append(card);

            equipmentList.forEach(e=>{
                tagName=`<div class="tagName">\${list[e-1]}</div>`
                    $('.tag'+a).append(tagName);
            });
            a++;


            if(index===1){addHoverEffect(`.content-card1`, '#212121', '#ffffff', '#ffffff', '#212121');}
            else {addHoverEffect(`.content-card2`, '#212121', '#ffffff', '#212121', '#ffffff');}


            index===1?index++:index=1;
        });
        updateBodyHeight();
        page.pageNo++;
    }

    // JavaScript 코드
    function addHoverEffect(className, hoverColor, originalColor, hoverTitle, originalTitle) {
        document.querySelectorAll(className).forEach(function (card) {
            card.addEventListener('mouseenter', function () {
                card.querySelector('.title').style.color = hoverTitle;
            });

            card.addEventListener('mouseleave', function () {
                card.querySelector('.title').style.color = originalTitle;
            });
        });
    }

    // 초기 데이터 로딩
    async function initSwiperWithData() {
        try {
            if("${instrument}!=null"){


            // 서버에서 초기 데이터를 가져옴
            const response = await fetch("/user/list", {
                method: "POST",
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify({ equipmentId: ${instrument}, pageNo: page.pageNo,amount:page.amount})
            });
            const users = await response.json();
            console.log(users.users);

            // 가져온 데이터를 가지고 동적으로 카드 생성
            createCards(users.users);
            }else{
                // 서버에서 초기 데이터를 가져옴
                const response = await fetch("/user/list", {
                    method: "POST",
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({ equipmentId: 1,pageNo: page.pageNo,amount:page.amount})
                })
                const users = await response.json();
                console.log(users);

                // 가져온 데이터를 가지고 동적으로 카드 생성
                createCards(users.users);
            }

        } catch (error) {
            console.error('데이터를 가져오는 중 에러 발생:', error);
        }
    }

    initSwiperWithData();
    function updateBodyHeight() {
        // 현재 문서의 전체 높이를 가져와서 body의 높이로 설정
        const documentHeight = $(document).height();
        document.body.style.height = documentHeight + 'px';
        document.querySelector('.emptyBox1').style.height = documentHeight+'px';
    }
    const $buttons = document.querySelector('.bg-1');
    let $buttonArray = Array.from($buttons.children);
    for(let i=0;i<$buttonArray.length;i++){
        $buttonArray[i].addEventListener('click',()=>{
            console.log(i);
            // window.location.href = 'https://example.com';
        })
    }
</script>

</body>
</html>