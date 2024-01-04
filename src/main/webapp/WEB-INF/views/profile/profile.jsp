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
            background: #DAA394;
            font-family: 'Jua', sans-serif;
        }

        .profile_main_container {
            width: 60%;
            height: 70vh;
            border: 3px solid #000;
            margin: 220px auto 0;
            background: #e4e4e4;
        }

        /* 프로필 컨테이너*/
        .profile_main_container .profile_container {
            /* background: #eee; */
            width: 100%;
            height: 60%;
            display: flex;
            background: yellow;
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
        }

        .profile_text {
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            font-size: 2rem;
            flex: 7;
        }

        .upload-box {
            width: 250px;
            height: 250px;
            border: 3px dashed black;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: red;
            font-weight: 700;
            cursor: pointer;
            overflow: hidden;
        }

        .upload-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile_instrument {
            background: red;
        }

        /*악기 테이블*/
        .profile_instrument_list {
            width: 100%;
            height: 300px;
            background: darkred;
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
        }

        /* 악기 하나하나 테두리*/
        .profile_instrument_list .profile_instrument_image_box {
            width: 25%;
            height: 50%;
            padding: 10px;
            border: black 1px solid;
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
                    <img src="/local${user.profileImagePath}" alt="가져온 프사">
                </c:if>
            </div>
            <form action="/user/addProfileImage" method="post" enctype="multipart/form-data">
                <input id="img-input" type="file" name="thumbnail" accept="image/*">
                <button type="submit">프로필 이미지 수정하기</button>
            </form>
        </div>
        <div class="profile_text">
            <c:if test="${user != null}">
                <div class="profile_nickname">닉네임 : ${user.nickname} </div>
                <div class="profile_email">이메일 : ${user.email} </div>
                <div class="profile_team">소속 팀 : ${user.nickname}
                    <button class="creative_team_btn">팀 생성</button>
                </div>
            </c:if>
            <div class="profile_instrument">
                <div class="profile_instrument_list">
                    <div class="profile_instrument_image_box">
                        <img src="/assets/img/guitar2.png" alt="1">
                    </div>
                    <div class="profile_instrument_image_box">
                        <img src="/assets/img/drum.png" alt="2">
                    </div>
                    <div class="profile_instrument_image_box">
                        <img src="/assets/img/vocal.png" alt="3">
                    </div>
                    <div class="profile_instrument_image_box">
                        <img src="/assets/img/keyboard.png" alt="4">
                    </div>
                    <div class="profile_instrument_image_box">
                        <img src="/assets/img/saxophone.png" alt="5">
                    </div>
                    <div class="profile_instrument_image_box">
                        <img src="/assets/img/trumpet.png" alt="6">
                    </div>
                    <div class="profile_instrument_image_box">
                        <img src="/assets/img/flute.png" alt="7">
                    </div>
                    <div class="profile_instrument_image_box">
                        <img src="/assets/img/bass-guitar.png" alt="8">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal invisible" id="modal">
</div>


<script>
    const $box = document.querySelector('.upload-box');
    const $input = document.getElementById('img-input');
    const $instrumentImageBox = document.querySelector('.profile_instrument_list');
    if ("${login.nickname}" === "${user.nickname}") {
        $box.onclick = e => {
            $input.click();
            console.log("클릭함");
        };
        $instrumentImageBox.onclick = e => {
            if (e.target.parentElement.classList.contains("on")) {
                e.target.parentElement.classList.remove("on");
            } else {
                e.target.parentElement.classList.add("on");
                fetch("/user/instrument", {
                    method : "POST",
                    headers: {
                        "Content-Type": "application/json",

                    },
                    body: JSON.stringify({
                        email: "${user.email}",
                        instrumentId: e.target.alt,
                        onOff: true
                    })
                })
            }

        }
    }


    // // 프로필 업로드 관련 스크립트
    // const $profile = document.querySelector('.profile');
    // const $fileInput = document.getElementById('profile-img');
    //
    // $profile.onclick = e => {
    //     $fileInput.click();
    // }
    //
    // // 프로필 사진 선택시 썸네일 보여주기
    // $fileInput.onchange = e => {
    //     // 사용자가 선택한 파일 읽기
    //     const fileDate = $fileInput.files[0];
    //     console.log(fileDate);
    //
    //     // 첨부파일의 바이트데이터를 읽는 객체를 생성
    //     const reader = new FileReader();
    //
    //     // 파일의 바이트데이터를 읽어서 img태그의 src속성에 넣으려면
    //     // URL형태로 파일을 읽어아햐나는데 그거를 처리하는 함수
    //     reader.readAsDataURL(fileDate);
    //
    //     // 첨부파일이 등록되는 순간 img태그에 이미지를 세팅
    //     reader.onloadend = e => {
    //         const $img = document.querySelector('.thumbnail-box img');
    //         $img.setAttribute('src', reader.result);
    //     }
    // }


</script>

</body>
</html>