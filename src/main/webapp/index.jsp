<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Domaine" %>
<%@ page import="metier.entities.Professeur" %>
<%@ page import="metier.entities.Domaine" %>

<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/header.css">


</head>
<body>

<header id="home">
    <%@ include file="WEB-INF/views/nav.jsp" %>

    <section class="hero">
        <div class="hero-text">
            <h5>Find the right teacher for your next course</h5>
            <h1>Discover expert-led courses designed to help you grow  <span>anytime, anywhere.</span></h1>
            <p>It has survived not only five centuries but also the leap into electronic typesetting.</p>
            <a href="#" class="btn">Explore Courses</a>
        </div>

        <div class="hero-image">
            <img src="images/logo.jpg" alt="Student learning with laptop">
        </div>
    </section>
</header>

<section id="about-us">
    <div class="about-left">
        <h2>About Us</h2>
        <p>
            Welcome to EduConnect, your dedicated online tutoring space. We help students progress and succeed through personalized courses tailored to every level and need.

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
                    <input type="text" placeholder="Rechercher...">
                    <button type="submit">
                        🔍
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
                    <button class="category active"
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
                                <span class="category">Science</span>
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
