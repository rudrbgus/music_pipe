<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>

    <style>
        @import url(http://weloveiconfonts.com/api/?family=entypo);
        @import url(https://fonts.googleapis.com/css?family=Roboto);

        [class*='entypo-']:before {
            font-family: 'entypo', sans-serif;
        }

        *,
        *:before,
        *:after {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        h2 {
            color: rgba(255, 255, 255, 0.8);
            /* margin-left: 12px; */
            display: flex;
            align-content: center;
            justify-content: center;
        }

        body {
            background: #777777;
            font-family: 'Roboto', sans-serif;
            padding-top: 150px;
            overflow: hidden;
        }

        form {
            /*position: relative;*/
            flex-wrap: wrap;
            margin: 50px auto;
            width: 550px;
            height: auto;
            display: flex;
            align-content: center;
            justify-content: center;
            flex-direction: column;
        }

        input {
            padding: 16px;
            border-radius: 7px;
            border: 0px;
            background: rgba(255, 255, 255, 0.2);
            display: block;
            margin: 15px;
            width: 400px;
            color: white;
            font-size: 18px;
            height: 54px;
        }

        input:focus {
            outline-color: rgba(0, 0, 0, 0);
            background: rgba(255, 255, 255, 0.95);
            color: #e74c3c;
        }

        button {
            float: left;
            margin-top: 50px;
            margin-left: 140px;
            height: 50px;
            width: 150px;
            border: 0px;
            background: #e74c3c;
            border-radius: 7px;
            padding: 10px;
            color: white;
            font-size: 22px;
        }


        input::-webkit-input-placeholder {
            color: white;
        }

        input:focus::-webkit-input-placeholder {
            color: #e74c3c;
        }
        .box{
            display: flex;
        }
        .select {
            padding: 15px 10px;
        }
        .select input[type=radio]{
            display: none;
        }
        .select input[type=radio]+label{
            width: 200px;
            display: inline-block;
            cursor: pointer;
            height: 48px;
            line-height: 48px; /* 높이와 동일하게 설정하여 텍스트를 세로 가운데로 정렬 */
            border: 1px solid #333;
            text-align: center;
            font-weight: bold;
            font-size: 13px;
        }
        .select input[type=radio]+label{
            background-color: #000;
            color: #ffffff;
        }
        .select input[type=radio]:checked+label{
            background-color: #e74c3c;
            color: #fff;
        }



    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<form action="/user/sign-up" name="signUp" method="post" id="signUpForm">
    <h2>회원가입</h2>
    <input name="email" type="text" class="user" placeholder="user-email" id="user_email" />
    <span id="emailChk"></span>
    <input
            name="password"
            type="password"
            id="user_password"
            class="pass"
            placeholder="password"
    />
    <span id="passwordChk"></span>
    <input
            name="nickname"
            type="text"
            class="nickname"
            id="user_nickname"
            placeholder="nickname"
    />
    <span id="nicknameChk"></span>
    <input name="age" type="int" class="age" placeholder="age" id="user_age" />
    <span id="ageChk"></span>
    <div class="select">
        <input
                id="male"
                type="radio"
                name="gender"
                value='male'>
        <label for="male" class="radiobtn">남성</label>
        <input
                id="female"
                type="radio"
                name="gender"
                value='female'>
        <label for="female" class="radiobtn">여성</label>
    </div>
    <span id="sexChk"></span>


<%--    <input name="sex" type="String" class="sex" placeholder="gender" />--%>
    <button type="button" value="sign-up" id="signup-btn">sign-up</button>
</form>

<script>
    // 입력값 검증 통과 여부 배열
    const checkResultList = [false, false, false, false, false];
    // 이메일 검사 정규표현식
    const emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

    // 아이디 입력값 검증
    const $emailInput = document.getElementById('user_email');

    $emailInput.onkeyup = e => {

        const emailValue = $emailInput.value;
        // console.log(idValue);

        if (emailValue.trim() === '') {
            $emailInput.style.borderColor = 'red';
            document.getElementById('emailChk').innerHTML
                = '<b style="color: red;">[이메일 필수값입니다!]</b>';
            checkResultList[0] = false;
        } else if (!emailPattern.test(emailValue)) {
            $emailInput.style.borderColor = 'red';
            document.getElementById('emailChk').innerHTML
                = '<b style="color: red;">[이메일 형식을 지켜주세요~]</b>';
            checkResultList[0] = false;
        } else {
            fetch('/user/check?type=email&keyword='+emailValue)
                .then(res => res.json())
                .then(flag => {
                    console.log(flag);
                    if (flag) { // 중복
                        $emailInput.style.borderColor = 'red';
                        document.getElementById('emailChk').innerHTML
                            = '<b style="color: red;">[이메일이 중복되었습니다.]</b>';
                        checkResultList[0] = false;
                    } else {
                        $emailInput.style.borderColor = 'skyblue';
                        document.getElementById('emailChk').innerHTML
                            = '<b style="color: skyblue;">[사용가능한 이메일입니다.]</b>';
                        checkResultList[0] = true;
                    }
                });
        }
    };
    // 패스워드 검사 정규표현식
    const passwordPattern = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{6,16}$/;

    // 패스워드 입력값 검증
    const $pwInput = document.getElementById('user_password');

    $pwInput.onkeyup = e => {

        const pwValue = $pwInput.value;
        // console.log(idValue);

        if (pwValue.trim() === '') {
            $pwInput.style.borderColor = 'red';
            document.getElementById('passwordChk').innerHTML
                = '<b style="color: red;">[비밀번호는 필수값입니다!]</b>';
            checkResultList[1] = false;
        } else if (!passwordPattern.test(pwValue)) {
            $pwInput.style.borderColor = 'red';
            document.getElementById('passwordChk').innerHTML
                = '<b style="color: red;">[6자 이상 16자 이하, 영어와 숫자의 조합으로 구성, 특수문자를 허용합니다.]</b>';
            checkResultList[1] = false;
        } else {

            $pwInput.style.borderColor = 'skyblue';
            document.getElementById('passwordChk').innerHTML
                = '<b style="color: skyblue;">[사용가능한 비밀번호입니다.]</b>';
            checkResultList[1] = true;

        }
    };
    // 이름 검사 정규표현식
    const namePattern = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;

    // 이름 입력값 검증
    const $nameInput = document.getElementById('user_nickname');

    $nameInput.onkeyup = e => {

        const nameValue = $nameInput.value;

        if (nameValue.trim() === '') {
            $nameInput.style.borderColor = 'red';
            document.getElementById('nicknameChk').innerHTML
                = '<b style="color: red;">[이름은 필수정보!]</b>';
            checkResultList[2] = false;
        } else if (!namePattern.test(nameValue)) {
            $nameInput.style.borderColor = 'red';
            document.getElementById('nicknameChk').innerHTML
                = '<b style="color: red;">[이름은 한글 6글자 영어 12글자까지 허용입니다.]</b>';
            checkResultList[2] = false;
        } else {
            fetch('/user/check?type=nickname&keyword='+nameValue)
                .then(res => res.json())
                .then(flag => {
                    console.log(flag);
                    if (flag) { // 중복
                        $emailInput.style.borderColor = 'red';
                        document.getElementById('nicknameChk').innerHTML
                            = '<b style="color: red;">[이름이 중복되었습니다.]</b>';
                        checkResultList[2] = false;
                    } else {
                        $emailInput.style.borderColor = 'skyblue';
                        document.getElementById('nicknameChk').innerHTML
                            = '<b style="color: skyblue;">[사용가능한 이름입니다.]</b>';
                        checkResultList[2] = true;
                    }
                });
        }
    };
    const agePattern=/^[0-9]{1,2}$/;
    const $ageInput = document.getElementById("user_age");
    $ageInput.onkeyup=e=>{
        const ageVale = $ageInput.value;

        if(ageVale.trim()===''){
            document.getElementById('ageChk').innerHTML
                = '<b style="color: red;">[나이는 필수정보입니다.]</b>';
            checkResultList[3] = false;
        } else if (!agePattern.test(ageVale)) {
            $nameInput.style.borderColor = 'red';
            document.getElementById('ageChk').innerHTML
                = '<b style="color: red;">[나이는 1~2글자의 숫자만 입력이 가능합니다.]</b>';
            checkResultList[3] = false;
        } else {
            $nameInput.style.borderColor = 'skyblue';
            document.getElementById('ageChk').innerHTML
                = '<b style="color: skyblue;">[정상적으로 입력 되었습니다.]</b>';
            checkResultList[3] = true;
        }
    };
    const $male = document.getElementById("male");
    const $female = document.getElementById("female");
    $male.onclick=e=>{
        checkResultList[4] = true;
    }
    $female.onclick=e=>{
        checkResultList[4] = true;
    }

    // 회원가입 버튼 클릭 이벤트
    document.getElementById('signup-btn').onclick = e => {

        // 5개의 입력칸이 모두 통과되었을 경우 폼을 서브밋
        const $form = document.getElementById('signUpForm');

        if(!checkResultList.includes(false)) {
            $form.submit();
        } else {
            console.log(checkResultList)
            alert('입력란을 다시 확인하세요!');
        }
    };





    // $(".user").focusin(function(){
    //     $(".inputUserIcon").css("color", "#e74c3c");
    // }).focusout(function(){
    //     $(".inputUserIcon").css("color", "white");
    // });
    //
    // $(".pass").focusin(function(){
    //     $(".inputPassIcon").css("color", "#e74c3c");
    // }).focusout(function(){
    //     $(".inputPassIcon").css("color", "white");
    // });

</script>

</body>