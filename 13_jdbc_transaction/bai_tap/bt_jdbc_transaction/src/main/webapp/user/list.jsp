<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/30/2021
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <!--Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="user/bootstrap-4.6.0-dist/css/bootstrap.css">
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/user?action=create">Add New User</a>
    </h2>
    <h2>
        <a href="/user?action=search">Search User</a>
    </h2>
    <h2>
        <a href="/user?action=sort">Sort By Name</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/user?action=edit&id=${user.id}">Edit</a>
                    <button onclick="onDelete('${user.id}','${user.name}')" type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Delete</button>
                </td>
            </tr>
        </c:forEach>
        <!-- Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete <input readonly style="outline: none; border: none;" type="text" id="userName"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/user" method="get">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="" id="idUser">
                        <div class="modal-body">
                            Delete <span id="userName1"></span>, Are you sure?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </table>
</div>
<script src="user/bootstrap-4.6.0-dist/jquery/jquery-3.5.1.min.js"></script>
<script src="user/bootstrap-4.6.0-dist/jquery/popper.min.js"></script>
<script src="user/bootstrap-4.6.0-dist/js/bootstrap.js"></script>
<script>
    function onDelete(id, name) {
        document.getElementById("idUser").value= id;
        document.getElementById("userName").value= name;
        document.getElementById("userName1").innerText = name;
    }
</script>
</body>

</html>
