<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.meatjellyburgur.musicpipe.util.InstrumentImageUtil" %>
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
            width: 100%;
            display: flex;
            margin-top: 5%;
            margin-left: 7%;
            height: 300px;
            flex-wrap: wrap;
        }

        /* 검색 프로필 카드 */
        .container .select_profile .card_container .card {
            border: 1px solid #eee;
            border-radius: 40px;
            width: 350px;
            height: 280px;
            box-shadow: 2px 2px 5px #888888;
            background: #fff;
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
        <span>신규 글</span>
        <c:forEach var="b" items="${bList}">
            <div class="new_card">
                <div style="background-image: url('${b.profileImagePath}');" class="profile_img"></div>
                <div class="text">
                    <div class="nickname">${b.nickName}</div>
                    <div class="instrument">
                        <c:forEach var="e" items="${b.recruit_equipment}">
                            <img src="/assets/img/${InstrumentImageUtil.instrumentImage(e)}.png">
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="select_container">
        <div class="select_profile">
            <!-- 검색 프로필 -->

            <div class="card_container">
                <c:forEach var="b" items="${bList}">
                    <div class="card"  data-bno="${b.boardId}">
                        <div class="profile_view_box">
                            <div style="background-image: url('${b.profileImagePath}');" class="profile_img">
                            </div>
                            <div class="profile_text_box">
                                <div class="nickname">${b.nickName}</div>
                                <div class="on_and_off_line">${b.onoff}</div>
                            </div>
                        </div>
                        <div class="profile_instrument">
                            <c:forEach var="e" items="${b.recruit_equipment}">
                                <img src="/assets/img/${InstrumentImageUtil.instrumentImage(e)}.png">
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>


            <nav class="page_navigation">
                <ul class="pagination">
                    <c:if test="${maker.page.pageNo != 1}">
                        <li class="page-item"><a class="page-link"
                                                 href="/board/list?pageNo=1&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                        </li>
                    </c:if>

                    <c:if test="${maker.prev}">
                        <li class="page-item"><a class="page-link"
                                                 href="/board/list?pageNo=${maker.begin - 1}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">prev</a>
                        </li>
                    </c:if>

                    <c:forEach var="i" begin="${maker.begin}" end="${maker.end}" step="1">
                        <li data-page-num="${i}" class="page-item">
                            <a class="page-link"
                               href="/board/list?pageNo=${i}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">${i}</a>
                        </li>
                    </c:forEach>


                    <c:if test="${maker.next}">
                        <li class="page-item"><a class="page-link"
                                                 href="/board/list?pageNo=${maker.end + 1}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">next</a>
                        </li>
                    </c:if>

                    <c:if test="${maker.page.pageNo != maker.finalPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="/board/list?pageNo=${maker.finalPage}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                        </li>
                    </c:if>

                </ul>
            </nav>

        </div>
    </div>
</div>
</body>
<script>






    document.addEventListener('DOMContentLoaded', function () {
        var instrumentContainer = document.querySelector('.new_porfile .new_card .text .instrument');

        instrumentContainer.addEventListener('wheel', function (event) {
            instrumentContainer.scrollLeft += event.deltaY;
            if (instrumentContainer.scrollLeft <= 0) {
                instrumentContainer.scrollLeft = 0;
            } else if (instrumentContainer.scrollLeft >= (instrumentContainer.scrollWidth - instrumentContainer.clientWidth)) {
                instrumentContainer.scrollLeft = instrumentContainer.scrollWidth - instrumentContainer.clientWidth;
            }

        });
    });




    const $cardContainer = document.querySelector('.card_container');

    //================= 삭제버튼 스크립트 =================//
    const modal = document.getElementById('modal'); // 모달창 얻기
    const confirmDelete = document.getElementById('confirmDelete'); // 모달 삭제 확인버튼
    const cancelDelete = document.getElementById('cancelDelete'); // 모달 삭제 취소 버튼

    $cardContainer.addEventListener('click', e => {
        // 삭제 버튼을 눌렀다면~
        if (e.target.matches('.card-btn-group *')) {
            console.log('삭제버튼 클릭');
            modal.style.display = 'flex'; // 모달 창 띄움

            const $delBtn = e.target.closest('.del-btn');
            const deleteLocation = $delBtn.dataset.href;

            // 확인 버튼 이벤트
            confirmDelete.onclick = e => {
                // 삭제 처리 로직
                window.location.href = deleteLocation;

                modal.style.display = 'none'; // 모달 창 닫기
            };


            // 취소 버튼 이벤트
            cancelDelete.onclick = e => {
                modal.style.display = 'none'; // 모달 창 닫기
            };
        } else { // 삭제 버튼 제외한 부분은 글 상세조회 요청

            // section태그에 붙은 글번호 읽기
            const bno = e.target.closest('div.card').dataset.bno;
            // 요청 보내기
            window.location.href = '/board/detail?bno=' + bno + '&pageNo=${s.pageNo}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}';
        }
    });

    // 전역 이벤트로 모달창 닫기
    window.addEventListener('click', e => {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });





    
    <%--$(document).ready(function() {--%>
    <%--    $(".card").click(function() {--%>
    <%--        Event.preventDefault();--%>
    <%--        const bno = e.target.closest('.card').dataset.bno;--%>
    <%--        // 요청 보내기--%>
    <%--        window.location.href = '/board/detail?bno=' + bno + '&pageNo=${s.pageNo}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}';--%>
    <%--    });--%>
    <%--});--%>
</script>

</html>