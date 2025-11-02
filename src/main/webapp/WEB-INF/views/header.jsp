

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        /* header styling */
    header{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background-color: #f4fbf6;
        padding-top: 15px;
        height: 100vh;
    }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 4px 15px;
            margin-top: 8px;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            border: 1px solid #2e9b5c;
            width: 87%;
            height: 40px;


            position: fixed;
            top: 0;
            z-index: 1000; /* pour qu’elle reste au-dessus du contenu */

            background-color: rgb(244, 251, 246,0.93) ;

        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            color: #0a0a0a;
        }

        .logo span {
            color: #2e9b5c;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 30px;
        }

        .nav-links a {
            text-decoration: none;
            color: #2a2a2a;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #2e9b5c;
        }

        .auth-buttons {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .auth-buttons .signin {
            color: #2a2a2a;
            text-decoration: none;
            font-weight: 500;
        }

        .auth-buttons .signup {
            color: #2e9b5c;
            border: 2px solid #2e9b5c;
            padding: 6px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;

        }

        .auth-buttons .signup:hover {
            background-color: #2e9b5c;
            color: white;
        }

    </style>
</head>
<body>
<header>
    <nav class="navbar">
        <div class="logo">Edu<span>Le</span></div>
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">All Course</a></li>
            <li><a href="#">Pages</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
        <div class="auth-buttons">
            <a href="logIn.jee" id="loginBtn" class="signin">Log In</a>
            <a href="signUp.jee" class="signup" id="signupBtn">Sign Up</a>
        </div>
    </nav></header>

</body>
</html>
