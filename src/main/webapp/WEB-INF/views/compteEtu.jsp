<%@ page import="metier.entities.Etudiant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord - Salwa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/messages.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/accounts.css">
</head>
<body>
<% Etudiant etu = (Etudiant) request.getAttribute("etudiant");%>
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
                <%= etu.getPrenom().substring(0, 1).toUpperCase() %>
            </button>
        </div>
    </nav>
</div>

<nav class="navbar2">
    <a href="cheekNotifications.jee?id=<%=etu.getId()%>">My Messages</a>
    <a href="cheekAccountEtu.jee?id=<%=etu.getId()%>" class="active">My Account</a>
</nav>

<main class="dashboard">
    <!-- ====== PROFILE ====== -->
    <section class="profile">
        <div class="avatar">
<%--            <img src="${pageContext.request.contextPath}/assets/images/<%=etu.getImage()%>"--%>
                 alt="Profile Photo" class="profile-photo">
            <button class="camera-btn">📸</button>
        </div>

        <h2><%= etu.getPrenom()%></h2>
        <p class="verified">✔ Contact Verified</p>
    </section>

    <section class="account">
        <h3>My Account Details</h3>
        <form class="account-form" action="updateEtu.jee?id=<%=etu.getId()%>" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="prenom" value=<%=etu.getPrenom()%>>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="nom" value=<%=etu.getNom()%>>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" name="email" value=<%=etu.getEmail()%>>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="telephone" value=<%=etu.getTelephone()%>>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group full-width">
                    <label>Education level</label>
                    <select name="niveau_etude"  required>
                        <option value=""><%= etu.getNiveau_etude() %></option>
                        <option>Primary School</option>
                        <option>Middle School</option>
                        <option>High School</option>
                        <option>University</option>
                    </select>
                </div>
            </div>

            <button type="submit"  class="btn-update">Update Profile</button>
        </form>
    </section>


</main>

</body>
</html>
