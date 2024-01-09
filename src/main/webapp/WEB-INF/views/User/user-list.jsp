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
    <div class="box bg-1 asdf" id="search">
        <button  class="button button--winona button--border-thin button--round-s piano" data-text="piano"><span><img src="/assets/img/icon/icon-guitar.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s drum" data-text="drum"><span><img src="/assets/img/icon/icon-piano.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s keyboard" data-text="keyboard"><span><img src="/assets/img/icon/icon-drum.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s acu" data-text="acu"><span><img src="/assets/img/icon/icon-microphone.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s elc" data-text="elc"><span><img src="/assets/img/icon/icon-violin.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s base vocal" data-text="vocal"><span><img src="/assets/img/icon/icon-flute.png" alt="tq"></span></button>
        <button class="button button--winona button--border-thin button--round-s guitar" data-text="guitar"><span><img src="/assets/img/icon/icon-harp.png" alt="tq"></span></button>
    </div>
</div>
<div class="listBox1">

    <div class="emptyBox1"></div>
    <div class="contentBox1">
</div>
    <div class="emptyBox2"></div>
</div>
<%--    <a href="#" class="top-btn"><img src='/assets/img/pic01.jpg'></a>--%>
<a href="#" class="page-top">TOP↑</a>
<form action="/user/list/instrument" method="POST" style="display: none">
    <input class="inputvalues" name="keyword">
    <button type="submit" class="submit-button"></button>
</form>
</body>
<script>
    let page = {pageNo:1,amount:3};
    let index = 1;
    let isDate=true;
    const $body = document.querySelector('.list_body');
    $(window).scroll(async function () {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() -1 && isDate) {
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
                $endBox=`<div class="endBox"> 더 이상 유저 리스트가 없습니다.</div>`
                $('.contentBox1').append($endBox);
            }


        }
    });

    const $list = document.querySelector('.asdf');
    const $button123 = document.querySelector(".submit-button")
    const $input123 = document.querySelector('.inputvalues');
    $list.onclick = e =>{
        if(e.target.classList.contains("piano")){
            $input123.value = "피아노"
            $button123.click();
        }
        if(e.target.classList.contains("drum")){
            $input123.value = "드럼"
            $button123.click();
        }        if(e.target.classList.contains("keyboard")){
            $input123.value = "키보드"
            $button123.click();
        } if(e.target.classList.contains("acu")){
            $input123.value = "어쿠스틱"
            $button123.click();
        }       if(e.target.classList.contains("elc")){
            $input123.value = "일렉"
            $button123.click();
        }        if(e.target.classList.contains("base")){
            $input123.value = "베이스"
            $button123.click();
        }        if(e.target.classList.contains("vocal")){
            $input123.value = "보컬"
            $button123.click();
        }        if(e.target.classList.contains("guitar")){
            $input123.value = "기타"
            $button123.click();
        }
    }
    console.log($list.classList);

    let a= 0;
    // 데이터를 기반으로 카드를 동적으로 생성하는 함수
    function createCards(users) {
        // $('.contentBox1').empty();
        // console.log("씨발롬아"+users);
        users.forEach(function (user) {
            const { nickname, age, sex, regDate, teamId ,email,userProfileImagePath,introduceText,equipmentList,teamName} = user;


            let list= ['보컬','피아노','보컬','피아노','섹소폰','트럼펫','플루트','기타'];
            let tagName;


            let card = `
        <div class="content">
            <div class="slider\${index} slider"></div>
            <a href="/user/profile?email=\${email}" class="content-card\${index} content-card">
                <img id="proImg" src="/local\${userProfileImagePath}" onerror="this.onerror=null; this.src='/assets/img/profile.png'">



                <div class="content-text">
                    <div class="tag tag\${a}">
                    </div>
                    <div class="title">\${nickname}<div class="introText">자기소개 : \${introduceText}</div></div>
                    <div class="information">소속 팀 : \${teamName}</div>
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
    function handleImageError() {
        let image = document.getElementById('proImg');
        // 이미지 로딩 오류 시 대체 이미지로 교체
        image.src = "/assets/img/profile.png";
        // 대체 이미지의 대체 텍스트 설정
        image.alt = "Default Image";
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



</script>

</body>
</html>