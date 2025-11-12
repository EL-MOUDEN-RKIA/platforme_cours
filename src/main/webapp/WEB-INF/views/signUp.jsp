<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Domaine" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Your Account</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/signUp.css">
</head>
<body>
<!-- Main Container -->
<div class="container">

    <!-- Header Section -->
    <div class="header">
        <h1>Create Your Account</h1>
        <div class="user-type">
            <div id="teacherTab" class="active"> Teacher</div>
            <div id="studentTab">Student</div>
        </div>
    </div>

    <!-- TEACHER FORM -->
    <form action="login.jee" method="post" id="teacherForm" class="active">
        <div class="grid">
            <div class="form-group">
                <label>First Name *</label>
                <input type="text" name="prenom" required>
            </div>

            <div class="form-group">
                <label>Last Name *</label>
                <input type="text" name="nom" required>
            </div>

            <div class="form-group">
                <label>Email *</label>
                <input type="email" name="email" required>
            </div>

            <div class="form-group">
                <label>Password *</label>
        <input type="password" name="mot_de_passe" required>
            </div>

            <div class="form-group">
                <label>Address *</label>
                <input type="text"  name="adresse" required>
            </div>

            <div class="form-group">
                <label>Phone Number *</label>
                <input type="tel" name="telephone" required>
            </div>

            <div class="form-group">
                <label>Hourly Rate ($) *</label>
                <input type="number" name="tarif_horaire" required>
            </div>

            <div class="form-group">
                <label>Subjects *</label>

                <select name="module" required>
                    <%
                        List<Domaine> listModel = (List<Domaine>) request.getAttribute("listModel");
                        if (listModel != null) {
                            for (Domaine d : listModel) { %>
                    <option><%= d.getName() %></option>
                    <%
                            } // fin du for
                        } // fin du if
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Experience *</label>
                <input type="text" name="experience" placeholder="e.g. 5 years teaching" required>
            </div>

            <div class="form-group">
                <label>Short Description *</label>
                <textarea name="description" required></textarea>
            </div>

            <div class="form-group">
                <label>About Me *</label>
                <textarea name="about_me" required></textarea>
            </div>

            <div class="form-group">
                <label>Profile Image *</label>
                <input type="file" name="image" accept="image/*" required>
            </div>
        </div>

        <div class="btns">
            <button type="button" class="cancel">Cancel</button>
            <button type="submit" class="signup">Sign Up </button>
        </div>
    </form>




    <!-- STUDENT FORM -->
    <form id="studentForm" action="logIn.jee" method="post">
        <div class="grid">
            <div class="form-group">
                <label>First Name *</label>
                <input type="text" name="prenom" required>
            </div>

            <div class="form-group">
                <label>Last Name *</label>
                <input type="text" name="nom" required>
            </div>

            <div class="form-group">
                <label>Email *</label>
                <input type="email" name="email" required>
            </div>

            <div class="form-group">
                <label>Password *</label>

                <input type="password" name="mot_de_passe" required>
            </div>

            <div class="form-group">
                <label>Phone Number *</label>
                <input type="tel" name="telephone" required>
            </div>

            <div class="form-group">
                <label>Education Level *</label>
                <select name="niveau_etude" required>
                    <option value="">-- Select Level --</option>
                    <option>Primary School</option>
                    <option>Middle School</option>
                    <option>High School</option>
                    <option>University</option>
                </select>
            </div>
        </div>
        <div class="btns">
            <button type="button" class="cancel">Cancel</button>
            <button type="submit" class="signup">Sign Up</button>
        </div>
    </form>
</div>

<script src="assets/JS/signUp.js"></script>

</body>
</html>