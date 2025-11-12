<%@ page import="metier.entities.Etudiant" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Meet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord - Salwa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/messages.css">

</head>
<body>
<% Etudiant etu1 = (Etudiant) request.getAttribute("etudiant");%>
<div class="header">
    <nav class="navbar">
        <div class="logo">Edu<span>Le</span></div>
        <ul class="nav-links">
            <li><a href="home.jee#home">Home</a></li>
            <li><a href="home.jee#about-us">About Us</a></li>
            <li><a href="home.jee#courses">All Courses</a></li>
            <li><a href="home.jee#testimonials">Testimonials</a></li>
        </ul>
        <div class="profile-menu">
            <button class="profile-btn">
                <%= etu1.getPrenom().substring(0, 1).toUpperCase() %>
            </button>
        </div>
    </nav>
</div>

<nav class="navbar2">
    <a href="cheekMessage.jee?id=<%=etu1.getId()%>" class="active">My Messages</a>
    <a href="cheekAccountEtu.jee?id=<%=etu1.getId()%>">My Account</a>
</nav>

<main class="dashboard">
    <section class="profile">
        <div class="avatar">
<%--            <img src="${pageContext.request.contextPath}/assets/images/<%=etu1.getImage()%>"--%>
                 alt="Profile Photo" class="profile-photo">
            <button class="camera-btn">📸</button>
        </div>

        <h2><%= etu1.getPrenom()%></h2>
        <p class="verified">✔ Contact Verified</p>
    </section>

    <section class="requests">
        <h3>My Course Requests</h3>
        <!-- Exemple d’un message -->
        <% List<Meet> listMeet = (List<Meet>) request.getAttribute("listMeet");
            if (listMeet != null && !listMeet.isEmpty()){
                for (Meet m: listMeet){
        %>
        <div class="message">
            <div class="message-header">
                <div class="sender-info">
                    <div class="avatar-circle"><%=m.getProfesseur().getPrenom().charAt(0)%></div>
                    <div>
                        <h4><%= m.getProfesseur().getPrenom()%> <%=m.getProfesseur().getNom()%></h4>
                        <span class="subject"><%=m.getProfesseur().getEmail()%></span>
                    </div>
                </div>
                <button class="see-more-btn" onclick="toggleDetails(this)">See more</button>
            </div>

            <div class="message-details">
                <p><strong>Email:</strong> <%=m.getProfesseur().getEmail()%></p>
                <p><strong>Phone:</strong> <%=m.getProfesseur().getTelephone()%></p>
                <p><strong>Title:</strong> <%=m.getTitre()%></p>
                <p><strong>Request:</strong> <%=m.getDescription()%></p>
            </div>
        </div>
        <%}
        } else{%>

        <div class="no-request">
            <img src="${pageContext.request.contextPath}/assets/images/aucun.png" alt="demande" class="icon">
            <p>No Requests</p>
        </div>
        <%}%>
    </section>
</main>
<script src="${pageContext.request.contextPath}/assets/JS/message.js"></script>
<script src="${pageContext.request.contextPath}/assets/JS/nav.js"></script>

</body>
</html>


