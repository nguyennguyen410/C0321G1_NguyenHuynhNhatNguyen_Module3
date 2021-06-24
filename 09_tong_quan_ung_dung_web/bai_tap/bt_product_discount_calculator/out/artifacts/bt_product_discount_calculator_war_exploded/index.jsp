<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/24/2021
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Discount</title>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="/calculator" method="post">
  <label>Product Description: </label><br/>
  <input type="text" name="description"/><br/>
  <label>Price: </label><br/>
  <input type="text" name="price"/><br/>
  <label>Discount Percent: </label><br/>
  <input type="text" name="percent"/><br/>
  <input type = "submit" id = "submit"/>
</form>
</body>
</html>
