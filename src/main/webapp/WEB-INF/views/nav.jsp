
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/header.css">
</head>
<body>
<nav class="navbar">
    <div class="logo">Edu<span>Le</span></div>
    <ul class="nav-links">
        <li><a href="home.jee#home">Home</a></li>
        <li><a href="home.jee#about-us">About Us</a></li>
        <li><a href="home.jee#courses">All Course</a></li>
        <li><a href="home.jee#testimonials">Testimonials</a></li>
    </ul>
    <!-- Bouton Profil -->
    <div class="profile-menu">
        <button class="profile-btn">S</button>
        <div class="dropdown-menu">
            <a href="cheekMessage.jee?id=1"
            >Messages & Notifications</a>
            <a href="cheekAccount.jee?id=1">account</a>
            <a href="#">LogOut</a>
        </div>
    </div>
            <div class="auth-buttons">
                <a href="logIn.jee" id="loginBtn" class="signin">Log In</a>
                <a href="signUp.jee" class="signup" id="signupBtn">Sign Up</a>
            </div>
</nav>
<script src="${pageContext.request.contextPath}/assets/JS/nav.js"></script>

</body>
</html>
