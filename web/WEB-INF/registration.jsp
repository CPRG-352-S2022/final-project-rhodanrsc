
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<html>
    <style>
        @media screen {
        * {
            font-family: "Roboto", sans-serif;
        }
        
        html {
            background: #76b852;
        }
        
        body {
            color: #b3b3b3;
        }
        
        h1, h2[name=title]{
            text-align: center;
            color: #ffffff;
        }
        
        form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        
        form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }
        
        form input[type=submit]{
            background: #4CAF50;
            color: #ffffff;
        }
        
        form input[type=submit]:hover {
            background: #43A047;
        }
        
        form a {
            color: #4CAF50;
            text-decoration: none;
        }
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME nVentory</title>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h2 name="title">Registration</h2>
        <form method="post" action="register">   
            <input type="email" name="registerEmail" placeholder="Email" value="" required>
            <br>
            <input type="password" name="registerPassword" placeholder="Password" value="" required>
            <br>
            <input type="text" name="registerFirstName" placeholder="First Name" value="" required>
            <br>
            <input type="text" name="registerLastName" placeholder="Last Name" value="" required>
            <br>
            <input type="submit" value="Register">
            <input type="hidden" name="action" value="Submit">
        </form>
        </body>
</html>
