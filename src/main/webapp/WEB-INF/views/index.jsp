<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Web Study</title>
    <%@include file="include/static-head.jsp"%>
    <link rel="stylesheet" href="assets/css/main.css">
    <style>
        input,
        textarea{
            width: 100%;
        }
    </style>
</head>
<body>
<%@include file="include/header.jsp"%>


<!-- Wrapper-->
<div id="wrapper">

    <!-- Nav -->
    <nav id="nav">
        <a href="#" class="icon solid fa-home"><span>Home</span></a>
        <a href="#work" class="icon solid fa-folder"><span>Work</span></a>
        <a href="#contact" class="icon solid fa-envelope"><span>Contact</span></a>
        <a href="https://twitter.com/ajlkn" class="icon brands fa-twitter"><span>Twitter</span></a>
    </nav>

    <!-- Main -->
    <div id="main">

        <!-- Me -->
        <article id="home" class="panel intro">
            <div class="header">
                <h1>Jane Doe</h1>
                <p>Senior Astral Projectionist</p>
            </div>
            <a href="#work" class="jumplink pic">
                <span class="arrow icon solid fa-chevron-right"><span>See my work</span></span>
                <img src="assets/img/me.jpg" alt="" />
            </a>
        </article>

        <!-- Work -->
        <article id="work" class="panel">
            <div class="header">
                <h2>Work</h2>
            </div>
            <p>
                Phasellus enim sapien, blandit ullamcorper elementum eu, condimentum eu elit.
                Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
                luctus elit eget interdum.
            </p>
            <section>
                <div class="row">
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic01.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic02.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic03.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic04.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic05.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic06.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic07.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic08.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic09.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic10.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic11.jpg" alt=""></a>
                    </div>
                    <div class="col-4 col-6-medium col-12-small">
                        <a href="#" class="image fit"><img src="assets/img/pic12.jpg" alt=""></a>
                    </div>
                </div>
            </section>
        </article>

        <!-- Contact -->
        <article id="contact" class="panel">
            <div class="header">
                <h2>Contact Me</h2>
            </div>
            <form action="#" method="post">
                <div>
                    <div class="row">
                        <div class="col-6 col-12-medium">
                            <input type="text" name="name" placeholder="Name" />
                        </div>
                        <div class="col-6 col-12-medium">
                            <input type="text" name="email" placeholder="Email" />
                        </div>
                        <div class="col-12">
                            <input type="text" name="subject" placeholder="Subject" />
                        </div>
                        <div class="col-12">
                            <textarea name="message" placeholder="Message" rows="6"></textarea>
                        </div>
                        <div class="col-12">
                            <input type="submit" value="Send Message" />
                        </div>
                    </div>
                </div>
            </form>
        </article>

    </div>

    <!-- Footer -->
    <div id="footer">
        <ul class="copyright">
            <li>&copy; Untitled.</li><li>from: <a href="#">MeatJellyBuger</a></li>
        </ul>
    </div>

</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>


</body>
</html>