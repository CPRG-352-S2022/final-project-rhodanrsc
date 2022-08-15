<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<html>
    <style>
        * {
            font-family: "Roboto", sans-serif;
            box-sizing: inherit;
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
            border-radius:2px;
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto;
            padding: 20px 10px;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        
        div[name=menu] h2 {
            text-align: center;
        }
        
        div[name=table] {
            display: inline-box;
            margin: 0;
            padding: 0;
        }
        
        table {
            border-spacing: 1; 
            border-collapse: collapse; 
            background:white;
            border-radius:2px;
            overflow:hidden;
            max-width:850px; 
            width:100%;
            margin:0 auto;
            position:relative;
            display: inline-box;
        }
        
        table tr {
            display: table-row;
            background: #f6f6f6;
            text-align: center;
        }
        
        table td {
            padding: 10px;            
        } 
        
        table td input {
            border: 0;
        }
        
        table tr:nth-of-type(odd) {
            background: #e9e9e9;
        }
        
        table th {
            font-weight: 900;
            color: #ffffff;
            background: #808080;
        }

        form[name=form]{
            border-radius:2px;
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        
        form[name=formAdd]{
            border-radius:2px;
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 280px;
            margin: 0 auto;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        
        form[name=formEdit]{
            border-radius:2px;
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 280px;
            margin: 0 auto;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        
        form[name=form] input, form[name=formEdit] input, form[name=formAdd] input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
            display: inline-box;
        }
        
        select {
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
        
        label {
            text-align: left;
        }
        
        input[type=button],input[type=submit]{
            background: #4CAF50;
        }
        
        input[type=button]:hover ,input[type=submit]:hover {
            background: #43A047;
            color: #ffffff;
        }
        
        form[name=form] a {
            color: #4CAF50;
            text-decoration: none;
        }
        
        form input[type=submit], form input[type=button]:hover {
            background: #4CAF50;
            color: #ffffff;
        }
        
        form input[type=submit], form input[type=button]:hover  {
            background: #43A047;
        }
    
        form input[type=radio] {
            width: 20%;
        }
        
        p {
            text-align: center;
        }
        
        a {
            color: #4CAF50;
            text-decoration: none;
            text-align: left;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME nVentory</title>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h2 name="title">Manage Users</h2>
        <div name="left">
            <div name="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="inventory?editProfile">Edit Profile</a></li>
                    <li><a href="inventory?admin">Inventory</a></li>
                    <li><a href="admin?category">Categories</a></li>
                    <li><a href="admin">Admin</a></li>
                    <li><a href="login?logout">Logout</a></li>
                </ul>
            </div>
        </div>   
        <div name="center">
        <table>
            <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${users}" var="users">
                <tr>
                    <td>${users.email}</td>
                    <td>${users.firstName}</td>
                    <td>${users.lastName}</td>
                    <td>
                    <form method="post" action="admin">
                            <input type="submit"  value="Edit">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="usernameEdit" value="${users.email}">
                    </form>
                    </td>
                    <td>
                    <form method="post" action="admin">
                            <input type="submit" value="Delete">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="usernameDel" value="${users.email}">
                    </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>${message}</p>
        </div>
        <div name="right">
            <c:if test="${editUser.email != null}">
                <div name="edit">
                    <form method="post" action="admin" name="formEdit">
                        <h2>Edit User</h2>
                        <br>
                        <input type="email" name="emailEdit" placeholder="Email" value="${editUser.email}">
                        <br>
                        <input type="password" name="passwordEdit" placeholder="Password" value="${editUser.password}">
                        <br>
                        <input type="text" name="firstnameEdit" placeholder="First Name" value="${editUser.firstName}">
                        <br>
                        <input type="text" name="lastnameEdit" placeholder="Last Name" value="${editUser.lastName}">
                        <br>
                        <c:choose>
                            <c:when test="${editUser.active}">
                                <input type="radio" id="active" name="activeStatus" value="active" checked="checked"><label for="active" >Active</label>
                                <input type="radio" id="inactive" name="activeStatus" value="inactive"><label for="inactive">Inactive</label>
                            </c:when>
                            <c:otherwise>
                                <input type="radio" id="active" name="activeStatus" value="active"><label for="active">Active</label>
                                <input type="radio" id="inactive" name="activeStatus" value="inactive" checked="checked"><label for="inactive" >Inactive</label>
                            </c:otherwise>
                        </c:choose>
                        <br>
                        <label>Role:</label>
                        <select name="rolesSelect">
                            <c:forEach items="${roles}" var="roles">
                                <option value="${roles.roleId}">${roles.roleName}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <input type="submit" value="Save">
                        <input type="hidden" name="action" value="save">
                        <a href="admin"><input type="button" value="Cancel"></a>
                    </form>
                </div>
            </c:if>

            <br>
            <c:if test="${editUser.email == null}">
                <div name="add">
                    <form method="post" action="admin" name="formAdd" required>
                        <h2>Add User</h2>
                        <br>
                        <input type="text" name="emailAdd" placeholder="Email" required>
                        <br>
                        <input type="password" name="passwordAdd" placeholder="Password" required>
                        <br>
                        <input type="text" name="firstnameAdd" placeholder="First Name" required>
                        <br>
                        <input type="text" name="lastnameAdd" placeholder="Last Name" required>
                        <br>
                        <input type="radio" id="active" name="activeStatus" value="active"><label for="active">Active</label>
                        <input type="radio" id="inactive" name="activeStatus" value="inactive" checked="checked"><label for="inactive" >Inactive</label>
                        <br>
                        <label>Role:</label>
                        <select name="rolesSelect">
                            <c:forEach items="${roles}" var="roles">
                                <option value="${roles.roleId}">${roles.roleName}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <input type="submit" name="addUser" value="Save">
                        <input type="hidden" name="action" value="add">
                    </form>
                </div>
            </c:if>
        </div>
    </body>
</html>