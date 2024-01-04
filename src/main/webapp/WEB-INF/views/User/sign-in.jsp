<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>

    <style>
        @import url(http://weloveiconfonts.com/api/?family=entypo);
        @import url(https://fonts.googleapis.com/css?family=Roboto);
        /*@import url(https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css);*/

        a {
            color: inherit;
            text-decoration: none;
        }


        /* zocial */
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
            /*color: rgba(255, 255, 255, 0.8);*/
            margin-left: 12px;
            color: #2c2c2c;
        }

        body {
            background: #ffffff;
            /*background: #DAA394;*/
            /*background-image: url("/assets/img/overlay.png"), url("/assets/img/bg.jpg");*/
            /*background-repeat: repeat, no-repeat;*/
            /*background-size: auto, 100% 100%;*/
            /*background-attachment: fixed;*/
            font-family: 'Roboto', sans-serif;
        }

        #signInForm{
            position: relative;
            margin: 50px auto;
            width: 500px;
            height: 450px;
            padding: 50px;
            padding-top: 100px;
            border-radius: 20px;
            /*background: #6a4f6d;*/
            background: #ffffff;
            /*background: #e4e4e4;*/
            /*color: #001933;*/
            color: #2c2c2c;
            border: 1px solid #a0a0a0;
        }

        .loginContainer{
            padding-top: 200px;
        }

        input {
            padding: 16px;
            border-radius: 7px;
            /*border: 0px;*/
            /*background: rgba(255, 255, 255, 0.2);*/
            display: block;
            width: 300px;
            /*color: white;*/
            /*color: #001933;*/
            font-size: 18px;
            height: 54px;
            color: #2c2c2c;
            border: 1px solid #e4e4e4;
        }
        #signInForm input{
            margin: 15px;
        }

        input:focus {
            outline-color: rgba(0, 0, 0, 0);
            /*background: rgba(255, 255, 255, 0.95);*/
            background: #cecece;
            /*color: #e74c3c;*/
            color: #222222;
        }

        button {
            float: right;
            height: 121px;
            width: 50px;
            /*border: 0px;*/
            /*background: #e74c3c;*/
            border-radius: 7px;
            padding: 10px;
            color: white;
            font-size: 22px;
            /*color: #001933;*/
            background: #2c2c2c;
            /*border: 1px solid #e4e4e4;*/
        }


        .inputUserIcon ,
        .fa-user{
            position: absolute;
            top: 176px;
            right: 150px;
            color: #2c2c2c;
            /*color: white;*/
        }

        .inputPassIcon ,
        .fa-key{
            position: absolute;
            top: 246px;
            right: 150px;
            color: #2c2c2c;
            /*color: white;*/
        }

        input::-webkit-input-placeholder {
            /*color: white;*/
            color: #2c2c2c;
        }

        input:focus::-webkit-input-placeholder {
            /*color: #e74c3c;*/
            /*color: #222222;*/
            color: #eeeeee;
        }
        input[type="checkbox"]{
            display: none;
        }
        input[type="checkbox"] + label{
            display: inline-block;
            width: 30px;
            height: 30px;
            border:3px solid #707070;
            position: relative;
            text-align: center;
            /*color: #ffffff;*/
            color: #2c2c2c;
        }
        input[id="check1"]:checked + label::after{
            content:'✔';
            font-size: 25px;
            width: 30px;
            height: 30px;
            text-align: center;
            position: absolute;
            left:-2px;
            top: -7px;
        }
        .checkBoxDiv{
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }
        .checkboxText {
            margin-left: 10px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            /*color: #ffffff;*/
            color: #2c2c2c;
        }
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="loginContainer">

    <form action="/user/sign-in" name="signIn" method="post" id="signInForm">
        <h2><span class="entypo-login"><i class="fa fa-sign-in"></i></span> Login</h2>
        <button type="submit" class="submit">
    <%--        <span class="entypo-lock">--%>
                <i class="fa fa-lock"></i>
    <%--        </span>--%>
        </button>
    <%--    <span class="entypo-user inputUserIcon">--%>
               <i class="fa fa-user"></i>
    <%--         </span>--%>
        <input type="text" class="user" name="email" placeholder="user-email"/>
    <%--    <span class="entypo-key inputPassIcon">--%>
               <i class="fa fa-key"></i>
    <%--         </span>--%>
        <input type="password" class="pass" name="password" placeholder="password"/>
        <div class="checkBoxDiv">
            <input type="checkbox" id="check1" name="autoLogin">
            <label for="check1"></label>
            <div class="checkboxText"> 자동 로그인</div>
        </div>
    </form>
</div>

<script>

    const serverMessage = '${result}';
    console.log('msg: ' + serverMessage);

    if (serverMessage === 'NO_ACC') {
        alert('아이디가 존재하지 않습니다');
    } else if (serverMessage === 'NO_PW') {
        alert('비밀번호가 일치하지 않습니다.');
    }
    $(".user").focusin(function(){
        $(".inputUserIcon").css("color", "#e74c3c");
    }).focusout(function(){
        $(".inputUserIcon").css("color", "white");
    });

    $(".pass").focusin(function(){
        $(".inputPassIcon").css("color", "#e74c3c");
    }).focusout(function(){
        $(".inputPassIcon").css("color", "white");
    });

</script>

</body>