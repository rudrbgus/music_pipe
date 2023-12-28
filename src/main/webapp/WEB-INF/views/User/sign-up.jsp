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
            margin-right: 115px;
            display: flex;
            align-content: center;
            justify-content: center;
        }

        body {
            background: #272125;
            font-family: 'Roboto', sans-serif;
        }

        form {
            position: relative;
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
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<form action="/user/sign-up" name="signUp" method="post" id="signUpForm">
    <h2>회원가입</h2>
    <input name="email" type="text" class="user" placeholder="user-email" />
    <input
            name="password"
            type="password"
            class="pass"
            placeholder="password"
    />
    <input
            name="nickname"
            type="text"
            class="nickname"
            placeholder="nickname"
    />
    <input name="age" type="int" class="age" placeholder="age" />
    <input name="sex" type="String" class="sex" placeholder="gender" />
    <button type="submit">sign-up</button>
</form>

<script>

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