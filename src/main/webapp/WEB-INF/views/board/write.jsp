<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">

    <!-- reset -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <!-- ck editor -->
    <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
    <style>


        .form-container {
            width: 1200px;
            margin: 100px auto;
            padding: 100px;
            /*background: #DAA394;*/
            border: 1px solid #eeeeee;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            font-size: 18px;
        }
        .form-container h1 {
            font-size: 40px;
            font-weight: 700;
            letter-spacing: 10px;
            text-align: center;
            margin-bottom: 70px;
            /*color: #ffffff;*/
            color: #2c2c2c;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 20px;
        }
        input[type="text"],
        textarea {
            font-size: 18px;
            width: 80%;
            padding: 8px;
            box-sizing: border-box;
            /*border: 2px solid #ffffff;*/
            border: 1px solid #222222;
            border-radius: 8px;
            margin-bottom: 10px;
            /*background-color: rgba(255, 255, 255, 0.8);*/
        }
        textarea {
            resize: none;
            height: 200px;
        }
        .buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }
        button {
            font-size: 20px;
            padding: 10px 20px;
            border: none;
            margin-right: 10px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }
        button.list-btn {
            background: #e61e8c;
        }
        button:hover {
            background-color: #3d8b40;
        }
        button.list-btn:hover {
            background: #e61e8c93;
        }

        #wrap .instrument_container{
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        #wrap .checkbox-recruit{
            width: 80%;
            height: 40px;
            display: flex;
            justify-content: space-around;
        }
        #instrument{
            width: 10%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #wrap .checkbox-recruit .checkbox{
            width: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: row;
            border-radius: 20px;
            border: 1px solid #2c2c2c;
        }
        #wrap .checkbox-recruit .checkbox:checked{
            background: #777777;
        }
        #wrap .checkbox-recruit label{
            margin-top: 10px;
            font-size: 0.8rem;
        }

        #wrap .title_container{
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        #wrap .title_container label{
            width: 10%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #content{
            width: 95%;
            justify-content: right;
        }

    </style>
</head>
<body>
<div id="wrap" class="form-container">
    <h1>구인 글쓰기</h1>
    <form action="/board/write" method="post">
        <div class="title_container">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="instrument_container">
            <label for ="instrument" id="instrument" name="instrument">모집악기</label>
            <div class="checkbox-recruit">
                <div class="checkbox">
                    <label>보컬</label>
                    <input name="vocal" type="checkbox"  id="recruitCheckbox1">
                </div>
                <div class="checkbox">
                    <label>피아노</label>
                    <input name="piano" type="checkbox" id="recruitCheckbox2">
                </div>
                <div class="checkbox">
                    <label>키보드</label>
                    <input name="keyboard" type="checkbox"id="recruitCheckbox3">
                </div>
                <div class="checkbox">
                    <label>어쿠스틱</label>
                    <input name="acoustic" type="checkbox"id="recruitCheckbox4">
                </div>
                <div class="checkbox">
                    <label>일렉</label>
                    <input name="electric" type="checkbox"id="recruitCheckbox5">
                </div>
                <div class="checkbox">
                    <label>베이스</label>
                    <input name="base" type="checkbox" id="recruitCheckbox6">
                </div>
                <div class="checkbox">
                    <label>드럼</label>
                    <input name="drum" type="checkbox" id="recruitCheckbox7">
                </div>
                <div class="checkbox">
                    <label>기타 악기</label>
                    <input name="etc" type="checkbox" id="recruitCheckbox8">
                </div>
            </div>
        </div>
        <textarea id="content" name="content" maxlength="200" required></textarea>
        <div class="buttons">
            <button class="list-btn" type="button" onclick="window.location.href='/board/list'">목록</button>
            <button type="submit" id="submitBtn">글쓰기</button>
        </div>
    </form>
</div>
<script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('submitBtn').addEventListener('click', function () {
                var selectedCheckboxes = document.querySelectorAll('.checkbox-item:checked');
                var selectedValues = [];

                selectedCheckboxes.forEach(function (checkbox) {
                    selectedValues.push(checkbox.getAttribute('data-id'));
                });

                sendSelectedValuesToServer(selectedValues);
            });
            function sendSelectedValuesToServer(selectedValues) {
                $.ajax({
                    type: 'POST',
                    url: '/board/write',
                    data: { selectedValues: selectedValues },
                    success: function (response) {
                        console.log('Server response:', response);
                    },
                    error: function (error) {
                        console.error('Error sending data to the server:', error);
                    }
                });
            }
        });

        CKEDITOR.replace('content');
</script>
</body>
</html>


</body>
</html>