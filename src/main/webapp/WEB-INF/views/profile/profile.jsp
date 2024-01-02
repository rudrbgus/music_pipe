<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Web Study</title>
<%@include file="../include/static-head.jsp"%>
    <style>
        /* 리셋 css포함시키기 */
        @import url(https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css);

        * {
            box-sizing: border-box;
        }
        .clearfix::after {
            content: '';
            display: block;
            clear: both;
        }
        a {
            color: inherit;
            text-decoration: none;
        }


        body{
            /*background:  url("/assets/img/bus.jpg");*/
        }

        span{
            font-size: 1.2rem;
            font-weight: 700;
        }
        .profile_main_container{
            width: 1000px;
            height: 700px;
            border: 3px solid #000;
            margin: 0 auto;
            margin-top: 180px;
            background: #fff;
        }
        .profile_main_container .profile_container{
            /* background: #eee; */
            width: 90%;
            height: 400px;
            margin: 0 auto;
            display: flex;
        }
        .profile_main_container .profile_container .profile_img_box{
            /* background: skyblue; */
            width: 250px;
            height: 400px;
            display: flex;
            align-content: center;
            justify-content: center;
            flex-direction: column;
        }
        .profile_main_container .profile_container .profile_img_box .profile_img{
            width: 200px;
            height: 200px;
            border: 1px solid #000;
            border-radius: 50%;
            margin-left: 25px;
        }
        .profile_main_container .profile_container .profile_img_box .profile_img_change{
            width: 135px;
            margin-top: 40px;
            margin-left: 58px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 20px;
        }
        .profile_main_container .profile_container .profile_img_box .profile_img_change:hover{
            background: #cccccc;
        }

        .profile_main_container .profile_container .profile_text{
            /* background: orange; */
            width: 600px;
            height: 400px;
            margin: 0 auto;
            padding-left: 75px;
            padding-top: 45px;
            font-size: 1.3rem;
        }
        .profile_main_container .profile_container .profile_text .profile_nickname,
        .profile_main_container .profile_container .profile_text .profile_team,
        .profile_main_container .profile_container .profile_text .profile_email{
            /* border: 1px solid #000; */
            width: 400px;
            height: 2rem;
            margin-bottom: 10px;
        }
        .profile_main_container .profile_container .profile_text .profile_instrument{
            width: 400px;
            height: 4rem;
            margin-bottom: 15px;
        }
        .profile_main_container .profile_container .profile_text .profile_instrument .profile_instrument_checkBox_container{
            /* border: 1px solid #000; */
            width: 380px;
            height: 3rem;
        }
        .profile_main_container .profile_container .profile_text .profile_instrument .profile_instrument_checkBox_container .checkbox-wrapper {
            margin-top: 5px;
            box-sizing: border-box;
            font-size: 1rem;
            display: flex;
        }

        .profile_main_container .profile_container .profile_text .profile_instrument .profile_instrument_checkBox_container .checkbox-wrapper input {
            margin-right: 0.5rem;
        }
        .profile_main_container .profile_container .profile_text .profile_instrument_skill{
            width: 400px;
            height: 8rem;
            margin-bottom: 15px;
        }
        .profile_main_container .profile_container .profile_text .profile_instrument_skill .profile_instrument_skill_container{
            border: 1px solid #ccc;
            width: 380px;
            height: 7rem;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .profile_main_container .profile_container .profile_text .profile_instrument_skill .profile_instrument_skill_container .skill-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            border-radius: 5px;
            font-size: 1rem;
        }

        .profile_main_container .profile_container .profile_text .profile_instrument_skill .profile_instrument_skill_container .skill-item label {
            margin-bottom: 3px;
        }

        .profile_main_container .profile_container .profile_text .profile_instrument_skill .profile_instrument_skill_container .skill-item input[type="radio"] {
            margin-right: 3px;
        }




        .profile_main_container .board_container{
            /* background: #e4e4e4; */
            width: 900px;
            height: 250px;
            margin: 0 auto;
            margin-top: 20px;
            padding-left: 25px;
            display: flex;
            align-content: center;
            justify-content: space-between;
            flex-direction: column;
        }
        .profile_main_container .board_container .my_writing_list,
        .profile_main_container .board_container .apply_writing_list{
            border: 1px solid #000;
            border-radius: 15px;
            width: 850px;
            height: 120px;
            padding-left: 30px;
            padding-top: 5px;
        }
        .profile_main_container .board_container .apply_writing_list .apply_writing_item,
        .profile_main_container .board_container .my_writing_list .my_writing_item{
            padding-left: 10px;
            margin-top: 5px;
        }



    </style>

</head>
<body>
<%@include file="../include/header.jsp"%>
<div class="profile_main_container">
    <div class="profile_container">
        <div class="profile_img_box">
            <div class="profile_img"></div>
            <button class="profile_img_change">프로필 이미지 변경</button>
        </div>
        <div class="profile_text">
            <div class="profile_nickname">닉네임 : </div>
            <div class="profile_email">이메일 : </div>
            <div class="profile_team">소속 팀 : </div>
            <div class="profile_instrument">악기
                <div class="profile_instrument_checkBox_container">
                    <div class="checkbox-wrapper">
                        <input type="checkbox" id="checkbox1">
                        <label for="checkbox1">보컬</label>

                        <input type="checkbox" id="checkbox2">
                        <label for="checkbox2">피아노</label>

                        <input type="checkbox" id="checkbox3">
                        <label for="checkbox3">키보드</label>

                        <input type="checkbox" id="checkbox4">
                        <label for="checkbox4">어쿠스틱</label>

                        <input type="checkbox" id="checkbox5">
                        <label for="checkbox5">일렉</label>
                    </div>

                    <div class="checkbox-wrapper">
                        <input type="checkbox" id="checkbox6">
                        <label for="checkbox6">베이스</label>

                        <input type="checkbox" id="checkbox7">
                        <label for="checkbox7">드럼</label>

                        <input type="checkbox" id="checkbox8">
                        <label for="checkbox8">클래식 악기</label>

                        <input type="checkbox" id="checkbox9">
                        <label for="checkbox9">기타 악기</label>
                    </div>
                </div>
            </div>
            <div class="profile_instrument_skill">악기 숙련도
                <div class="profile_instrument_skill_container"></div>
            </div>
        </div>
    </div>
    <div class="board_container">
        <ul class="my_writing_list">
            <span>내가 작성한 글 목록</span>
            <li class="my_writing_item">제목 : 작성날짜 : </li>
        </ul>
        <ul class="apply_writing_list">
            <span>내가 신청한 글 목록</span>
            <li class="apply_writing_item">제목 : 작성날짜 : </li>
        </ul>
    </div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Get the checkbox container and listen for checkbox changes
        var checkboxContainer = document.querySelector('.profile_instrument_checkBox_container');
        checkboxContainer.addEventListener('change', handleCheckboxChange);

        // Function to handle checkbox changes
        function handleCheckboxChange(event) {
            var selectedCheckboxes = checkboxContainer.querySelectorAll('input[type="checkbox"]:checked');

            // Clear previous content in the skill container
            var skillContainer = document.querySelector('.profile_instrument_skill_container');
            skillContainer.innerHTML = '';

            // Loop through selected checkboxes and create corresponding skill checkboxes
            selectedCheckboxes.forEach(function (checkbox) {
                var skillName = checkbox.labels[0].textContent;

                // Create a div for each skill
                var skillDiv = document.createElement('div');
                skillDiv.classList.add('skill-item');

                // Create a label for the skill name
                var skillNameLabel = document.createElement('label');
                skillNameLabel.textContent = skillName;
                skillDiv.appendChild(skillNameLabel);

                // Create a div to hold level checkboxes
                var levelContainer = document.createElement('div');
                levelContainer.classList.add('level-container');

                // Create radio buttons for skill level (high, medium, low)
                var levels = ['상', '중', '하'];
                levels.forEach(function (level) {
                    var levelCheckbox = document.createElement('input');
                    levelCheckbox.type = 'radio';
                    levelCheckbox.name = skillName + '-level';
                    levelCheckbox.value = level;

                    var levelLabel = document.createElement('label');
                    levelLabel.textContent = level;

                    levelContainer.appendChild(levelCheckbox);
                    levelContainer.appendChild(levelLabel);
                });

                skillDiv.appendChild(levelContainer);

                // Append the skill div to the skill container
                skillContainer.appendChild(skillDiv);
            });
        }
    });
</script>

</body>
</html>