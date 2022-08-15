
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<html>
    <style>
        * {
            font-family: "Roboto", sans-serif;
        }
        
        html {
            background: #76b852;
        }
        
        body {
            color: #576444;
        }
        
        h2 {
            text-align: center;
            color: #576444;
        }
        
        div {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        
        div p {
            font-size: 20px;
        }
        
        div a {
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME nVentory</title>
    </head>
    <body>
        <div>
            <h2>Welcome to HOME nVentory!</h2>
            <p>Registration successful! Your account has been activated.</p>
            <p>Click the link below to log in.</p>
            <a href="login?logout">Log in</a>
        </div>
    </body>
</html>
