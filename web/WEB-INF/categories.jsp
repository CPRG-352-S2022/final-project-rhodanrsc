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
            max-width:800px; 
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
        
        form[name=formSearch] {
            position: inherit;
            z-index: 1;
            background: #FFFFFF;
            max-width: 280px;
            margin: 0 auto;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        
        form[name=form] input, form[name=formSearch] input, form[name=formAdd] input , form[name=formEdit] input{
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
        
        form input[type=submit], form input[type=button]:hover {
            background: #4CAF50;
            color: #ffffff;
        }
        
        form input[type=submit], form input[type=button]:hover  {
            background: #43A047;
        }
        
        form[name=form] a {
            color: #4CAF50;
            text-decoration: none;
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
        <h2 name="title">Manage Categories</h2>
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
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Edit</th>
                </tr>
                <c:forEach items="${categories}" var="categories">
                    <tr>
                        <td>${categories.categoryID}</td>
                        <td>${categories.categoryName}</td>
                        <td>
                            <form method="get" action="admin?edit">
                                <input type="submit" value="Edit">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="catID" value="${categories.categoryID}">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div name="right">
            <c:if test="${editCat.categoryID != null}">
                <form method="post" action="admin" name="formEdit">
                    <h2>Edit Category</h2>
                    <br>
                    <label>Category ID: </label>
                    <input type="number" name="editCatID" value="${editCat.categoryID}" placeholder="Category ID" disabled="">
                    <br>
                    <label>Category Name: </label>
                    <input type="text" name="editCatName" value="${editCat.categoryName}" placeholder="Category Name">
                    <br>
                    <input type="submit" value="Save">
                    <input type="hidden" name="action" value="saveCat">
                    <a href="admin?category"><input type="button" value="Cancel"></a>
                </form>
            </c:if>
            <br>
            <c:if test="${editCat.categoryID == null}">
                <form method="get" action="admin?add" name="formAdd">
                    <h2>Add Category</h2>
                    <br>
                    <label>Category Name: </label>
                    <input type="text" name="addCatName" value="" placeholder="Category Name">
                    <br>
                    <input type="submit" value="Add">
                </form>
            </c:if>
        </div>
    </body>
</html>
