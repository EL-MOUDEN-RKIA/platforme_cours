<%@ page import="metier.entities.Professeur" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Demande" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord - Salwa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/messages.css">
    <style>
        .accept-btn {
            padding: 6px 14px;
            background-color: #28a745;
            color: white;
            border-radius: 6px;
            font-size: 14px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            margin-top: 40px;
            transition: background 0.3s ease;
        }

        .accept-btn:hover {
            background-color: #218838;
        }

    </style>
</head>
<body>
<% Professeur prof1 = (Professeur) request.getAttribute("prof");%>

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
                <%= prof1.getPrenom().substring(0, 1).toUpperCase() %>
            </button>
        </div>
    </nav>
</div>

<nav class="navbar2">
    <a href="cheekMessage.jee?id=<%=prof1.getId()%>" class="active">My Messages</a>
    <a href="cheekAccount.jee?id=<%=prof1.getId()%>">My Account</a>
</nav>

<main class="dashboard">
    <section class="profile">
        <div class="avatar">
            <img src="${pageContext.request.contextPath}/assets/images/<%=prof1.getImage()%>"
                 alt="Profile Photo" class="profile-photo">
            <button class="camera-btn">📸</button>
        </div>

        <h2><%= prof1.getPrenom()%></h2>
        <p class="verified">✔ Contact Verified</p>
    </section>

    <section class="requests">
        <h3>My Course Requests</h3>
        <!-- Exemple d’un message -->
        <% List<Demande> listDemande = (List<Demande>) request.getAttribute("listDemande");
            if (listDemande != null && !listDemande.isEmpty()){
                for (Demande d: listDemande){
            %>
        <div class="message">
            <div class="message-header">
                <div class="sender-info">
                    <div class="avatar-circle"><%=d.getEtudiant().getPrenom().charAt(0)%></div>
                    <div>
                        <h4><%= d.getEtudiant().getPrenom()%> <%=d.getEtudiant().getNom()%></h4>
                        <span class="subject"><%=d.getEtudiant().getNiveau_etude()%></span>
                    </div>
                </div>
                <button class="see-more-btn" onclick="toggleDetails(this)">See more</button>

            </div>

            <div class="message-details">
                <p><strong>Email:</strong> <%=d.getEtudiant().getEmail()%></p>
                <p><strong>Phone:</strong> <%=d.getEtudiant().getTelephone()%></p>
                <p><strong>Message:</strong> <%=d.getMessage()%></p>
                <% if (!"acceptee".equals(d.getStatut())) { %>
                <a href="accepterDemande.jee?idDemande=<%=d.getId()%>&idProf=<%=prof1.getId()%>"
                   class="accept-btn">Confirm</a>
                <% } else { %>
                <button class="accept-btn" disabled style="background-color: gray; cursor: not-allowed;">
                    Accepted
                </button>
                <% } %>

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

