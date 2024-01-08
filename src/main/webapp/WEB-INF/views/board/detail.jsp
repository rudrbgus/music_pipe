<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.meatjellyburgur.musicpipe.util.InstrumentImageUtil" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>

    <%@include file="../include/static-head.jsp"%>


    <style>
        @font-face {
            font-family: 'ImcreSoojin';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.3/ImcreSoojin.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'KOTRAHOPE';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        a {
            color: inherit;
            text-decoration: none;
        }

        /* 메인가서 사라질 곳 */
        body {
            position: relative;
        }
        /* 바디 */
        .detail_container {
            width: 100%;
            height: 100vh;
            margin-top: 120px;
            /* border: 1px solid #000; */
        }


        /* 메인 컨테이너 */
        .detail_container .team_main_container {
            /* border: 1px solid #000; */
            width: 100%;
            height: 85%;
            display: flex;
            justify-content: space-around;
        }
        /* 팀 프로필 컨테이너 */
        .detail_container .team_main_container .team_profile_container{
            width: 20%;
            padding-top: 120px;
            /* border: 1px solid #000; */
        }
        .detail_container .team_main_container .team_profile_container .profile_img{
            width: 100%;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .detail_container .team_main_container .team_profile_container .profile_img img{
            width: 350px;
            height: 300px;
            border-radius: 50%;
            box-shadow: 5px 4px 10px #444444;
        }
        /* 팀 모집 컨테이너 */
        .detail_container .team_main_container .team_introduction_container{
            width: 41%;
            padding-top: 120px;
            /* border: 1px solid #000; */
        }
        .detail_container .team_main_container .team_introduction_container .team_top_box{
            width: 100%;
            height: 20%;
            display: flex;
        }
        .detail_container .team_main_container .team_introduction_container .team_name{
            width: 70%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family:  'ImcreSoojin';
            font-size: 3.5rem;
            font-weight: 700;
        }
        /* 온라인 오프라인 표시 */
        .detail_container .team_main_container .team_introduction_container .on_and_off_line{
            width: 25%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .detail_container .team_main_container .team_introduction_container .on_and_off_line .icon{
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
            box-shadow: 2px 2px 3px #727272;
        }
        .detail_container .team_main_container .team_introduction_container .on_and_off_line .on_line{
            background: #ff3030;
        }
        .detail_container .team_main_container .team_introduction_container .on_and_off_line .off_line{
            background: #3c3c3c;
        }


        .detail_container .team_main_container .team_introduction_container .on_and_off_line .text{
            font-size: 1.5rem;
        }
        .detail_container .team_main_container .team_main_box{
            width: 90%;
            height: 50%;
            /* border: 1px solid #000; */
            padding-left: 70px;
        }
        .detail_container .team_main_container .team_main_box span{
            width: 10%;
            font-size: 1.3rem;
        }
        .detail_container .team_main_container .team_main_box .text{
            width: 90%;
            min-height: 60%;
            margin-top: 30px;
            text-align: justify;
            padding: 10px;
            border: 1px solid #bbb;
            border-radius: 15px;
        }
        .detail_container .team_main_container .team_footer_box{
            width: 90%;
            height: 29%;
            /* border: 1px solid #000; */
            padding-left: 70px;
        }
        .detail_container .team_main_container .team_footer_box .instrument_container{
            width: 90%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .detail_container .team_main_container .team_footer_box .instrument_container .instrument{
            width: 80px;
            height: 80px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-size: contain;
            cursor: pointer;
        }
        .instrument-radio {
            display: none;
        }
        /* 라디오 버튼이 선택되었을 때 이미지 스타일 변경 */
        .instrument-radio:checked + label {
            background: rgb(255, 0, 0,0.6);
        }
        /* 맴버 컨테이너  */
        .detail_container .team_main_container .team_member{
            width: 31%;
            padding-top: 120px;
            /* border: 1px solid #000; */
        }
        .detail_container .team_main_container .team_member .member_box{
            /* border: 1px solid #000; */
            width: 100%;
            height: 80%;
            margin-top: 100px;
        }
        .detail_container .team_main_container .team_member .member_box span{
            font-size: 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 5%;
        }
        .detail_container .team_main_container .team_member .member_box .member_list{
            width: 95%;
            height: 87%;
            border: 10px solid #ff1da1;
            border-radius: 30px;
            list-style:none;
            overflow: scroll;
            overflow: auto;
        }
        .detail_container .team_main_container .team_member .member_box .member_list li .member_profile_box{
            margin-top: 30px;
            width: 95%;
            height: 100px;
            border: 1px solid #c7c7c7;
            border-radius: 20px;
            display: flex;
            align-items: center;
            list-style: none;
            justify-content: space-between;
        }
        .detail_container .team_main_container .team_member .member_box .member_list li .member_profile_box img{
            width: 80px;
            height: 75px;
            margin: 10px;
            border-radius: 50%;
            border: 1px solid #ccc;
        }
        .detail_container .team_main_container .team_member .member_box .member_list li .member_profile_box .member_text_box{
            width: 55%;
            font-size: 1.1rem;
            /* border: 1px solid #000; */
        }
        .detail_container .team_main_container .team_member .member_box .member_list li .member_profile_box .member_text_box .member_nickname{
            margin-bottom: 10px;
        }
        .detail_container .team_main_container .team_member .member_box .member_list li .member_profile_box .member_instrument{
            width: 80px;
            height: 75px;
            margin: 10px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }




        /* 풋터 컨테이너 */
        .detail_container .team_footer_container{
            height: 14%;
            /* border: 1px solid #000; */
            display: flex;
            justify-content: left;
            align-items: center;
        }
        .detail_container .team_footer_container button{
            width: 10%;
            height: 40%;
            font-size: 2rem;
            font-family: 'KOTRAHOPE';
            margin-left: 7%;
            margin-bottom: 18%;
            background: #fff;
            border-radius: 5px;
        }

    </style>
</head>
<body>
<div class="detail_container">


    <div class="team_main_container">
        <div class="team_profile_container">
<%--            <c:forEach var="b" items="${bList}">--%>

<%--                <div class="profile_img">--%>
<%--                    <img src="/${teamData.teamProfileimage}" alt="">--%>
<%--                </div>--%>
<%--            </c:forEach>--%>

        </div>

        <div class="team_introduction_container">

                <div class="team_top_box">
                    <div class="team_name">
                            ${teamInfoDTO.teamName}
                    </div>
                    <div class="on_and_off_line">
<%--                        <div class="icon ${b.onoff ? 'on_line' : 'off_line'}"></div>--%>
<%--                        <div class="text">${b.onoff}</div>--%>
                    </div>
                </div>
                <div class="team_main_box">
                    <span> 모집 사항 </span>
                    <div class="text">
                        자격요건: ${detail.content}
                        등등
                    </div>
                </div>

            <div class="team_footer_box">
                <div class="instrument_container">

                    <c:forEach var="e" items="${allNeedEquipment}">
                        <input type="radio" id="bassGuitar" name="instrument" class="instrument-radio" style="display: none">
                        <label for="bassGuitar" class="instrument" style="background-image: url('/assets/img/${InstrumentImageUtil.instrumentImage(e)}.png');"></label>
                    </c:forEach>

                </div>
            </div>

        </div>

        <div class="team_member">
            <div class="member_box">
                <span> 소속 맴버 </span>
                <ul class="member_list">

                    <c:forEach var="member" items="${teamMemberInfo}">
                        <li>
                            <div class="member_profile_box">
                                <img src="<c:out value="${member.profileImagePath}" />" alt="">
                                <div class="member_text_box">
                                    <div class="member_nickname">닉네임 : <c:out value="${member.nickName}" /></div>
                                    <div class="member_email">이메일 : <c:out value="${member.email}" /></div>
                                </div>
                                <img class="member_instrument" src="<c:out value="/assets/img/${InstrumentImageUtil.instrumentImage(member.equipmentId)}.png" />" alt="" class="instrument">
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>
    </div>


    <div class="team_footer_container">
        <button> 신청하기 </button>
    </div>


</div>
<script>

    $(document).ready(function() {
        $("button").click(function() {
            var selectedInstrument = $("input[name='instrument']:checked").val();

            $.ajax({
                type: "POST",
                url: "/board/delete",
                data: { instrument: selectedInstrument },
                success: function(response) {
                    console.log(response);
                },
                error: function(error) {
                    console.error(error);
                }
            });
        });
    });
</script>
</body>
</html>
