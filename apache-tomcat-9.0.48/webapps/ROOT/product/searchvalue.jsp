<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/29/2021
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> product</title>
</head>
<body>
<h1> product</h1>

<p>
    <a href="/product">Back to customer list</a>
</p>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td><input type="text" name="id" id="id" value="${requestScope["product"].getId()}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Number: </td>
                <td><input type="text" name="number" id="number" value="${requestScope["product"].getNumber()}"></td>
            </tr>
        </table>
    </fieldset>

</body>
</html>
