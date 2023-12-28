<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Web Study</title>
    <%@include file="include/static-head.jsp"%>
    <style>
        body{
            /*background-color: #3fe2ff;*/
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
        }
        .main_container {
            margin: 150px auto;
            width: 80%;
        }
        .main_container .new_together_icon{
            margin-bottom: 80px;
            display: flex;
            justify-content: space-around;
            align-content: center;

        }
        .main_container .new_together_icon .icon_box{
            width: 200px;
            height: 200px;
        }
        .main_container .new_together_icon .icon_box .icon_img{
            border-radius: 15%;
        }
        .main_container .new_together_icon .icon_box .icon_nikname{
            font-size: 3rem;
        }

        .main_container .img_container{
            width: 1300px;
            height: 800px;
            margin: 100px;
            position: relative;
            overflow: hidden;
        }
        .main_container .img_container img{
            width: 100%;
            height: auto;
            display: block;
        }

    </style>

</head>
<body>
<%@include file="include/header.jsp"%>

<div class="main_container">
    <c:forEach var="i" items="${iconList}">
        <div class="new_together_icon">
            <div class="icon_box">
                <div class="icon_img">
                    <img src="${i.profile_img}">
                </div>
                <div class="icon_nikname">${i.profile_nikname}</div>
            </div>
        </div>
    </c:forEach>
    <div class="img_container">
        <img src="/assets/img/bus.jpg" alt="이미지">
    </div>
</div>



</body>
</html>