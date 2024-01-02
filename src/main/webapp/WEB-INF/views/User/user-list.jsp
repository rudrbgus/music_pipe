<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="icon" type="image/png" href="…">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Anton" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        /*@import url(http://weloveiconfonts.com/api/?family=entypo);*/
        /*@import url(https://fonts.googleapis.com/css?family=Roboto);*/
        /* Cards */
        .main-cont {
            background-color: #DAA394;
            padding: 0;
            margin: 0;
            top: -215px;
        }

        .news-row {
            margin: 0;
            margin-top: 240px;
            margin-bottom: 50px;
        }

        .news-block {
            margin: auto;
            padding: 0;
            background-color: transparent;
            max-width: 1060px;
            min-width: 100px;
            border: 20px solid transparent;
            border-image: linear-gradient(
                    to bottom right,
                    rgba(255, 255, 255, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgb(245, 245, 245),
                    rgb(245, 245, 245),
                    rgb(254, 254, 254),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75)
            );
            border-image-slice: 1;
            transition: all 0.6s ease;
            animation: blockAppear 0.6s ease-in-out;
        }

        .underlay {
            margin: 0;
            padding: 0;
            max-height: 350px;
            max-width: 340px;
        }

        .card {
            margin: 0;
            width: 340px;
            max-height: 350px;
            max-width: 340px;
            background-color: transparent;
            border: 20px solid transparent;
            border-image: linear-gradient(
                    to bottom right,
                    rgba(255, 255, 255, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75)
            );
            border-image-slice: 1;
            transition: transform 0.6s ease;
            animation: blockAppear 0.6s ease-in-out;
        }

        @keyframes blockAppear {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            40% {
                opacity: 0;
                transform: translateY(20px);
                box-shadow: 0 10px 35px rgba(0, 0, 0, 0.15), 0 1px 0 rgba(0, 0, 0, 0.15);
            }
            80% {
                opacity: 1;
                transform: translateY(-5px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
                box-shadow: none;
            }
        }

        .card:hover {
            z-index: 999;
            max-height: 800px;
            width: 400px;
            max-width: 400px;
            border: none;
            border-right: 60px solid transparent;
            border-bottom: 20px solid transparent;
            margin-right: -20px;
            transform: translate(-30px, -50px);
        }

        .card:before {
            box-shadow: none;
            display: block;
            content: "";
            position: absolute;
            width: 100%;
            max-width: 400px;
            height: 100%;
            transition: box-shadow 0.6s ease;
        }

        .card:hover:before {
            max-width: 300px;
            box-shadow: 60px 60px 20px RGBA(142, 142, 142, 0.6);
        }

        .card:hover .card-img-top {
            height: 300px;
        }

        .card:hover .card-block {
            width: 300px;
            background-image: linear-gradient(
                    to top left,
                    rgb(72, 85, 108),
                    rgb(27, 33, 43) 50%,
                    rgb(20, 25, 34) 51%,
                    rgb(53, 59, 69) 100%
            );
        }

        .card:hover .card-title {
            color: white;
        }

        .card:hover .card-text {
            color: white;
        }

        .card-block {
            background-color: transparent;
            background-image: linear-gradient(
                    to bottom right,
                    rgba(255, 255, 255, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75),
                    rgb(245, 245, 245),
                    rgb(245, 245, 245),
                    rgb(254, 254, 254),
                    rgba(245, 245, 245, 0.75),
                    rgba(245, 245, 245, 0.75)
            );
            background-repeat: no-repeat;
        }

        .card-text {
            display: none;
        }

        .card-img-top {
            width: 300px;
            height: 250px;
            background-color: #fff;
            transition: height 0.8s ease;
        }

        @media (max-width: 1120px) {
            .bar-cont {
                width: 100%;
            }
            .news-block {
                max-width: 720px;
            }
            .card:hover {
                margin-right: -20px;
            }
            .card:hover .card-block {
                width: 300px;
            }
        }

        @media (max-width: 800px) {
            .news-block {
                min-width: 380px;
            }
            .card:hover {
                border-left: 20px solid transparent;
                margin-right: -40px;
                transform: translate(0, -50px);
            }
            .card:hover:before {
                box-shadow: 0px 60px 40px RGBA(142, 142, 142, 0.5);
            }
            .card:hover .card-block {
                width: 300px;
            }
        }

        @media (max-width: 580px) {
            .news-block {
                max-width: 380px;
            }
        }

    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<%--<c:forEach var="user" items="${userList}">--%>
<%--<div class="user-card">--%>
<%--    <div class="card-container" style="display:flex; justify-content:center;">--%>
<%--        <div class="card mb-3" style="width: 60%">--%>
<%--            <div class="row g-0">--%>
<%--                <div class="col-md-3">--%>
<%--                    <img src="..." class="img-fluid rounded-start" alt="...">--%>
<%--                    <p class="nickname">${user.nickname}</p>--%>
<%--                </div>--%>
<%--                <div class="col-md-9">--%>
<%--                    <div class="card-body">--%>
<%--                        <p class="card-text">자기소개: 저는${user.age}살이고요 성별은 ${user.sex}입니다 저는 ${user.teamId}의 팀입니다</p>--%>
<%--                        <div>악기</div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    </c:forEach>--%>
<!--======Pixel Grid======-->
<!--========Cards========-->
<div class="container-fluid main-cont">
    <div class="row news-row">
        <div class="container-fluid col-md-12 col-sm-6 justify-content-center news-block">
            <div class="card-group">
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/wLMJQPH.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">Canon Unveils New Lens<hr></h5>
                            <p class="card-text" >Canon will have a full slate of new and updated products to show attendees at this year’s NAB Show. The company has announced its new Compact-Servo 70-200mm telephoto zoom lens <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/tT6Bxay.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">Sennheiser HD 598 Tech Specs<hr></h5>
                            <p class="card-text" >The brown Sennheiser HD 598 audiophile headphones have excellent, detailed hi-fi sound and a stylish design. They are comfortable to wear and offer versatility as well. These accessories feature a multi-dimensional soundstage <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/n6b2rib.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">North Sea Wind Power Hub<hr></h5>
                            <p class="card-text" >The harnessing of energy has never been without projects of monolithic scale. From the Hoover Dam to the Three Gorges—the world's largest power station—engineers the world over have recognised that with size comes advantages <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/ssMsuUO.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">Apple MacBook Retina displays<hr></h5>
                            <p class="card-text" >In 2015 we reported on an issue with MacBook Retina displays that were seeing problems with the anti-reflective coating wearing off, which came to be known as ‘Staingate.’ <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/yAFDnZ1.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">Intel Dismisses 7700k Problems<hr></h5>
                            <p class="card-text" >Modern processors can run at temperatures ranging from 25 to 90 degrees, depending on configuration, cooling and workload. That said, when a CPU takes on a heavy load, that increase is gradual <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/5rgwfW6.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">T3 Agenda: Beats By Dre<hr></h5>
                            <p class="card-text" >In the latest edition of the T3 Agenda, we prepare to box our ears with Beats By Dre's Anthony Joshua headphones, detail the pre-order incentives and special editions of Call of Duty WW2 <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/WaGs6zS.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">Remembering &ldquo;Jobs&rdquo; 5th anniv<hr></h5>
                            <p class="card-text" >It has been 5 years since Steve Jobs passed away. Many publications write about how Apple Inc. has faired under Tim Cook's leadership post-Jobs <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/M8PGoML.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">Pair iPod Touch with an AirPlay<hr></h5>
                            <p class="card-text" >Officially, in order to use AirPlay to stream music from your iOS device, you would need either an Apple TV, AirPort Express, or an AirPlay-enabled receiver or set of speakers <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                <div class="underlay">
                    <div class="card">
                        <div class="card-img-top" style="background-image: url('https://i.imgur.com/Hp8NxLI.png')"></div>
                        <div class="card-block" >
                            <h5 class="card-title" style="font-family: 'Anton', sans-serif">A Time-Travel Experiment Works<hr></h5>
                            <p class="card-text" >In a makeshift lab, a trio of brainiac students argue over their time-travel device. The skeptic on the team has her doubts—not that the invention will work <a href="#"><u>Read More...</u></a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!------------------------>
<!--=======Scripts======-->
<script>
    var main = function () {
        $('.push-bar').on('click', function(event){
            if (!isClicked){
                event.preventDefault();
                $('.arrow').trigger('click');
                isClicked = true;
            }
        });

        $('.arrow').css({
            'animation': 'bounce 2s infinite'
        });
        $('.arrow').on("mouseenter", function(){
            $('.arrow').css({
                'animation': '',
                'transform': 'rotate(180deg)',
                'background-color': 'black'
            });
        });
        $('.arrow').on("mouseleave", function(){
            if (!isClicked){
                $('.arrow').css({
                    'transform': 'rotate(0deg)',
                    'background-color': 'black'
                });
            }
        });

        var isClicked = false;

        $('.arrow').on("click", function(){
            if (!isClicked){
                isClicked = true;
                $('.arrow').css({
                    'transform': 'rotate(180deg)',
                    'background-color': 'black',
                });

                $('.bar-cont').animate({
                    top: "-15px"
                }, 300);
                $('.main-cont').animate({
                    top: "0px"
                }, 300);
                // $('.news-block').css({'border': '0'});
                // $('.underlay').slideDown(1000);

            }
            else if (isClicked){
                isClicked = false;
                $('.arrow').css({
                    'transform': 'rotate(0deg)',       'background-color': 'black'
                });

                $('.bar-cont').animate({
                    top: "-215px"
                }, 300);
                $('.main-cont').animate({
                    top: "-215px"
                }, 300);
            }
            console.log('isClicked= '+isClicked);
        });

        $('.card').on('mouseenter', function() {
            $(this).find('.card-text').slideDown(300);
        });

        $('.card').on('mouseleave', function(event) {
            $(this).find('.card-text').css({
                'display': 'none'
            });
        });
    };

    $(document).ready(main);

</script>
<script name="toggle-grid" type="text/javascript">
    $(document).ready(function(){
        $(document).on("keypress", function(event) {
            // If 'alt + g' keys are pressed:
            if (event.which === 169){
                $('#toggle-grid').toggle();
            }
        });

        $('#toggle-grid').on("click", function() {
            $('.pixel-grid').toggle();
            $('#toggle-grid').toggleClass('orange');
        });
    });
</script>
</body>