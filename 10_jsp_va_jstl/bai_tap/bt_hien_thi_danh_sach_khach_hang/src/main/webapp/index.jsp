<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/25/2021
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Khach Hang</title>
  </head>
  <body>
  <h1>Danh sách khách hàng</h1>
  <c:if test="${empty customerList}">
    <h3>Customer is empty</h3>
  </c:if>
  <c:if test="${not empty customerList}">
    <table border="1">
      <tr>
        <th>Name</th>
        <th>Birth</th>
        <th>Adress</th>
        <th>Avatar</th>
      </tr>
      <c:forEach items="${customerList}" var="customer">
        <tr>
          <td>${customer.nameCustomer}</td>
          <td>${customer.birthdayCustomer}</td>
          <td>${customer.adressCustomer}</td>
          <td><img src="${customer.avatarCustomer}" width="50" height="50"></td>
        </tr>
      </c:forEach>
    </table>
  </c:if>
  </body>
</html>
