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
                <a class="nav-link" href="#">Employee <span class="sr-only">(current)</span></a>
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
                <a href="/customer?action=create" style="color: white">Create Customer</a>
            </button>
            <button type="button" class="list-group-item list-group-item-action">
                <a href="/customer?action=listCustomer" style="color: darkblue">List Customer</a>
            </button>
            <button type="button" class="list-group-item list-group-item-action">
                <a href="/customer?action=editCustomer" style="color: darkblue">Edit Customer</a>
            </button>
            <button type="button" class="list-group-item list-group-item-action">Customer</button>
            <button type="button" class="list-group-item list-group-item-action" disabled>Service</button>
        </div>
    </div>
    <div class="col-md-9">
        <h3>KHU NGH??? D?????NG ?????NG C???P TH??? GI???I, FURAMA ???? N???NG, N???I TI???NG L?? KHU NGH??? D?????NG ???M TH???C T???I VI???T NAM.</h3>
        <p>H?????ng ra b??i bi???n ???? N???ng tr???i d??i c??t tr???ng, Furama Resort ???? N???ng l?? c???a ng?? ?????n v???i 3 di s???n v??n ho?? th??? gi???i:
            H???i An (20 ph??t), M??? S??n (90 ph??t) v?? Hu??? (2 ti???ng. 196 ph??ng h???ng sang c??ng v???i 70 c??n bi???t th??? t??? hai ?????n b???n
            ph??ng ng??? c?? h??? b??i ri??ng ?????u ???????c trang tr?? trang nh??, theo phong c??ch thi???t k??? truy???n th???ng c???a Vi???t Nam v??
            ki???n tr??c thu???c ?????a c???a Ph??p, bi???n Furama th??nh khu ngh??? d?????ng danh gi?? nh???t t???i Vi???t Nam ??? vinh d??? ???????c ????n ti???p
            nhi???u ng?????i n???i ti???ng, gi???i ho??ng gia, ch??nh kh??ch, ng??i sao ??i???n ???nh v?? c??c nh?? l??nh ?????o kinh doanh qu???c t???.
        </p>

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
