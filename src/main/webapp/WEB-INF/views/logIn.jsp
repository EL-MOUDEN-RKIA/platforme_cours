
<%@ include file="/WEB-INF/views/header.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #f9f9f9;
        }

        /* Layout principal */
        .container {
            display: flex;
            flex: 1;
            align-items: center;
            justify-content: space-between;
            padding: 0 80px;
            background: #fff;
        }

        .left {
            flex: 1;
            max-width: 600px;
        }

        .right {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #d9f5f0, #c0efe7, #91e2d5);
            border-top-left-radius: 150px;
            border-bottom-left-radius: 150px;
            height: 80vh;
        }

        .right img {
            width: 350px;
        }

        /* Titre et texte */
        h1 {
            font-size: 32px;
            color: #2e9b5c;
            margin-bottom: 10px;
            text-align: center;
        }

        p {
            color: #777;
            margin-bottom: 30px;
            text-align: center;
        }

        /* --- INPUTS --- */
        .input-box {
            margin-bottom: 18px;
            position: relative;
            border: 1px solid #2e9b5c;
            border-radius: 8px;
            width: 60%;
            margin-left: auto;
            margin-right: auto;
        }

        .input-box input {
            width: 100%;
            padding: 12px 40px;
            border: none;
            outline: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.25);
            color: black;
            font-size: 15px;
        }

        .input-box i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #2e9b5c;
            font-size: 16px;
        }

        .input-box input::placeholder {
            color: rgba(0, 0, 0, 0.4);
        }

        /* --- ACTIONS --- */
        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 60%;
            margin: 10px auto 0;
        }

        .forgot-mot_de_passe a {
            text-decoration: none;
            font-size: 13px;
            color: black;
            transition: 0.3s;
        }

        .forgot-mot_de_passe a:hover {
            color: #2e9b5c;
        }

        .register-btn {
            background: #2e9b5c;
            color: #fff;
            border: none;
            padding: 10px 30px;
            border-radius: 25px;
            font-size: 15px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
        }

        .register-btn:hover {
            background: #258a50;
        }

        /* --- SIGN IN LINK --- */
        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #555;
            font-size: 14px;
        }

        .login-link a {
            color: #2e9b5c;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 900px) {
            .container {
                flex-direction: column;
                padding: 40px;
            }

            .right {
                display: none;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="left">
        <h1>Welcome back!</h1>
        <p>Simplify your workflow and boost your productivity with <strong>Tuga's App</strong>. Get started for free.</p>


        <form action="dashboard.jee" method="get">
            <div class="input-box">
                <i class="fa fa-envelope"></i>
                <input type="email" placeholder="Email" name="email" required>
            </div>

            <div class="input-box">
                <i class="fa fa-lock"></i>

                <input type="password" placeholder="Password" name="mot_de_passe" required>
            </div>

            <div class="actions">
                <div class="forgot-mot_de_passe">
                    <a href="#">Forgot mot_de_passe?</a>
                </div>
                <button type="submit" class="register-btn">Login</button>
            </div>

            <p class="login-link">
                Don't have an account? <a href="#">Sign Up</a>
            </p>
        </form>
    </div>

    <div class="right">
        <img src="https://cdn-icons-png.flaticon.com/512/875/875209.png" alt="illustration">
    </div>
</div>

</body>
</html>
