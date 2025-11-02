

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="metier.entities.Domaine" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Your Account</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: "Poppins", sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            min-height: 100vh;
        }



        /* Page Container */
        .container {
            width: 1100px;
            max-width: 95%;
            margin: 50px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            padding: 40px 50px 50px;
        }

        /* Header Title */
        .header {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            border-bottom: 2px solid #eaeaea;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 26px;
            color: #333;
            margin: 0 0 15px 0;
        }

        /* Tabs like steps */
        .user-type {
            display: flex;
            gap: 30px;
        }

        .user-type div {
            position: relative;
            color: #777;
            font-weight: 500;
            cursor: pointer;
            padding-bottom: 8px;
            transition: all 0.3s ease;
        }

        .user-type div.active {
            color: #00a86b;
            font-weight: 600;
        }

        .user-type div.active::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            height: 3px;
            width: 100%;
            background: #00a86b;
            border-radius: 5px;
        }

        /* Form Container */
        form {
            display: none;
            flex-direction: column;
        }

        form.active {
            display: flex;
        }

        /* Grid for 3 columns */
        .grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px 25px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 500;
            color: #333;
            margin-bottom: 5px;
        }

        input, select, textarea {
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            transition: border 0.2s ease;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #00a86b;
        }

        textarea {
            resize: none;
            height: 70px;
        }

        /* Buttons */
        .btns {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 20px;
        }

        button {
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            padding: 10px 25px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .cancel {
            background: #e5e5e5;
            color: #333;
        }

        .cancel:hover {
            background: #ccc;
        }

        .signup {
            background: #00a86b;
            color: white;
        }

        .signup:hover {
            background: #00945f;
        }
    </style>
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
                <input type="text" name="nom" required>
            </div>

            <div class="form-group">
                <label>Last Name *</label>
                <input type="text" name="prenom" required>
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
            <button type="submit" class="signup">Sign Up →</button>
        </div>
    </form>




    <!-- STUDENT FORM -->
    <form id="studentForm" action="logIn.jee" method="post">
        <div class="grid">
            <div class="form-group">
                <label>First Name *</label>
                <input type="text" name="nom" required>
            </div>

            <div class="form-group">
                <label>Last Name *</label>
                <input type="text" name="prenom" required>
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

<script>
    const teacherTab = document.getElementById("teacherTab");
    const studentTab = document.getElementById("studentTab");
    const teacherForm = document.getElementById("teacherForm");
    const studentForm = document.getElementById("studentForm");

    teacherTab.addEventListener("click", () => {
        teacherTab.classList.add("active");
        studentTab.classList.remove("active");
        teacherForm.classList.add("active");
        studentForm.classList.remove("active");
    });

    studentTab.addEventListener("click", () => {
        studentTab.classList.add("active");
        teacherTab.classList.remove("active");
        studentForm.classList.add("active");
        teacherForm.classList.remove("active");
    });
</script>
</body>
</html>