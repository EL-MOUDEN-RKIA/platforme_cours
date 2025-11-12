<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Domaine" %>
<%@ page import="metier.entities.Professeur" %>
<%@ page import="metier.entities.Domaine" %>

<html>
<head>
    <title>Edu-Le</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        /* =========== Fonts ============ */
        @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600&display=swap");
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css');

        :root{
            --primary:rgb(47, 148, 85);
            --secondary:rgb(238, 251, 242);
            --text-1:rgb(33, 40, 50);
            --text-2: #a9a9a9;
            --text-3:#f0e2b3;
            --white: #fff;
            --shadow-300: 0 5px 5px rgba(0, 0, 0, 0.3);
            --shadow-500: 0 5px 5px rgba(0, 0, 0, 0.5);
            --transition-300: all 300ms ease-in-out;
            --transition-500: all 500ms ease-in-out;
        }

        *,*::after, *::before{
            margin: 0;
            padding: 0;
            box-sizing: inherit;

        }
        html{
            font-size: 62.5%;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }
        body{
            font-family: "Poppins", sans-serif; ;
            font-size: 1.6rem;
            font-weight: 400;
            background-color: var(--white);
            color: var(--text-1);

        }
        a{
            text-decoration: none;
        }
        li{
            list-style: none;
        }
        h1, h2, h3, h4{
            color: var(--primary);
        }
        p{
            color: var(--text-1);
        }

        section h2{
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        /* =========== hero ============ */
        /* header styling */
        /* header styling */
        header{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #f4fbf6;
            padding-top: 15px;
            min-height: 100vh ;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 4px 15px;
            margin-top: 8px;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            border: 1px solid #2e9b5c;
            width: 87%;
            height: 60px;
            position: fixed;
            top: 0;
            z-index: 200; /* pour qu’elle reste au-dessus du contenu */
            background-color: var(--secondary);

        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            color: #0a0a0a;
        }

        .logo span {
            color: #2e9b5c;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 30px;
        }

        .nav-links a {
            text-decoration: none;
            color: #2a2a2a;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #2e9b5c;
        }

        .auth-buttons {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .auth-buttons .signin {
            color: #2a2a2a;
            text-decoration: none;
            font-weight: 500;
        }

        .auth-buttons .signup {
            color: #2e9b5c;
            border: 2px solid #2e9b5c;
            padding: 6px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;

        }

        .auth-buttons .signup:hover {
            background-color: #2e9b5c;
            color: white;
        }

        /* ----- PROFIL BTN ----- */
        /* Bouton profil circulaire */
        .profile-menu {
            position: relative;
        }

        .profile-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: none;
            background-color: var(--primary);
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .profile-btn:hover {
            background-color: rgba(53, 213, 100, 0.45);
        }

        /* Menu déroulant */
        .dropdown-menu {
            position: absolute;
            right: 0;
            top: 55px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            display: none;
            flex-direction: column;
            width: 200px;
            overflow: hidden;
            z-index: 100;
        }

        .dropdown-menu a {
            padding: 12px 15px;
            text-decoration: none;
            color: #333;
            transition: background 0.3s ease;
            font-size: 15px;
        }

        .dropdown-menu a:hover {
            background-color: var(--secondary);
        }

        /* Affichage du menu au clic */
        .profile-menu.active .dropdown-menu {
            display: flex;
        }


        /* ----- HERO SECTION ----- */
        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #f3fdf6;
            padding: 0px 10%;
            border-radius: 12px;
            height: 60vh;
            width: 100%;
        }
        .hero-text {
            max-width: 70%;
            margin-left: 30px;
        }

        .hero-text h5 {
            color: #2db36c;
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .hero-text h1 {
            font-size: 36px;
            font-weight: 700;
            line-height: 1.4;
            color: #1a1a1a;
            margin-bottom: 15px;
        }

        .hero-text h1 span {
            color: #2db36c;
            position: relative;
        }

        .hero-text p {
            color: #666;
            line-height: 1.6;
            margin-bottom: 25px;
            max-width: 420px;
        }

        .hero-text .btn {
            display: inline-block;
            background-color: #2db36c;
            color: #fff;
            padding: 12px 28px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }

        .hero-text .btn:hover {
            background-color: #249b5d;
        }
        .hero-image{
            margin-left: 80px;
            width: 50%;
        }
        .hero-image img {
            width:450px;
            height: 720px;

        }
        /* =========== about-us ============ */
        #about-us{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 100px 10%;
            gap: 50px;
            min-height: 100vh;

        }
        .about-left {
            flex: 1;
        }

        .about-left h2 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .about-left p {

            line-height: 1.6;
            margin-bottom: 30px;
        }

        .about-buttons {
            display: flex;
            gap: 15px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .learn-more {
            background-color: var(--primary);
            color: #fff;
        }

        .learn-more:hover {
            background-color: var(--primary);
        }

        .watch-video {
            border: 1px solid var(--primary);
            color: var(--primary);
        }

        .watch-video:hover {
            background-color: var(--primary);
            color: #fff;
        }

        .about-right {
            flex: 1;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .box {
            background: var(--secondary);
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: center;
            padding: 30px 20px;
            border-radius: 1px;
            transition: transform 0.3s ease;
        }

        .box:hover {
            transform: translateY(-5px);
        }

        .box span {
            font-size: 18px;
            font-weight: 800;
            color: var(--text-1);
        }
        .box p{
            color: var(--text-2);
            font-weight: 100;
            font-size: 15px;
            margin-top: 10px;
        }

        /* =========== Courses ============ */
        /* section list cours et des prof */

        .list-course-teachers {
            margin: 30px;
        }

        .list-course-teachers .search{
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 100px;
        }

        .list-course-teachers .search .title-section span{
            color:#249b5d
        }

        .bar-search {
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .bar-search form {
            display: flex;
            align-items: center;
            background-color: #fff;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 5px 10px;
            width: 340px;
            height: 48px;
            position: relative;
            border: 0.1px solid #2db36c;
        }

        .bar-search input {
            flex: 1;
            border: none;
            outline: none;
            font-size: 15px;
            padding: 10px 15px;
            border-radius: 6px;
            color: #555;
        }

        .bar-search input::placeholder {
            color: #bbb;
            font-weight: 400;
        }

        .bar-search button {
            background-color: #e8f3e8; /* vert clair */
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: background-color 0.3s ease;
        }

        .bar-search button:hover {
            background-color: #d3ead3;
        }

        .bar-search button i {
            color: #507c50;
            font-size: 16px;
        }



        .list-courses{
            display: flex;
            justify-content: center;
        }
        .list-courses .category-container {
            display: flex;
            align-items: center;
            background: #e9f7ef;
            padding: 10px;
            margin-top: 20px;
            border-radius: 10px;
            width: 90%;
            max-width: 800px;
            overflow: hidden;
            position: relative;
            justify-content: center;
            height: 60px;
        }

        .category-scroll {
            display: flex;
            overflow-x: auto;
            scroll-behavior: smooth;
            gap: 15px;
        }

        .category-scroll::-webkit-scrollbar {
            display: none;
        }

        .category {
            background-color: #fff !important;
            color: #111111;
            border: 1px solid #d0e6d0;
            border-radius: 8px;
            padding: 8px 18px;
            cursor: pointer;
            transition: all 0.3s;
            flex-shrink: 0;
            font-weight: 500;
        }
        .category a{
            color: #111111;
        }

        .category.active {
            background-color: #e0f5e9 !important;
            border-color: #a3d9a5;
            color: #2b7a0b;
        }



        .arrow {
            background: none;
            border: none;
            font-size: 22px;
            cursor: pointer;
            color: #6b8e6f;
            padding: 5px 10px;
            transition: color 0.3s;
        }

        .arrow:hover {
            color: #3b6f3e;
        }

        .left {
            margin-right: 5px;
        }

        .right {
            margin-left: 5px;
        }





        .list-teachers{
            margin-top: 50px;
        }

        .list-teachers .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .list-teachers .course-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
        }

        .list-teachers .course-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            padding: 25px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .list-teachers .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .list-teachers .course-card {
            width: 320px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            font-family: "Poppins", sans-serif;
        }

        .list-teachers .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.1);
        }

        .list-teachers .course-image img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .list-teachers .course-content {
            padding: 15px 18px;
        }

        .list-teachers .teacher-info {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            position: relative;
        }

        .list-teachers .teacher-photo {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 8px;
        }

        .list-teachers .teacher-name {
            font-size: 14px;
            color: #444;
            margin-right: auto;
        }

        .list-teachers .category {
            background-color: #e8f3e8;
            color: #3c8d3c;
            font-size: 12px;
            padding: 4px 10px;
            border-radius: 8px;
            font-weight: 500;
        }

        .list-teachers .course-title {
            font-size: 15px;
            color: #333;
            font-weight: 600;
            margin-bottom: 10px;
            line-height: 1.4;
        }

        .list-teachers .course-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            color: #777;
            font-size: 13px;
        }

        .list-teachers .detail i {
            color: #3c8d3c;
            margin-right: 5px;
        }

        .list-teachers .course-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #f1f1f1;
            padding-top: 10px;
        }

        .list-teachers .price {
            display: flex;
            align-items: baseline;
            gap: 8px;
        }

        .list-teachers .current-price {
            color: #3c8d3c;
            font-weight: 600;
            font-size: 15px;
        }

        .list-teachers .original-price {
            color: #aaa;
            text-decoration: line-through;
            font-size: 13px;
        }

        .list-teachers .rating {
            display: flex;
            align-items: center;
            gap: 2px;
            font-size: 13px;
            color: #f5b400;
        }

        .list-teachers .rating-value {
            color: #444;
            font-weight: 500;
            margin-right: 4px;
        }

        /* =========== testimonials ============ */

        .testimonials .title{
            margin-top: 80px;
            text-align: center;
        }
        .team-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-wrap: wrap;
            gap: 50px;
            padding: 0 16px 30px;
            max-width: 1000px;
            margin: 0 auto;

        }
        .team-member {
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 270px;
            flex: 1 0 270px;
            cursor: pointer;
            transition: transform 0.3s ease;
            position: relative;
        }
        .team-member:hover {
            transform: translateY(-5px);
        }

        .team-member:focus {
            transform: translateY(-5px);
        }

        .profile-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 12px 76px 32px;
            width: 100%;
            width: 200px;
            position: relative;
            height: 200px;
            margin-bottom: 10px;
        }

        .background-svg {
            width: 270px;
            height: 70px;
        }
        .profile-image {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            object-fit: cover;
            position: relative;
            z-index: 2;
            border: 3px solid var(--primary);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .profile-wrapper::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 110px;
            height: 55px;
            background: var(--primary);
            border-radius: 0 0 110px 110px;
            z-index: 1;
            clip-path: inset(0 0 50% 0);
        }


        .member-info {
            background: #F7F7F7;
            padding: 7px 48px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 4.6px;
            height: 250px;
            position: relative;
        }

        .member-name {
            color: var(--text-1);
            font-family: 'Montserrat', sans-serif;
            font-size: 18px;
            font-weight: 700;
            line-height: 21.6px;
            text-align: center;
        }

        .member-title {
            color: var(--primary);
            font-family: 'Montserrat', sans-serif;
            font-size: 14px;
            font-weight: 400;
            line-height: 24px;
            letter-spacing: 0.35px;
            text-align: center;
        }

        @media (max-width: 991px) {
            .team-container {
                gap: 20px;
                padding: 0 16px 20px;
            }

            .team-member {
                max-width: 240px;
                flex: 1 0 240px;
            }

            .member-info {
                padding: 7px 40px 40px;

            }
        }

        /* Small devices (mobile) */
        @media (max-width: 640px) {
            .team-container {
                gap: 30px;
                padding: 0 16px 20px;
            }

            .team-member {
                max-width: 100%;
                flex: 1 0 100%;
            }

            .profile-wrapper {
                padding: 10px 40px 25px;
            }

            .profile-image {
                width: 100px;
                height: 100px;
            }

            .member-info {
                padding: 7px 20px 30px;
                height: 150px;
            }
        }

        .footer {
            background-color: var(--secondary);
            color: var(--text-1);
            padding: 60px 10% 30px;
            font-family: 'Poppins', sans-serif;
        }

        .footer-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 40px;
        }

        .footer-column h3 {
            color: var(--primary);
            font-size: 24px;
            margin-bottom: 15px;
        }

        .footer-column p {
            font-size: 14px;
            line-height: 1.6;
            color: var(--text-2);
        }

        .footer-column h4 {
            font-size: 18px;
            margin-bottom: 15px;
            color: var(--text-1);
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
        }

        .footer-column ul li {
            margin-bottom: 10px;
        }

        .footer-column ul li a {
            text-decoration: none;
            color: var(--text-2);
            transition: color 0.3s ease;
        }

        .footer-column ul li a:hover {
            color: var(--primary);
        }

        .social-icons {
            margin-top: 15px;
        }

        .social-icons a {
            display: inline-block;
            color: var(--text-2);
            font-size: 16px;
            margin-right: 12px;
            border: 1px solid var(--text-2);
            border-radius: 50%;
            padding: 8px;
            transition: all 0.3s ease;
        }

        .social-icons a:hover {
            background-color: var(--primary);
            border-color: var(--primary);
            transform: translateY(-3px);
        }

        .footer-bottom {
            text-align: center;
            margin-top: 40px;
            border-top: 1px solid var(--text-1);
            padding-top: 20px;
            font-size: 14px;
            color: var(--primary);
        }


    </style>

</head>
<body>

<header id="home">
    <%@ include file="WEB-INF/views/nav.jsp" %>

    <section class="hero">
        <div class="hero-text">
            <h5>Find the right teacher for your next course</h5>
            <h1>Discover expert-led courses designed to help you grow  <span>anytime, anywhere.</span></h1>
            <p>It has survived not only five centuries but also the leap into electronic typesetting.</p>
            <a href="home.jee#courses" class="btn">Explore Courses</a>
        </div>

        <div class="hero-image">
            <img src="assets\images\hero1.png" alt="Student learning with laptop">
        </div>
    </section>
</header>

<section id="about-us">
    <div class="about-left">
        <h2>About Us</h2>
        <p>
            Welcome to EduLe, your dedicated online tutoring space. We help students progress and succeed through personalized courses tailored to every level and need.

            Our mission is to make learning accessible, effective, and motivating. Every student can find qualified teachers, interactive learning resources, and personalized guidance to achieve their goals.

            We believe that every student deserves tailored support and learning at their own pace. Join us and discover a new way to learn and succeed.
        </p>
        <div class="about-buttons">
            <a href="/WEB-INF/views/message.jsp" class="btn learn-more">Learn More</a>
            <a href="#" class="btn watch-video">Watch Video ▶</a>
        </div>
    </div>
    <div class="about-right">
        <div class="box">
            <span>+50 Teachers</span>
            <p>
                Experienced educators providing personalized guidance to help students succeed.
            </p>
        </div>
        <div class="box">
            <span>+200 Students</span>
            <p>
                A growing community of learners achieving their goals with our platform.
            </p>
        </div>
        <div class="box">
            <span>+500 Meetings</span>
            <p>
                Interactive online sessions connecting students with teachers anytime, anywhere.
            </p>
        </div>
        <div class="box">
            <span>+350 Courses</span>
            <p>
                A wide variety of courses covering multiple subjects to enhance learning.
            </p>
        </div>
    </div>

</section>

<!-- Courses Section -->
    <section class="list-course-teachers" id="courses ">
        <div class="search">
            <div class="title-section">
                <h1>All Courses of Edu<span>Le</span></h1>
            </div>
            <div class="bar-search">
                <form action="#" method="get">
                    <input type="text" placeholder="Search...">
                    <button type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
            </div>
        </div>
        <div class="list-courses"  id="courses">
            <div class="category-container">
                <button class="arrow left" id="left">&#8249;</button>
                <div class="category-scroll" id="scroll">
                    <%
                        List<Domaine> listModel = (List<Domaine>) request.getAttribute("listModel");
                        if (listModel != null) {
                            for (Domaine d : listModel) { %>
                    <button class="category "
                         onclick="window.location.href='selectDomaine.jee?id=<%=d.getId()%>#courses'"
                         style="cursor: pointer;">
                        <%= d.getName() %>
                    </button>
                    <%      }
                    } else {%>
                    <p>Aucun domaine disponible.</p>
                    <% } %>
                </div>
                <button class="arrow right" id="right">&#8250;</button>
            </div>
        </div>
        <div class="list-teachers">
            <div class="container">
                <div class="course-grid">
                    <!-- Course  -->
                    <%
                        List<Professeur> listProf = (List<Professeur>) request.getAttribute("listProfesseur");
                        if (listProf != null && !listProf.isEmpty()) {
                            for (Professeur p : listProf) { %>
                    <div class="course-card"
                         onclick="window.location.href='selectProf.jee?id=<%=p.getId()%>'"
                         style="cursor: pointer;">
                        <div class="course-image">
                            <img src="assets/images/<%=p.getImage()%>" alt="Course Image">
                        </div>

                        <div class="course-content">
                            <div class="teacher-info">
                                <img src="assets/images/<%=p.getImage()%>" alt="Teacher" class="teacher-photo">
                                <p class="teacher-name"><%=p.getPrenom()%> <%=p.getNom()%></p>
                                <span class="category">WebCam</span>
                            </div>
                            <h3 class="course-title"><%=p.getDescription()%></h3>
                            <div class="course-details">
                                <div class="detail">
                                    <i class="fa-regular fa-clock"></i>
                                    <span>08 hr 15 mins</span>
                                </div>
                                <div class="detail">
                                    <i class="fa-regular fa-book"></i>
                                    <span>29 Students</span>
                                </div>
                            </div>
                            <div class="course-footer">
                                <div class="price">
                                    <span class="current-price"><%=p.getTarif()%></span>
                                </div>
                                <div class="rating">
                                    <span class="rating-value">4.9</span>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star-half-stroke"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%  }
                    } else {%>
                    <p>Aucun professeur disponible.</p>
                    <% } %>
                </div>
            </div>
        </div>
    </section>

<!-- testimonials Section -->
<section id="testimonials" class="section testimonials">
    <div class="title">
        <h2>What Our Students Say</h2>
    </div>

    <div class="team-container">

        <div class="team-member">
            <div class="profile-wrapper">
                <svg class="background-svg"><path></path></svg>
                <img src="assets\images\test1.avif" class="profile-image">
            </div>
            <div class="member-info">
                <div class="member-name">Sara El Amrani</div>
                <div class="member-title">Morocco 🇲🇦</div>
                <p>"Thanks to this platform, I finally understood mathematics! The teachers explain very clearly and are always available when I have questions."</p>
            </div>
        </div>
        <div class="team-member">
            <div class="profile-wrapper">
                <svg class="background-svg"><path></path></svg>
                <img src="assets\images\test3.webp" class="profile-image">
            </div>
            <div class="member-info">
                <div class="member-name">Carlos Ramirez</div>
                <div class="member-title">Spain 🇪🇸</div>
                <p>"An excellent learning platform! The teachers are very skilled and the sessions are well-structured. It’s a pleasure to learn online here."</p>
            </div>
        </div>

        <div class="team-member">
            <div class="profile-wrapper">
                <svg class="background-svg"><path></path></svg>
                <img src="assets\images\test2.jpg" class="profile-image">
            </div>
            <div class="member-info">
                <div class="member-name">Omar Benslimane</div>
                <div class="member-title">Morocco 🇲🇦</div>
                <p>"The platform helped me improve my programming skills. I really appreciated the personalized follow-up and practical exercises after each lesson."</p>
            </div>
        </div>

        <div class="team-member">
            <div class="profile-wrapper">
                <svg class="background-svg"><path></path></svg>
                <img src="assets\images\test3.jpg" class="profile-image">
            </div>
            <div class="member-info">
                <div class="member-name">Fatima Zahra Ait Taleb</div>
                <div class="member-title">Morocco 🇲🇦</div>
                <p>"The tutors are patient and motivating. I gained a lot of confidence in my English thanks to their interactive lessons and quizzes!"</p>
            </div>
        </div>

        <div class="team-member">
            <div class="profile-wrapper">
                <svg class="background-svg"><path></path></svg>
                <img src="assets\images\test4.jpg" class="profile-image">
            </div>
            <div class="member-info">
                <div class="member-name">Lucas Moreau</div>
                <div class="member-title">France 🇫🇷</div>
                <p>"A great experience! The platform is easy to use, and I can contact my teachers directly. My grades have really improved."</p>
            </div>
        </div>

        <div class="team-member">
            <div class="profile-wrapper">
                <svg class="background-svg"><path></path></svg>
                <img src="assets\images\test5.jpg" class="profile-image">
            </div>
            <div class="member-info">
                <div class="member-name">Emma Johnson</div>
                <div class="member-title">United Kingdom 🇬🇧</div>
                <p>"I took online French tutoring lessons here and was impressed by the professionalism and kindness of the teachers. Highly recommended for international learners!"</p>
            </div>
        </div>
    </div>
</section>
<section>

</section>

<footer class="footer">
    <div class="footer-container">

        <div class="footer-column">
            <h3>EduConnect</h3>
            <p>
                Your trusted platform for personalized tutoring and academic success.
                Learn at your own pace, anytime and anywhere.
            </p>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>

        <div class="footer-column">
            <h4>Explore</h4>
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Our Tutors</a></li>
                <li><a href="#">Courses</a></li>
                <li><a href="#">Testimonials</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h4>Support</h4>
            <ul>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Terms & Policies</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h4>Learn With Us</h4>
            <ul>
                <li><a href="#">Science & Math</a></li>
                <li><a href="#">Languages</a></li>
                <li><a href="#">Computer Science</a></li>
                <li><a href="#">Exam Preparation</a></li>
            </ul>
        </div>

    </div>

    <div class="footer-bottom">
        <p>© 2025 EduConnect — Learn with passion and purpose!</p>
    </div>
</footer>
<!-- Appel du fichier JS -->

<script src="${pageContext.request.contextPath}/assets/JS/script.js"></script>

<script>
    const scrollContainer = document.getElementById("scroll");
    const leftBtn = document.getElementById("left");
    const rightBtn = document.getElementById("right");

    leftBtn.addEventListener("click", () => {
        scrollContainer.scrollBy({ left: -200, behavior: "smooth" });
    });

    rightBtn.addEventListener("click", () => {
        scrollContainer.scrollBy({ left: 200, behavior: "smooth" });
    });

    // Optionnel : Changement d'état actif
    const buttons = document.querySelectorAll(".category");
    buttons.forEach(btn => {
        btn.addEventListener("click", () => {
            buttons.forEach(b => b.classList.remove("active"));
            btn.classList.add("active");
        });
    });

    const profileMenu = document.querySelector('.profile-menu');
    const profileBtn = document.querySelector('.profile-btn');

    profileBtn.addEventListener('click', (e) => {
        e.stopPropagation(); // empêche le clic de se propager au document
        profileMenu.classList.toggle('active');
    });

    // Ferme le menu si on clique ailleurs
    document.addEventListener('click', () => {
        profileMenu.classList.remove('active');
    });
</script>

</body>
</html>
