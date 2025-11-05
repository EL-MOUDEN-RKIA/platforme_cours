<%@ page import="metier.entities.Professeur" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Demande" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord - Salwa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/message.css">
</head>
<body>

<div class="header">
<%@ include file="nav.jsp" %>
</div>

<nav class="navbar2">
    <a href="cheekMessage.jee?id=1" class="active">My Messages</a>
    <a href="cheekAccount.jee?id=1">My Account</a>
</nav>

<main class="dashboard">
    <% Professeur prof = (Professeur) request.getAttribute("prof");%>
    <section class="profile">
        <div class="avatar">
            <div class="user-icon">👤</div>
            <button class="camera-btn">📸</button>
        </div>
        <h2><%=prof.getPrenom()%></h2>
        <p class="verified">✔ Contact Verified</p>
    </section>

    <section class="requests">
        <h3>My Course Requests</h3>
        <!-- Exemple d’un message -->
        <% List<Demande> listDemande = (List<Demande>) request.getAttribute("listDemande");
            if (listDemande != null){
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
            </div>
        </div>
        <%}
        } else{%>

        <div class="no-request">
            <img src="assets\images\aucun.png" alt="demande" class="icon">
            <p>No Requests</p>
        </div>
        <%}%>
    </section>
</main>
<script src="${pageContext.request.contextPath}/assets/JS/message.js"></script>

</body>
</html>

