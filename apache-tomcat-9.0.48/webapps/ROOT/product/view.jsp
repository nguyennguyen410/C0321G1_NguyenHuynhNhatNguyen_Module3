<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/29/2021
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Product</title>
</head>
<body>
<h1> Product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>

    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td>${requestScope["product"].getId()}</td>
            </tr>
            <tr>
                <td>Name: </td>
                <td>${requestScope["product"].getName()}</td>
            </tr>
            <tr>
                <td>Price: </td>
                <td>${requestScope["product"].getPrice()}</td>
            </tr>
            <tr>
                <td>Number: </td>
                <td>${requestScope["product"].getNumber()}</td>
            </tr>

        </table>
    </fieldset>
</form>
</body>
</html>
