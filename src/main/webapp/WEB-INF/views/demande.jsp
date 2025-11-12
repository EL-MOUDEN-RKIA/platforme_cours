<%@ page import="metier.entities.Professeur" %>
<%@ page import="metier.entities.Etudiant" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Domaine" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Etudiant etu = (Etudiant) session.getAttribute("etudiant");
%>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/demande.css">
    <title>Programmez votre cours</title>
</head>
<body>

<div class="container">

    <!-- Carte du professeur -->
    <%
        Professeur prof = (Professeur) request.getAttribute("professeur");
        if (prof != null) {
    %>
    <div class="profile-card">
        <img src="https://i.ibb.co/4pDNDk1/avatar.png" alt="Mouna">
        <div class="price-tag"><%=prof.getTarif()%> MAD /h</div>
        <h2><%=prof.getPrenom()%></h2>
        <div class="stars">★★★★★ <span style="color:#888;font-size:14px;">(4 avis)</span></div>
        <div class="first-course">1er cours offert !</div>
        <div class="availability"><span>&#9889;</span>Disponible et répond dans les 24 heures</div>
    </div>

    <!-- Section message et contact -->
    <form action="envoyer.jee" method="post">
        <div class="content">
            <h1>Programmez</h1>
            <p>votre premier cours avec<%=prof.getPrenom()%></p>

            <h3>Votre message</h3>
            <textarea id="message" name="message">Bonjour Mouna,
Je m’appelle KHADIJA et je cherche un professeur d'Aide aux devoirs.
Je souhaiterais prendre les cours par webcam.
Idéalement, j’aimerais débuter les cours au plus tôt.
Est ce que cela vous irait ? Pouvez-vous prendre contact avec moi afin que l’on en parle ?</textarea>

            <div class="info-section" >
                <h3>Les coordonnées pour vous contacter</h3>
                <p>Elles ne sont communiquées qu'aux professeurs que vous sélectionnez</p>

                <div class="info-grid">
                    <div class="info-box">
                        <div class="info-label">Email</div>
                        <%= (etu != null && etu.getEmail() != null) ? etu.getEmail() : "Non renseignée" %>
                    </div>
                    <div class="info-box">
                        <div class="info-label">Numéro de téléphone</div>
                        <%= (etu != null && etu.getTelephone() != null) ? etu.getTelephone() : "Non renseigné" %>
                    </div>
                </div>
            </div>
            <!-- Champs cachés pour envoyer les infos -->
            <input type="hidden" name="email" value="<%= etu != null ? etu.getEmail() : "" %>">
            <input type="hidden" name="telephone" value="<%= etu != null ? etu.getTelephone() : "" %>">
            <input type="hidden" name="idEtudiant" value="<%= etu != null ? etu.getId() : "" %>">
            <input type="hidden" name="idProf" value="<%= prof.getId() %>">

            <div class="btn">
                <button id="nextBtn"  type="submit">Envoyer <span class="arrow"></span></button>
            </div>
        </div>
    </form>


</div>
<%
}
%>

<script src="assets/JS/demande.js"></script>


</body>
</html>

