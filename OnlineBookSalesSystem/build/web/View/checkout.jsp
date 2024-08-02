<%-- 
    Document   : checkout
    Created on : Mar 18, 2024, 9:37:54 AM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi" class="h-100">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Check out</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/checkout.css" type="text/css">
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
        <div class="container">
            <div class="window">
                <div class="order-info">
                    <div class={order-info-content">
                        <h2>Order Summary</h2>
                        <div class="line"></div>
                        <table class="order-table">
                            <tbody>
                                <c:set var="stt" value="0"/>
                                <c:forEach items="${cart.getItems()}" var="i">
                                    <c:set var="stt" value="${stt + 1}"/>
                                    <tr>
                                        <td>${stt}</td>
                                        <td><img src="${i.product.image}" class="full-width"></img></td>
                                        <td>
                                            <br> <span class="thin">${i.product.nameProduct}</span>
                                            <span class="thin small"> Quantity: ${i.quantity}</span>
                                        </td> 
                                    </tr> 
                                </c:forEach> 
                            </tbody>
                        </table> 
                        <div style="display: flex">
                            <h5 style="font-size: x-large;">TOTAL:</h5>
                            <h5 style="text-align: right; font-size: x-large; color: red; margin-left: 130px"><fmt:formatNumber value="${requestScope.cart.getTotalMoney()}"/> VND</h5> 
                        </div>
                    </div>
                </div>
                <form action="checkout" method="post"> 
                    <div class="credit-info-content">  
                        Full Name:
                        <input class="input-field" type="text" name="name" required></input>
                        Email:
                        <input class="input-field" type="email" name="email"></input>
                        Phone:
                        <input class="input-field" type="text" name="phone" pattern="[0-9]{10}" required></input>
                        Address:
                        <input class="input-field" type="text" name="address" required></input> 
                        <button style="background-color: #22b877; border: 1px solid gray; width: 258px; height: 43px; border-radius: 5px; color: white">
                            Checkout</button> 
                    </div>  
                </form>
            </div>
        </div> 

        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white"> Địa chỉ: Khu CNC Hòa Lạc, Thạch Hòa, Thạch Thất, Hà Nội</p>
                <p class="m-0 text-center text-white"> Tel: 028.73008182 - Fax: 028.39733234 - Email: hotro@book.com</p>
            </div>
        </footer> 
    </body>

</html>