<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Web Study</title>
    <%@include file="include/static-head.jsp"%>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
    />

    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

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

        .slide_item_duplicate {
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            left: 0px;
            width: 100%;
            height: 300px;
            flex-shrink: 0;
            transition: left 0.15s;
        }
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        swiper-container {
            width: 80%;
            height: 65%;
        }

        swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        swiper-container {
            margin-left: auto;
            margin-right: auto;
        }

    </style>

</head>
<body>
<%@include file="include/header.jsp"%>
<div class="story_div">

</div>
<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" navigation="true" space-between="30"
                  loop="true">
    <swiper-slide><img src="/assets/img/ban.jpg"></swiper-slide>
    <swiper-slide><img src="/assets/img/bus.jpg"></swiper-slide>
    <swiper-slide><img src="/assets/img/oke.jpg"></swiper-slide>
    <swiper-slide><img src="/assets/img/sing.jpg"></swiper-slide>
</swiper-container>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

</body>
</html>