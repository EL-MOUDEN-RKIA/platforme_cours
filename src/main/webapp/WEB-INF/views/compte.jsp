<%@ page import="metier.entities.Professeur" %>
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
<% Professeur prof3 = (Professeur) request.getAttribute("prof");%>
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
                <%= prof3.getPrenom().substring(0, 1).toUpperCase() %>
            </button>
        </div>
    </nav>
</div>

<nav class="navbar2">
    <a href="cheekMessage.jee?id=<%=prof3.getId()%>">My Messages</a>
    <a href="cheekAccount.jee?id=<%=prof3.getId()%>" class="active">My Account</a>
</nav>

<main class="dashboard">
    <!-- ====== PROFILE ====== -->
    <section class="profile">
        <div class="avatar">
            <img src="${pageContext.request.contextPath}/assets/images/<%=prof3.getImage()%>"
                 alt="Profile Photo" class="profile-photo">
            <button class="camera-btn">📸</button>
        </div>

        <h2><%= prof3.getPrenom()%></h2>
        <p class="verified">✔ Contact Verified</p>
    </section>

    <section class="account">
        <h3>My Account Details</h3>
        <form class="account-form" action="updateProf.jee?id=<%=prof3.getId()%>" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="prenom" value=<%=prof3.getPrenom()%>>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="nom" value=<%=prof3.getNom()%>>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" name="email" value=<%=prof3.getEmail()%>>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="telephone" value=<%=prof3.getTelephone()%>>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Hourly Rate</label>
                    <input type="text" name="tarif" value=<%=prof3.getTarif()%>>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="adresse" value=<%=prof3.getAdresse()%> >
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Role</label>
                    <input type="text" readonly value="Teacher">
                </div>
                <div class="form-group">
                    <label>Experience</label>
                    <input type="text" name="experience"  value=<%=prof3.getExperience()%>>
                </div>
            </div>

            <!-- Textarea fields -->
            <div class="form-row">
                <div class="form-group full-width">
                    <label>Description</label>
                    <textarea name="description"><%= prof3.getDescription() %></textarea>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group full-width">
                    <label>About Me</label>
                    <textarea name="aboutMe"><%= prof3.getAboutMe() %><</textarea>
                </div>
            </div>

            <button type="submit"  class="btn-update">Update Profile</button>
        </form>
    </section>


</main>

</body>
</html>
