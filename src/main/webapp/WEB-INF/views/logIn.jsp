
<%@ include file="/WEB-INF/views/header.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/CSS/logIn.css">
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
