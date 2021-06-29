<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/29/2021
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <!--Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="product/bootstrap4/css/bootstrap.css">
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
<p>
    <a href="/product?action=search">Search Product</a>
</p>
<table border="1">
    <tr>
        <td>id</td>
        <td>Name</td>
        <td>Price</td>
        <td>Number</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/product?action=view&id=${product.getId()}">${product.getId()}</a></td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getNumber()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">Delete</a></td>
            <%--<td><button onclick="onDelete(${product.getID()})" type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Delete</button> </td>--%>
        </tr>
    </c:forEach>

</table>
<%--<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/product">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="idProductDel">
            <div class="modal-body">
                Are you sure delete ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Delete</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script>
    function onDelete(id) {
        document.getElementById("idProductDel").value = id;
    }
</script>--%>
<script src="product/jquery/jquery-3.5.1.min.js"></script>
<script src="product/jquery/popper.min.js"></script>
<script src="product/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
