<%@ page import="metier.entities.Utilisateur" %>
<%@ page import="metier.entities.Professeur" %>
<%@ page import="metier.entities.Etudiant" %>

<%
    HttpSession session1 = request.getSession(false);
    Utilisateur user = null;
    Professeur prof = null;
    Etudiant etudiant = null;

    if (session1 != null) {
        user = (Utilisateur) session1.getAttribute("user");
        prof = (Professeur) session1.getAttribute("prof");
        etudiant = (Etudiant) session1.getAttribute("etudiant");
    }
%>

<nav class="navbar">
    <div class="logo">Edu<span>Le</span></div>
    <ul class="nav-links">
        <li><a href="home.jee#home">Home</a></li>
        <li><a href="home.jee#about-us">About Us</a></li>
        <li><a href="home.jee#courses">All Courses</a></li>
        <li><a href="home.jee#testimonials">Testimonials</a></li>
    </ul>

    <% if (prof != null) { %>
    <!-- PROF -->
    <div class="profile-menu">
        <button class="profile-btn">
            <%= prof.getPrenom().substring(0, 1).toUpperCase() %>
        </button>
        <div class="dropdown-menu">
            <a href="cheekMessage.jee?id=<%= prof.getId() %>">Messages & Notifications</a>
            <a href="cheekAccount.jee?id=<%= prof.getId() %>">Account</a>
            <a href="logout.jee">LogOut</a>
        </div>
    </div>
    <% } else if (etudiant != null) { %>
    <!-- ETUDIANT -->
    <div class="profile-menu">
        <button class="profile-btn">
            <%= etudiant.getPrenom().substring(0, 1).toUpperCase() %>
        </button>
        <div class="dropdown-menu">
            <a href="cheekNotifications.jee?id=<%= etudiant.getId() %>"> Notifications</a>
            <a href="cheekAccountEtu.jee?id=<%= etudiant.getId() %>">Account</a>
            <a href="logout.jee">LogOut</a>
        </div>
    </div>
    <% } else { %>
    <!-- UTILISATEUR NON CONNECTÉ -->
    <div class="auth-buttons">
        <a href="logIn.jee" id="loginBtn" class="signin">Log In</a>
        <a href="signUp.jee" class="signup" id="signupBtn">Sign Up</a>
    </div>
    <% } %>
</nav>
<script src="${pageContext.request.contextPath}/assets/JS/nav.js"></script>