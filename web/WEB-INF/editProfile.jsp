<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            color: #b3b3b3;
        }
        
        h1, h2[name=title]{
            text-align: center;
            color: #ffffff;
        }
        
        div[name=left], div[name=center], div[name=right] {
            float: left;
            width: 30%;
            margin: 0 auto;
            padding: 0;
        }
        
        div[name=center] {
            width: 40%;
        }
        
        div[name=center] p {
            color: #ffffff;
        }
        
        div[name=menu] {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 50px auto;
            padding: 20px 10px;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        
        div[name=menu] h2 {
            text-align: center;
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
        
        form input[type=radio] {
            width: 20%;
        }
        
        form input[type=submit], form input[type=button]:hover {
            background: #4CAF50;
            color: #ffffff;
        }
        
        form input[type=submit], form input[type=button]:hover  {
            background: #43A047;
        }
        
        a {
            color: #4CAF50;
            text-decoration: none;
            text-align: left;
        }
        
        form a {
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME nVentory</title>
    </head>
    <body>
        <header>
            <h1>HOME nVentory</h1>
            <h2 name="title">Edit Profile</h2>
        </header>
        <div name="left">
            <div name="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="inventory?editProfile">Edit Profile</a></li>
                    <li><a href="inventory?admin">Inventory</a></li>
                    <c:if test="${user.role.roleId == 1}">
                        <li><a href="admin?category">Categories</a></li>
                        <li><a href="admin">Admin</a></li>
                    </c:if>
                    <li><a href="login?logout">Logout</a></li>
                </ul>
            </div>
        </div>  
        <div name="center">
            <form method="post" action="inventory">
                <label>Email: </label>
                <input type="email" name="emailEdit" placeholder="Email" value="${editProfile.email}">
                <br>
                <label>Password: </label>
                <input type="password" name="passwordEdit" placeholder="Password" value="${editProfile.password}">
                <br>
                <label>First Name: </label>
                <input type="text" name="firstnameEdit" placeholder="First Name" value="${editProfile.firstName}">
                <br>
                <label>Last Name: </label>
                <input type="text" name="lastnameEdit" placeholder="Last Name" value="${editProfile.lastName}">
                <br>
                <c:choose>
                    <c:when test="${editProfile.active}">
                        <input type="radio" id="active" name="activeStatus" value="active" checked="checked"><label for="active" >Active</label>
                        <input type="radio" id="inactive" name="activeStatus" value="inactive"><label for="inactive">Inactive</label>
                    </c:when>
                    <c:otherwise>
                        <input type="radio" id="active" name="activeStatus" value="active"><label for="active">Active</label>
                        <input type="radio" id="inactive" name="activeStatus" value="inactive" checked="checked"><label for="inactive" >Inactive</label>
                    </c:otherwise>
                </c:choose>
                <br>
                <input type="submit" value="Save">
                <input type="hidden" name="action" value="saveProfile">
                <a href="inventory"><input type="button" value="Cancel"></a>
            </form>
        </div>
        <div name="right"></div>
    </body>
</html>
