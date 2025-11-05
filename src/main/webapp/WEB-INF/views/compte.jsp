<%@ page import="metier.entities.Professeur" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord - Salwa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/message.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/account.css">

</head>
<body>

<div class="header">
    <%@ include file="nav.jsp" %>
</div>

<nav class="navbar2">
    <a href="cheekMessage.jee?id=1">My Messages</a>
    <a href="cheekAccount.jee?id=1" class="active">My Account</a>
</nav>

<main class="dashboard">
    <% Professeur prof = (Professeur) request.getAttribute("prof");%>
    <!-- ====== PROFILE ====== -->
    <section class="profile">
        <div class="avatar">
            <div class="user-icon">👤</div>
            <button class="camera-btn">📸</button>
        </div>
        <h2><%= prof.getPrenom()%></h2>
        <p class="verified">✔ Contact Verified</p>
    </section>

    <section class="account">
        <h3>My Account Details</h3>
        <form class="account-form" action="updateProf.jee?id=<%=prof.getId()%>" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="prenom" value=<%=prof.getPrenom()%>>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="nom" value=<%=prof.getNom()%>>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" name="email" value=<%=prof.getEmail()%>>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="telephone" value=<%=prof.getTelephone()%>>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Hourly Rate</label>
                    <input type="text" name="tarif" value=<%=prof.getTarif()%>>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="adresse" value=<%=prof.getAdresse()%> >
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Role</label>
                    <input type="text" readonly value="Teacher">
                </div>
                <div class="form-group">
                    <label>Experience</label>
                    <input type="text" name="experience"  value=<%=prof.getExperience()%>>
                </div>
            </div>

            <!-- Textarea fields -->
            <div class="form-row">
                <div class="form-group full-width">
                    <label>Description</label>
                    <textarea name="description"><%= prof.getDescription() %></textarea>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group full-width">
                    <label>About Me</label>
                    <textarea name="aboutMe"><%= prof.getAboutMe() %><</textarea>
                </div>
            </div>

            <button type="submit"  class="btn-update">Update Profile</button>
        </form>
    </section>


</main>

</body>
</html>
