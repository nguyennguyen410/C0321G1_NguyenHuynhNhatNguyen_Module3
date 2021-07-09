<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 7/6/2021
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<body class="container-fluid">
<jsp:include page="bootstrap.jsp"></jsp:include>
<div class="container-fluid header col-md-12" id="header" style="align-items: center">
    <img src="Images/logo.png">
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/employee?action=homeEmployee">Employee <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/customer?action=homeCustomer">Customer <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Service <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Contract <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="row">
    <div class="col-md-3">
        <div class="list-group">
            <button type="button" class="list-group-item list-group-item-action active">
                <a href="/employee?action=create" style="color: white">Create Employee</a>
            </button>
            <button type="button" class="list-group-item list-group-item-action">
                <a href="/employee?action=listEmployee" style="color: darkblue">List Employee</a>
            </button>
            <button type="button" class="list-group-item list-group-item-action">Search Employee</button>
            <%--<button type="button" class="list-group-item list-group-item-action">Customer</button>
            <button type="button" class="list-group-item list-group-item-action" disabled>Service</button>--%>
        </div>
    </div>
    <div class="col-md-9">
        <div align="center">
            <form method="post">
                <table class="table" cellpadding="5">
                    <caption>
                        <h2>Add New Employee</h2>
                    </caption>
                    <tr>
                        <th>Employee Id:</th>
                        <td>
                            <input type="text" name="employeeId" id="employeeId" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Employee Name:</th>
                        <td>
                            <input type="text" name="employeeName" id="employeeName" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Employee Birthday:</th>
                        <td>
                            <input type="text" name="employeeBirthday" id="employeeBirthday" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Employee Id Card:</th>
                        <td>
                            <input type="text" name="employeeIdCard" id="employeeIdCard" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Employee Salary:</th>
                        <td>
                            <input type="text" name="employeeSalary" id="employeeSalary" size="45"/>
                            <c:if test="${messMoney != null}">
                                <small id="employeeMoneyValidate" class="form-text text-danger">${messMoney}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>Employee Phone:</th>
                        <td>
                            <input type="text" name="employeePhone" id="employeePhone" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Employee Email:</th>
                        <td>
                            <input type="text" name="employeeEmail" id="employeeEmail" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Employee Address:</th>
                        <td>
                            <input type="text" name="employeeAddress" id="employeeAddress" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Position Id:</th>
                        <td>
                            <input type="text" name="positionId" id="positionId" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Education Degree Id:</th>
                        <td>
                            <input type="text" name="educationDegreeId" id="educationDegreeId" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Division Id:</th>
                        <td>
                            <input type="text" name="divisionId" id="divisionId" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Username:</th>
                        <td>
                            <input type="text" name="username" id="username" size="45"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Save"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<div class="footer" id="footer">
    <footer class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h6>About</h6>
                    <p class="text-justify">103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam
                        Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666
                        Email: reservation@furamavietnam.com * www.furamavietnam.com</div>

                <div class="col-xs-6 col-md-3">
                    <h6>Categories</h6>
                    <ul class="footer-links">
                        <li><a href="http://scanfcode.com/category/c-language/">C</a></li>
                        <li><a href="http://scanfcode.com/category/front-end-development/">UI Design</a></li>
                        <li><a href="http://scanfcode.com/category/back-end-development/">PHP</a></li>
                        <li><a href="http://scanfcode.com/category/java-programming-language/">Java</a></li>
                        <li><a href="http://scanfcode.com/category/android/">Android</a></li>
                        <li><a href="http://scanfcode.com/category/templates/">Templates</a></li>
                    </ul>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6>Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="http://scanfcode.com/about/">About Us</a></li>
                        <li><a href="http://scanfcode.com/contact/">Contact Us</a></li>
                        <li><a href="http://scanfcode.com/contribute-at-scanfcode/">Contribute</a></li>
                        <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
                        <li><a href="http://scanfcode.com/sitemap/">Sitemap</a></li>
                    </ul>
                </div>
            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p class="copyright-text">Copyright &copy; 2017 All Rights Reserved by
                        <a href="#">Scanfcode</a>.
                    </p>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <ul class="social-icons">
                        <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>


