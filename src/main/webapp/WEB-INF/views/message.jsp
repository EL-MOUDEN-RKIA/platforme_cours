<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord - Salwa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/message.css">
</head>
<body>

<header class="header">
    <div class="logo">superprof</div>
    <div class="search-bar">
        <input type="text" placeholder="Que souhaitez-vous apprendre ?">
        <button><span>🔍</span></button>
    </div>
    <nav class="nav-icons">
        <a href="#">❓</a>
        <a href="#">♡</a>
        <a href="#" class="user-circle">S</a>
    </nav>
</header>

<nav class="navbar">
    <a href="#" class="active">Tableau de bord</a>
    <a href="#">Mes messages</a>
    <a href="#">Mon compte</a>
</nav>

<main class="dashboard">
    <section class="profile">
        <div class="avatar">
            <div class="user-icon">👤</div>
            <button class="camera-btn">📸</button>
        </div>
        <h2>Salwa</h2>
        <p class="verified">✔ Contact vérifié</p>
    </section>

    <section class="requests">
        <h3>Mes demandes de cours</h3>
        <div class="no-request">
            <img src="https://cdn-icons-png.flaticon.com/512/5956/5956596.png" alt="demande" class="icon">
            <p>Aucune demande</p>
            <button class="btn-gradient">Trouvez un professeur</button>
        </div>
    </section>
</main>

</body>
</html>

