<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Cart</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/home.css" rel="stylesheet" />
    </head>

    <body> 
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <img class="img-responsive" style="width: 70px" src="images/logo.jpg" alt="Book Store" />
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li> 
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="allproduct">Tất cả các sản phẩm</a></li>
                                <li><hr class="dropdown-divider"/></li>
                                    <c:forEach items="${sessionScope.listCategory}" var="c">
                                    <li><a class="dropdown-item" href="category?cid=${c.getID()}">${c.getName()}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    <div class="container">
                        <form class="d-flex" action="search" method="post">
                            <input class="form-control me 2" style="margin-right: 5px; width: 350px" type="text" placeholder="Search" name="search">
                            <button class="btn btn-outline-dark" type="submit">Search</button>
                        </form>
                    </div>
                    <form class="d-flex"> 
                        <a class="btn btn-outline-dark" style="margin-right: 15px; position: relative;" href="showcart">
                            <div style="display: flex;">
                                <i class="bi-cart-fill me-1"></i> 
                                <span class="badge bg-danger position-absolute top-0 start-100 translate-middle" >${sessionScope.size}</span>
                            </div>
                        </a>
                        <c:if test="${sessionScope.account == null}">
                            <a class="btn btn-outline-dark" href="login">Login</a>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <a class="btn btn-outline-dark" style="width: 91px; margin-right: 10px" href="logout">Log out</a>
                            <a class="btn btn-outline-dark" href="#" style="width: 160px"><i> Welcome ${sessionScope.account.username}</i></a> 
                        </c:if>  
                    </form>

                </div>
            </div>
        </nav>
        <div class="shopping-cart">
            <div class="px-4 px-lg-0"> 
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5"> 
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase"> </div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Product</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Unit Price</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Quantity</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Subtoal</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase"></div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="stt" value="0"/>
                                            <c:forEach items="${cart.getItems()}" var="i">
                                                <c:set var="stt" value="${stt + 1}"/>
                                                <tr>
                                                    <th>${stt}</th>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="${i.product.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="detail?pid=${i.product.getProductID()}" style="color: black" >${i.product.nameProduct}</a></h5> 
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle" style="font-size: large"><fmt:formatNumber value="${i.product.price}"/> VND </td>
                                                    <td class="align-middle">
                                                        <a href="process?num=-1&id=${i.product.productID}"><button class="btnSub">-</button></a> 
                                                        <strong>${i.quantity}</strong>
                                                        <a href="process?num=1&id=${i.product.productID}"><button class="btnAdd">+</button></a>
                                                    </td> 
                                                    <td class="align-middle" style="font-size: large"><fmt:formatNumber value="${i.product.price*i.quantity}"/> VND </td>
                                                    <td class="align-middle">
                                                        <form action="process" method="post">
                                                            <input type="hidden" name="id" value="${i.product.productID}"> 
                                                            <input class="btn btn-danger" type="submit" value="Delete">
                                                            </button> 
                                                        </form>
                                                    </td>     
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                        <div style="display: flex">  
                            <h5 class="col-8" style="font-size: xx-large; text-align: right">Total money: </h5>
                            <h5 style="text-align: left; margin-left: 45px; font-size: xx-large" class="col-4"><fmt:formatNumber value="${requestScope.cart.getTotalMoney()}"/> VND</h5> 
                        </div> 
                        <a style="width: 200px; margin-left: 850px " href="checkout" class="btn btn-dark rounded-pill btn-block">ODER</a>  

                    </div>
                </div>
            </div>
        </div> 
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white"> Địa chỉ: Khu CNC Hòa Lạc, Thạch Hòa, Thạch Thất, Hà Nội</p>
                <p class="m-0 text-center text-white"> Tel: 028.73008182 - Fax: 028.39733234 - Email: hotro@book.com</p>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</html>
