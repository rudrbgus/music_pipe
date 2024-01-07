<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Web Study</title>
    <%@include file="../include/static-head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap');

        body {
            /*background: rgba(86, 232, 226, 0.87);*/
            font-family: 'Jua', sans-serif;
        }

        /*엄마*/
        .profile_main_container {
            width: 60%;
            height: 70vh;
            border: 1.5px deepskyblue solid;
            border-radius: 20px;
            margin: 220px auto 0;
            background: aliceblue;
            filter: drop-shadow(1px 1px 10px rgba(69, 137, 211, 0.96));
        }
        .request-team{
            width: 60%;
            height: 30vh;
            border: 1.5px deepskyblue solid;
            border-radius: 20px;
            margin: 110px auto 0;
            background: aliceblue;
            filter: drop-shadow(1px 1px 10px rgba(69, 137, 211, 0.96));
        }

        /* 프로필 컨테이너*/
        .profile_main_container .profile_container {
            /* background: #eee; */
            width: 100%;
            height: 60%;
            display: flex;
            align-items: center;
            /*background: yellow;*/
        }

        #img-input {
            display: none;
        }


        .upload-box:hover {
            display: block;
            width: 250px;
            height: 250px;
            border-radius: 50%;
            background-clip: content-box;
            animation: spin 10s linear infinite;
        }

        .upload-box:active {
            animation: spin 3s linear infinite;
        }

        .profile_image_box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            flex: 3;
            font-size: 2rem;
        }

        .profile_image_box .upload-box {
            width: 250px;
            height: 250px;
            border: 2px solid rgba(141, 191, 243, 0.93);
            filter: drop-shadow(1px 1px 10px cadetblue);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: red;
            font-weight: 700;
            cursor: pointer;
            overflow: hidden;
        }

        .profile_image_box .upload-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile_image_box .profile_nickname {
            margin-top: 20px;
        }

        .profile_image_box .submit-button {
            margin-top: 20px;
            background: greenyellow;
            border: 3px solid black;
            font-size: 1.2rem;
            border-radius: 40px;
        }

        .profile_text {
            /*border: 2px solid rgba(141, 191, 243, 0.93);*/
            height: 70%;
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 2rem;
            flex: 7;
        }

        .profile_text div {
            /*background: greenyellow;*/
            margin-left: 15px;
            margin-top: 30px;
        }

        .profile_instrument {
            height: 40%;
            /*background: red;*/
        }

        /*악기 테이블*/
        .profile_instrument_list {
            height: 100%;
            /*background: darkred;*/
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
        }

        /* 악기 하나하나 테두리*/
        .profile_instrument_list .profile_instrument_image_box {
            width: 25%;
            height: 50%;
            padding: 10px;
            border: rgba(75, 220, 169, 0.77) 1px double;
            cursor: pointer;
            display: flex;
            justify-content: center;
        }


        .profile_instrument_list .profile_instrument_image_box.on {
            background: green;
        }

        .profile_instrument_list img {
            height: 100%;
            object-fit: cover;
        }


        @keyframes spin {
            100% {
                transform: rotateZ(360deg);
            }
        }

        /*모달 페이지 꾸미는 부분*/
        .modal {
            position: absolute;
            top: 30%;
            left: 30%;

            width: 50%;
            height: 50%;

            display: none;

            background-color: rgba(0, 0, 0, 0.4);

        }

        .modal .present-instrument-list {
            display: flex;
            flex-flow: row wrap;
            width: 100%;
            height: auto;
        }

        .modal .present-instrument-list a {
            cursor: pointer;
            width: auto;
            flex: 1;
        }

        .modal .present-instrument-list a.click {
            background: green;
        }

        .modal .present-instrument-list img {
            width: 125px;
            object-fit: cover;
        }

        .modal .present-instrument-list .none {
            display: none;
        }

        .modal .createTeamBtn123 {
            width: fit-content;
            font-size: 2rem;
            text-align: center;
            display: flex;
            background: #8bc8e2;
            border: 1px rgba(51, 84, 140, 0.82) solid;
            border-radius: 20px;
        }

        .profile-introduce-text-container {
            display: flex;
            flex-flow: row;
        }

        .profile-introduce-text-button {
            background: cornflowerblue;
            border-radius: 20px;
            font-size: 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 150px;
        }


    </style>

</head>
<body>
<%@include file="../include/header.jsp" %>
<div class="profile_main_container">
    <div class="profile_container">
        <div class="profile_image_box">
            <!-- 프로필 사진 -->
            <div class="upload-box">
                <c:if test="${login == null || user.profileImagePath == null}">
                    <img src="/assets/img/profile.png" alt="프사">
                </c:if>
                <c:if test="${login != null && user.profileImagePath != null}">
                    <img class="inputImage" src="/local${user.profileImagePath}" alt="가져온 프사">
                </c:if>
            </div>
            <form action="/user/addProfileImage" method="post" enctype="multipart/form-data">
                <input id="img-input" type="file" name="thumbnail" accept="image/*">
                <button class="submit-button" type="submit" style="display: none">프로필 이미지 수정하기</button>
            </form>
            <div class="profile_nickname">${user.nickname} </div>
        </div>
        <div class="profile_text">
            <c:if test="${user != null}">
                <c:if test="${user.nickname == login.nickname}">
                    <button type="submit" class="profile-introduce-text-button" id="introduceModifyBtn">수정하기</button>
                </c:if>
                <div class="profile-introduce-text">자기소개 : ${user.introduceText}</div>
                <input class="profile-input" type="text" style="display: none">
                <div class="profile_email">이메일 : ${user.email} </div>
                <div class="profile_team">소속 팀
                    <c:if test="${user.team_id!=0}">
                        ${user.teamName}
                        <button id="teamCreateFormBtn" style="display: none" class="creative_team_btn">팀 생성</button>
                    </c:if>
                    <c:if test="${user.team_id==0}">
                        <button id="teamCreateFormBtn" class="creative_team_btn">팀 생성</button>
                    </c:if>

                </div>
            </c:if>
        </div>
    </div>
    <%--  악기 리스트  --%>
    <%--  a 클래스에 on 추가하면 색이 바뀜.--%>
    <%--    데이터에 개인 악기 가 있으면 그거에 해당하는 값만 on 칠하기
    그게 없으면  아무색도 없고
    개인악기가 있는 상황에서 다른 거 클릭하면 alret로 수정하시겠습니까  띄우고 수정하면 그거에 관련된 값 업데이트 하기--%>
    <div class="profile_instrument">
        <div class="profile_instrument_list">
            <a class="profile_instrument_image_box instrument1" id="1">
                <img class="instrument1 img" src="/assets/img/guitar2.png" name="1">
            </a>
            <a class="profile_instrument_image_box instrument2" id="2">
                <img class="instrument2 img" src="/assets/img/drum.png" name="2">
            </a>
            <a class="profile_instrument_image_box instrument3" id="3">
                <img class="instrument3 img" src="/assets/img/vocal.png" name="3">
            </a>
            <a class="profile_instrument_image_box instrument4" id="4">
                <img class="instrument4 img" src="/assets/img/keyboard.png" name="4">
            </a>
            <a class="profile_instrument_image_box instrument5" id="5">
                <img class="instrument5 img" src="/assets/img/saxophone.png" name="5">
            </a>
            <a class="profile_instrument_image_box instrument6" id="6">
                <img class="instrument6 img" src="/assets/img/trumpet.png" name="6">
            </a>
            <a class="profile_instrument_image_box instrument7" id="7">
                <img class="instrument7 img" src="/assets/img/flute.png" name="7">
            </a>
            <a class="profile_instrument_image_box instrument8" id="8">
                <img class="instrument8 img" src="/assets/img/bass-guitar.png" name="8">
            </a>
        </div>
    </div>
</div>

<%-- 팀 요청 리스트 --%>
<%-- 자신이 크루의 리더면 요청한 사람들의 요청이 뜸 --%>
<div class="request-team">
    <div class="request-form">
        <div class="name">1</div>
        <div class="profile-image"><img src="" alt="">1</div>
        <div class="instrument"><img src="" alt="">1</div>
    </div>
</div>


<div class="modal" id="modal">
    <div class="modal_container">
        <form action="/team/register" name="createTeam" method="post" id="createTeamForm">
            <h3>팀생성</h3>
            <div class="teamNameContainer">
                팀명 : <input name="teamName" type="text" class="teamName" placeholder="teamName" id="teamName"/>
            </div>
            <div class="present-instrument-list">
                <a class="instrument1 none">
                    <img class="instrument1 img" src="/assets/img/guitar2.png" name="1">
                </a>
                <a class="instrument2 none">
                    <img class="instrument2 img" src="/assets/img/drum.png" name="2">
                </a>
                <a class="instrument3 none">
                    <img class="instrument3 img" src="/assets/img/vocal.png" name="3">
                </a>
                <a class="instrument4 none">
                    <img class="instrument4 img" src="/assets/img/keyboard.png" name="4">
                </a>
                <a class="instrument5 none">
                    <img class="instrument5 img" src="/assets/img/saxophone.png" name="5">
                </a>
                <a class="instrument6 none">
                    <img class="instrument6 img" src="/assets/img/trumpet.png" name="6">
                </a>
                <a class="instrument7 none">
                    <img class="instrument7 img" src="/assets/img/flute.png" name="7">
                </a>
                <a class="instrument8 none">
                    <img class="instrument8 img" src="/assets/img/bass-guitar.png" name="8">
                </a>
            </div>
            <div class="createTeamBtn123">팀 생성</div>
        </form>
    </div>
</div>

</body>
<script>


    const $box = document.querySelector('.upload-box');
    const $input = document.getElementById('img-input');
    const $instrumentImageBox = document.querySelector('.profile_instrument_list');

    //비동기로 유저 악기 가져오기
    function getInstrument() {
        fetch("/user/getInstrument", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                email: "${user.email}"
            })
        }).then(res => {
            console.log(res);
            return res.json();
        }).then(result => {
            result.forEach(s => {
                console.log(s.equipmentId);
                if (s.equipmentId !== 0) {
                    const $instrument = document.querySelector(".profile_instrument_image_box.instrument" + s.equipmentId);
                    const $modalInstrument = document.querySelector(".modal .instrument" + s.equipmentId);
                    console.log($instrument);
                    $instrument.classList.add("on");
                    $modalInstrument.classList.remove("none");
                }
            })
        })
    }
    function getTeamRequest(){
        fetch("/user/getInstrument", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                email: "${user.email}"
            })
        }).then(res => {
            console.log(res);
            return res.json();
        }).then(result => {
            result.forEach(s => {
                console.log(s.equipmentId);
                if (s.equipmentId !== 0) {
                    const $instrument = document.querySelector(".profile_instrument_image_box.instrument" + s.equipmentId);
                    const $modalInstrument = document.querySelector(".modal .instrument" + s.equipmentId);
                    console.log($instrument);
                    $instrument.classList.add("on");
                    $modalInstrument.classList.remove("none");
                }
            })
        })
    }
    if ("${login.nickname}" === "${user.nickname}") {
        console.log("나 실행함 이프")
        $box.onclick = e => {
            $input.click();
        };

        // 악기 눌렀을 때
        $instrumentImageBox.onclick = e => {
            if (e.target.classList.contains("profile_instrument_image_box") || e.target.classList.contains("img")) {
                if (e.target.classList.contains("profile_instrument_image_box")) {
                    if (e.target.classList.contains("on")) {
                        let b = confirm('이 악기를 제거하시겠습니까?');
                        if (!b) return;
                        e.target.classList.remove("on");
                        fetch("/user/instrument", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",
                            },
                            body: JSON.stringify({
                                email: "${user.email}",
                                instrumentId: e.target.getAttribute("id"),
                                onOff: false
                            })
                        })
                    } else {
                        let b2 = confirm('이 악기를 추가하시겠습니까?');
                        if (!b2) return;
                        e.target.classList.add("on");

                        fetch("/user/instrument", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",
                            },
                            body: JSON.stringify({
                                email: "${user.email}",
                                instrumentId: e.target.getAttribute("id"),
                                onOff: true
                            })
                        })
                    }
                }
                if (e.target.classList.contains("img")) {
                    if (e.target.parentElement.classList.contains("on")) {
                        let b1 = confirm('이 악기를 제거하시겠습니까?');
                        if (!b1) return;
                        ;
                        e.target.parentElement.classList.remove("on");
                        fetch("/user/instrument", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",

                            },
                            body: JSON.stringify({
                                email: "${user.email}",
                                instrumentId: e.target.getAttribute("name"),
                                onOff: false
                            })
                        })
                    } else {
                        let b3 = confirm('이 악기를 추가하시겠습니까?');
                        if (!b3) return;
                        e.target.parentElement.classList.add("on");

                        // ExistedElement.classList.remove("on");

                        fetch("/user/instrument", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",

                            },
                            body: JSON.stringify({
                                email: "${user.email}",
                                instrumentId: e.target.getAttribute("name"),
                                onOff: true
                            })
                        })
                    }
                }
            }
        }
    }else{
        getInstrument();
    }

    // 프로필 사진 선택시 썸네일 보여주기
    $input.onchange = e => {
        // 사용자가 선택한 파일 읽기
        const fileDate = $input.files[0];
        console.log(fileDate);

        // 첨부파일의 바이트데이터를 읽는 객체를 생성
        const reader = new FileReader();

        // 파일의 바이트데이터를 읽어서 img태그의 src속성에 넣으려면
        // URL형태로 파일을 읽어아햐나는데 그거를 처리하는 함수
        reader.readAsDataURL(fileDate);

        // 첨부파일이 등록되는 순간 img태그에 이미지를 세팅
        reader.onloadend = e => {
            const $img = $box.querySelector('.inputImage');
            $img.setAttribute('src', reader.result);
            const $submitButton = document.querySelector('.submit-button');
            $submitButton.style.display = "flex";
        }
    }

    //팀 생성 폼 버튼 열기 버튼
    const $teamCreateFormBtn = document.getElementById('teamCreateFormBtn');
    const $teamCreateFormModal = document.getElementById('modal');
    $teamCreateFormBtn.onclick = e => {
        console.log(e.target);
        getInstrument();
        $teamCreateFormModal.style.display = 'flex';
    };


    // 수정하기 버튼 눌렀을 떄
    const $introduceText = document.querySelector(".profile-introduce-text");
    const $button = document.getElementById('introduceModifyBtn');
    const $inputIntroduce = document.querySelector(".profile-input");
    $button.onclick = e => {
        if ($button.innerText === '수정하기') {
            console.log(e.target);
            $inputIntroduce.style.display = "flex";
            $button.innerText = '완료';
        } else if ($button.innerText === '완료') {
            if ($inputIntroduce.value.trim() !== "") {
                fetch("/user/introduce", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        introduceText: $inputIntroduce.value
                    })
                })
            }
            console.log("완료 버튼 누름");
            console.log($inputIntroduce.value);
            console.log($introduceText.innerText);
            $introduceText.innerText = "자기소개: " + $inputIntroduce.value;
            $inputIntroduce.style.display = "none";
            $button.innerText = '수정하기';
        }
    };
    // 모달안에 있는 악기 눌렀을 때
    const $modalBtn = document.querySelector('.modal .present-instrument-list');
    $modalBtn.onclick = e => {
        for (let i = 0; i < $modalBtn.children.length; i++) {
            $modalBtn.children.item(i).classList.remove("click");
        }
        e.target.parentNode.classList.add("click");
    }

    // 팀 생성 버튼 눌렀을때
    const $modalSubmitButton123 = document.querySelector(".createTeamBtn123");
    const $teamName = document.getElementById("teamName");
    $modalSubmitButton123.onclick = e => {
        const $clickedInstrument = document.querySelector(".modal a.click");
        console.log($teamName);
        console.log($clickedInstrument.querySelector("img").name);
        fetch("/team/register", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                teamName: $teamName.value,
                introduceText: $clickedInstrument.querySelector("img").name,
                role: "master"
            })
        })
    }





    (() => {
        getInstrument();
        getTeamRequest();
    })();
    $(document).ready(function (){
        getInstrument();
    })
</script>


</html>