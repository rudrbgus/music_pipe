<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@include file="../include/static-head.jsp"%>

    <style>
        @font-face {
            font-family: 'DNFBitBitv2';
            font-style: normal;
            font-weight: 400;
            src: url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')
            format('opentype');
        }
        a {
            color: inherit;
            text-decoration: none;
        }
        .header {
            border: 1px solid #000;
            width: 100%;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 3rem;
            /* position: absolute; */
        }

        /* 전체 body */
        .container {
            /* border: 1px solid #000; */
            /* margin-top: 120px; */
            /* background: #eeeeee; */
            height: 100vh;
            padding: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* 신규 프로필 */
        .container .new_porfile {
            border: 1px solid #d0d0d0;
            border-radius: 20px;
            width: 17%;
            height: 100%;
            display: flex;
            align-items: center;
            flex-direction: column;
        }
        .container .new_porfile span {
            font-size: 2rem;
            margin-top: 20px;
            margin-bottom: 40px;
        }

        /* 신규 프로필 카드 */
        .container .new_porfile .new_card {
            border: 1px solid #eee;
            border-radius: 30px;
            width: 80%;
            height: 70px;
            box-shadow: 2px 2px 5px #00ff22;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10%;
        }
        .new_porfile .new_card .profile_img {
            width: 60px;
            height: 60px;
            margin: 5px;
            margin-left: 15px;
            border-radius: 50%;
            box-shadow: 1px 1px 2px #444444;
        }
        .new_porfile .new_card .text {
            width: 65%;
            height: 60px;
        }
        .new_porfile .new_card .text .nickname {
            width: 70%;
            height: 20px;
            border-bottom: 1px solid #000;
        }
        .new_porfile .new_card .text .instrument {
            display: flex;
            align-items: center;
            padding-right: 10%;
            padding-top: 5px;
        }
        .new_porfile .new_card .text .instrument img {
            width: 30px;
            height: 30px;
            background: #fff;
            margin-right: 5%;
        }

        .container .select_container {
            width: 82%;
            height: 100%;
        }

        /* 검색 프로필*/
        .container .select_container .select_profile {
            /* background: orangered; */
            /* border: 1px solid #000; */
            width: 100%;
            height: 85%;
            display: flex;
            flex-wrap: wrap;
        }

        .container .select_profile .card_container {
            display: flex;
            margin-top: 5%;
            margin-left: 7%;
            height: 300px;
            position: relative;
        }

        /* 검색 프로필 카드 */
        .container .select_profile .card_container .card {
            border: 1px solid #eee;
            border-radius: 40px;
            width: 350px;
            height: 280px;
            box-shadow: 2px 2px 5px #888888;
            background: #fff;
            z-index: 1;
        }
        .container .select_profile .card_container .card:hover{
            z-index: -10;
        }

        .container .select_profile .card_container .card_modal{
            width: 100%;
            height: 94%;
            border-radius: 40px;
            position: absolute;
            background: rgb(0, 0, 0,0.5);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container .select_profile .card_container p{
            font-size: 2rem;
            color: #fff;
            opacity: 1;
            font-weight: 700;
        }

        .container .select_profile .card_container .card .profile_view_box {
            width: 100%;
            height: 70%;
            display: flex;
        }

        .container
        .select_profile
        .card_container
        .card
        .profile_view_box
        .profile_img
        img {
            width: 150px;
            height: 150px;
            margin-top: 40px;
            margin-left: 15px;
            border-radius: 50%;
            box-shadow: 1px 1px 2px #444444;
        }

        .container
        .select_profile
        .card_container
        .card
        .profile_view_box
        .profile_text_box {
            /* border: 1px solid #000; */
            width: 100%;
            display: flex;
        }
        .container
        .select_profile
        .card_container
        .card
        .profile_view_box
        .profile_text_box
        .nickname {
            margin: 70px auto;
            font-size: 2rem;
            font-family: 'DNFBitBitv2';
        }
        .container .select_profile .card_container .card .profile_instrument {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .container .select_profile .card_container .card .profile_instrument img {
            width: 40px;
            height: 40px;
            background: #fff;
            margin: 2%;
        }



        /* 페이지 이동버튼 영역 */
        .container .select_container .page_navigation{
            width: 100%;
            height: 14%;
        }

        .container .select_container .page_navigation .pagination{
            height: 100%;
            display: flex;
            list-style:none;
            justify-content: center;
            align-items: center;

        }

        .container .select_container .page_navigation .pagination .page-item{
            /* border: 1px solid #000; */
            width: 3rem;
            font-size: 1.5rem;
            margin: 0 5px;
            display: flex;
            justify-content: center;
            align-items: center;
        }



    </style>

</head>

<body>
<%@include file="../include/header.jsp"%>
<div class="container">
    <div class="new_porfile">
        <span>신규 프로필</span>
        <div class="new_card">
            <img src="/춘식이.png" alt="" class="profile_img" />
            <div class="text">
                <div class="nickname">춘식이</div>
                <div class="instrument">
                    <img src="/vocal.png" alt="" />
                    <img src="/guitar2.png" alt="" />
                    <img src="/drum.png" alt="" />
                    <img src="/bass-guitar.png" alt="" />
                </div>
            </div>
        </div>

        <div class="new_card">
            <img src="/루피.png" alt="" class="profile_img" />
            <div class="text">
                <div class="nickname">루피</div>
                <div class="instrument">
                    <img src="/vocal.png" alt="" />
                    <img src="/guitar2.png" alt="" />
                    <img src="/drum.png" alt="" />
                </div>
            </div>
        </div>
    </div>

    <div class="select_container">
        <div class="select_profile">
            <!-- 검색 프로필 -->

            <div class="card_container">
                <div class="card">
                    <div class="profile_view_box">
                        <div class="profile_img">
                            <img src="/루피.png" alt="" />
                        </div>
                        <div class="profile_text_box">
                            <div class="nickname">루피</div>
                        </div>
                    </div>
                    <div class="profile_instrument">
                        <img src="/vocal.png" alt="" />
                        <img src="/guitar2.png" alt="" />
                        <img src="/drum.png" alt="" />
                    </div>
                </div>
                <div class="card_modal">
                    <p>모집페이지 보러가기</p>
                </div>
            </div>
            <div class="card_container">
                <div class="card">
                    <div class="profile_view_box">
                        <div class="profile_img">
                            <img src="/루피.png" alt="" />
                        </div>
                        <div class="profile_text_box">
                            <div class="nickname">루피</div>
                        </div>
                    </div>
                    <div class="profile_instrument">
                        <img src="/vocal.png" alt="" />
                        <img src="/guitar2.png" alt="" />
                        <img src="/drum.png" alt="" />
                    </div>
                </div>
                <div class="card_modal">
                    <p>프로필 보러가기</p>
                </div>
            </div>
            <div class="card_container">
                <div class="card">
                    <div class="profile_view_box">
                        <div class="profile_img">
                            <img src="/루피.png" alt="" />
                        </div>
                        <div class="profile_text_box">
                            <div class="nickname">루피</div>
                        </div>
                    </div>
                    <div class="profile_instrument">
                        <img src="/vocal.png" alt="" />
                        <img src="/guitar2.png" alt="" />
                        <img src="/drum.png" alt="" />
                    </div>
                </div>
                <div class="card_modal">
                    <p>프로필 보러가기</p>
                </div>
            </div>
            <div class="card_container">
                <div class="card">
                    <div class="profile_view_box">
                        <div class="profile_img">
                            <img src="/루피.png" alt="" />
                        </div>
                        <div class="profile_text_box">
                            <div class="nickname">루피</div>
                        </div>
                    </div>
                    <div class="profile_instrument">
                        <img src="/vocal.png" alt="" />
                        <img src="/guitar2.png" alt="" />
                        <img src="/drum.png" alt="" />
                    </div>
                </div>
                <div class="card_modal">
                    <p>프로필 보러가기</p>
                </div>
            </div>
            <div class="card_container">
                <div class="card">
                    <div class="profile_view_box">
                        <div class="profile_img">
                            <img src="/루피.png" alt="" />
                        </div>
                        <div class="profile_text_box">
                            <div class="nickname">루피</div>
                        </div>
                    </div>
                    <div class="profile_instrument">
                        <img src="/vocal.png" alt="" />
                        <img src="/guitar2.png" alt="" />
                        <img src="/drum.png" alt="" />
                    </div>
                </div>
                <div class="card_modal">
                    <p>프로필 보러가기</p>
                </div>
            </div>


            <nav class="page_navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link"href="#"><<</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link"href="#"><</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">></a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">>></a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>

</html>