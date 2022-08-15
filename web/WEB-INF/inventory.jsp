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
        
        table td {
            padding: 10px;            
        } 
        
        table tr {
            display: table-row;
            background: #f6f6f6;
            text-align: center;
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
        
        input[type=button],input[type=submit]{
            background: #4CAF50;
        }
        
        input[type=button]:hover ,input[type=submit]:hover {
            background: #43A047;
            color: #ffffff;
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
        <header>
            <h1>HOME nVentory</h1>
            <h2 name="title">Inventory for ${user.firstName} ${user.lastName}</h2>
        </header>
        <div name="left">
            <div name="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="inventory?editProfile">Edit Profile</a></li>
                    <li><a href="inventory">Inventory</a></li>
                    <c:if test="${user.role.roleId == 1}">
                        <li><a href="admin?category">Categories</a></li>
                        <li><a href="admin">Admin</a></li>
                    </c:if>
                    <li><a href="login?logout">Logout</a></li>
                </ul>
            </div>
            <c:if test="${user.role.roleId == 1}">
                <form method="post" action="inventory" name="formSearch">
                    <input type="text" name="searchItem" value="${searchItem}" placeholder="Search Items">
                    <input type="submit" value="Search">
                    <input type="hidden" name="action" value="search">
                    <a href="inventory?admin"><input type="button" value="Clear"></a>
                </form>
            </c:if>
        </div>
        <div name="center">
            <div name="table">
                <c:if test="${items != null && searchItem != null}">
                    <p>Search Results: <p>
                    <table>

                        <tr>
                            <th>Owner</th>
                            <th>Item Name</th>
                        </tr>
                        <c:forEach items="${items}" var="items">
                            <c:if test="${items.itemName.contains(searchItem)}">
                                <tr>
                                    <td>${items.owner.firstName}</td>
                                    <td>${items.itemName}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                    <br>
                </c:if>
                <p>All items:</p>
                <table>
                    <tr>
                        <th>Owner</th>
                        <th>Category</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <c:forEach items="${items}" var="items">
                        <tr>
                            <td>${items.owner.firstName}</td>
                            <td>${items.category.categoryName}</td>
                            <td>${items.itemName}</td>
                            <td>${items.price}</td>
                            <td>
                                <form method="post" action="inventory">
                                    <input type="submit" value="Edit">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="itemID" value="${items.itemID}">
                                </form>
                            </td>
                            <td>
                                <form method="post" action="inventory">
                                    <input type="submit" name="action" value="Delete">
                                    <input type="hidden" name="itemID" value="${items.itemID}">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <p>${message}</p>
        </div>
        <div name="right">
            <c:if test="${editItem.itemID != null}">
                <form method="post" action="inventory" name="formEdit">
                    <h2>Edit Item</h2>
                    <br>
                    <label>Category: </label>
                    <select name="categoryEdit" value="">
                        <c:forEach items="${categories}" var="categories">
                            <option value="${categories.categoryID}">${categories.categoryName}</options>
                        </c:forEach>
                    </select>
                    <br>
                    <label>Name: </label>
                    <input type="text" name="itemEdit" value="${editItem.itemName}" placeholder="Item Name">
                    <br>
                    <label>Price: </label>
                    <input type="text" name="priceEdit" value="${editItem.price}" placeholder="Price">
                    <br>
                    <input type="submit" value="Save">
                    <input type="hidden" name="action" value="save">
                    <a href="inventory"><input type="button" value="Cancel"></a>
                </form>
            </c:if>

            <c:if test="${editItem == null}">
                <form method="post" action="inventory" name="formAdd">
                    <h2>Add Item</h2>
                    <br>
                    <label>Category: </label> 
                    <select name="categoryAdd">
                        <option value="1">kitchen</option>
                        <option value="2">bathroom</option>
                        <option value="3">living room</option>
                        <option value="4">basement</option>
                        <option value="5">bedroom</option>
                        <option value="6">garage</option>
                        <option value="7">office</option>
                        <option value="8">utility room</option>
                        <option value="9">storage</option>
                        <option value="10">other</option>
                    </select>
                    <br>
                    <label>Name: </label>
                    <input type="text" name="itemAdd" value="" placeholder="Item Name" required>
                    <br>
                    <label>Price: </label>
                    <input type="number" name="priceAdd" value="" placeholder="Price" step=".01" required>
                    <br>
                    <input type="submit" value="Add">
                    <input type="hidden" name="action" value="add">
                </form>
            </c:if>
        </div>
    </body>
</html>
