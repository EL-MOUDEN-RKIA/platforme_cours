
<%@ page import="metier.entities.Professeur" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Domaine" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil enseignant</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/professeurs.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <!-- Section gauche sticky -->
    <%
        Professeur prof = (Professeur) request.getAttribute("professeur");
        if (prof != null) {
    %>
    <aside class="sidebar">
        <div class="profile-card">
            <img src="assets/images/<%=prof.getImage()%>" alt="Photo de profil" class="profile-img">
            <h2><%=prof.getPrenom()%> <%= prof.getNom()%></h2>
            <p class="desc"><%= prof.getDescription()%></p>
            <div class="infos">
                <div class="info">
                    <span>Tarif :</span>
                    <strong><%= prof.getTarif()%> MAD / h</strong>

                </div>
                <div class="info">
                    <span>Elève :</span>
                    <strong>3</strong>

                </div>
                <div class="info">
                    <span>Réponse :</span>
                    <strong>1h</strong>

                </div>
            </div>
            <button onclick="window.location.href='contactProf.jee?id=<%=prof.getId()%>'" class="btn-connect" id="openModal">Contacter</button>

        </div>
    </aside>

    <!-- Section droite scrollable -->
    <main class="main-content">
        <section class="about">
            <h3>À propos</h3>
            <p><%=prof.getAboutMe()%>
            </p>
        </section>

        <section class="contact">
            <h3>Contact</h3>
            <ul>
                <li><strong>Téléphone :</strong> +212 <%=prof.getTelephone()%></li>
                <li><strong>Email :</strong> <%=prof.getEmail()%></li>
                <li><strong>Adresse :</strong> <%=prof.getAdresse()%></li>
            </ul>
        </section>
        <section class="Domaines">
            <h3>Domaines d’enseignement</h3>
            <ul class="tags">
                <% List<Domaine> Domaines = (List<Domaine>) prof.getDomaines();
                for (Domaine d: Domaines){%>
                <li><%=d.getName()%></li>
                <%}%>
            </ul>
        </section>

        <section class="experience">
            <h3>Expérience</h3>
            <p>
                <%=prof.getExperience()%>
            </p>
        </section>

        <section class="cours">
            <h3>Cours proposés</h3>
            <ul>
                <li>Approche basée sur la compréhension plutôt que la mémorisation</li>
                <li>Exercices progressifs adaptés au niveau</li>
                <li>Supports personnalisés et fiches de révision</li>
                <li>Simulation d’examens et corrections détaillées</li>
            </ul>
        </section>
    </main>
</div>

<%
} else {
%>
<p>Professeur introuvable.</p>
<%
    }
%>


<!-- Appel du fichier JS -->
<script src="assets/JS/script.js"></script>
</body>
</html>

