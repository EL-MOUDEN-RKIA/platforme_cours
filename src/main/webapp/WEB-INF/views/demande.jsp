<%@ page import="metier.entities.Professeur" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Domaine" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Programmez votre cours</title>
    <style>
        body {
            font-family: "Poppins", Arial, sans-serif;
            background-color: #fff;
            color: #222;
            margin: 0;
            padding: 40px;
        }

        .container {
            display: flex;
            gap: 50px;
            flex-wrap: wrap;
            justify-content: center;
            align-items: flex-start;
        }

        /* ====== Carte Prof ====== */
        .profile-card {
            width: 300px;
            background: #fff;
            border-radius: 25px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            text-align: center;
            padding: 20px;
        }

        .profile-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 20px;
        }

        .price-tag {
            position: relative;
            top: -40px;
            display: inline-block;
            background: #2e9b5c;
            color: white;
            font-weight: bold;
            font-size: 22px;
            padding: 10px 20px;
            border-radius: 40px;
        }

        .profile-card h2 {
            margin-top: -10px;
            font-size: 22px;
        }

        .stars {
            color: #f8b400;
            font-size: 18px;
        }

        .first-course {
            color:#2e9b5c;
            font-size: 14px;
            font-weight: 500;
            margin-top: 5px;
        }

        .availability {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 10px;
            font-size: 14px;
            color: #555;
        }

        .availability span {
            color: #ffb400;
            margin-right: 5px;
            font-size: 18px;
        }

        /* ====== Section Droite ====== */
        .content {
            flex: 1;
            max-width: 700px;
        }

        h1 {
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 0;
        }

        h3 {
            color: #333;
            font-weight: 700;
            margin-top: 40px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            color: #555;
        }

        /* Zone de texte modifiable */
        textarea {
            width: 100%;
            height: 150px;
            border: 1px solid #ddd;
            background: #f8f8f8;
            border-radius: 10px;
            padding: 15px;
            resize: none;
            font-family: inherit;
            font-size: 15px;
            line-height: 1.5;
            color: #222;
            overflow-y: auto;
            outline: none;
            box-sizing: border-box;
        }

        textarea:focus {
            border-color: #32724c;
            box-shadow: 0 0 4px rgba(255,90,95,0.4);
        }

        .info-section {
            margin-top: 30px;
        }

        .info-grid {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .info-box {
            flex: 1;
            background: #f6f6f6;
            border-radius: 10px;
            padding: 15px;
            font-size: 16px;
        }

        .info-label {
            font-weight: 600;
            color: #222;
            margin-bottom: 5px;
        }

        /* ====== Bouton ====== */
        .btn {
            margin-top: 40px;
            display: flex;
            justify-content: center;
        }

        button {
            background: linear-gradient(90deg, #2e9b5c);
            border: none;
            border-radius: 50px;
            padding: 15px 50px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
            box-shadow: 0 8px 20px rgba(255,75,75,0.3);
        }

        button:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(255,75,75,0.4);
        }

        .arrow {
            margin-left: 10px;
            font-weight: bold;
            font-size: 20px;
        }

        @media(max-width: 850px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .content {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container">

    <!-- Carte du professeur -->
    <%
        Professeur prof = (Professeur) request.getAttribute("professeur");
        if (prof != null) {
    %>
    <div class="profile-card">
        <img src="https://i.ibb.co/TrJpSR5/profile.jpg" alt="Mouna">
        <div class="price-tag"><%=prof.getTarif()%> MAD /h</div>
        <h2><%=prof.getPrenom()%></h2>
        <div class="stars">★★★★★ <span style="color:#888;font-size:14px;">(4 avis)</span></div>
        <div class="first-course">1er cours offert !</div>
        <div class="availability"><span>&#9889;</span>Disponible et répond dans les 24 heures</div>
    </div>

    <!-- Section message et contact -->
    <form action="envoyer.jee">
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
                        <div class="info-label">Adresse</div>
                        Casablanca, Maroc
                    </div>
                    <div class="info-box">
                        <div class="info-label">Numéro de téléphone</div>
                        0678-654323
                    </div>
                </div>
            </div>

            <div class="btn">
                <button id="nextBtn">Envoyer <span class="arrow">➜</span></button>
            </div>
        </div>
    </form>


</div>
<%
}
%>

<script>
    // Quand l'utilisateur clique sur "Suivant", on récupère le message et on affiche une confirmation
    document.getElementById("nextBtn").addEventListener("click", () => {
        const message = document.getElementById("message").value.trim();
        if (message === "") {
            alert("Veuillez entrer un message avant d'envoyer !");
        } else {
            alert("Merci ! Votre message a été envoyé à Mouna \n\nMessage envoyé :\n" + message);
        }
    });
</script>

</body>
</html>

