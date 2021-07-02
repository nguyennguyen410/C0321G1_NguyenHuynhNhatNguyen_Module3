<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/30/2021
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<h1>Search by country</h1>
<form method="post" action="/user">
    <table>
        <tr>
            <td><input type="text" name="search-country" id="search-country"></td>
            <td><input type="hidden" value="search" name="action"></td>
            <td><input type="submit" value="Search"></td>
        </tr>
    </table>
</form>
</body>
</html>
