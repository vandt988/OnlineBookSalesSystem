<%-- 
    Document   : detail
    Created on : Mar 11, 2024, 3:56:05 PM
    Author     : Admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Detail Product</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/detail.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
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
                                <li><hr class="dropdown-divider" /></li>
                                    <c:forEach items="${sessionScope.listCategory}" var="c">
                                    <li><a class="dropdown-item" href="category?cid=${c.getID()}">${c.getName()}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    <div class="container">
                        <form class="d-flex" style="margin-left: 200px;" action="search" method="post">
                            <input class="form-control me 2" style="margin-right: 5px; width: 350px" type="search" placeholder="Search" name="search">
                            <button class="btn btn-outline-dark" type="send">Search</button>
                        </form>
                    </div>
                    <form class="d-flex">
                        <a class="btn btn-outline-dark" style="margin-right: 15px; position: relative;" href="showcart">
                            <div style="display: flex;">
                                <i class="bi-cart-fill me-1"></i> 
                                <c:if test="${sessionScope.account != null}">
                                    <span class="badge bg-danger position-absolute top-0 start-100 translate-middle" >${sessionScope.size}</span>
                                </c:if>                            </div>
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
        <!-- Product section-->  
        <section class="py-5">
            <form action="addtocart?addid=${product.getProductID()}" method="post">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6"><img style="width: 450px; margin-left: 60px" class="card-img-top mb-5 mb-md-0" src="${product.getImage()}" alt="..." /></div>
                        <div class="col-md-6">
                            <h1 style="font-size: 2.5rem" class="display-5 fw-bolder">${product.getNameProduct()}</h1>
                            <div class="fs-5 mb-5">
                                <span><fmt:formatNumber value="${product.getPrice()}"/> VND</span>
                            </div>
                            <p class="lead">${product.getDescription()}</p>
                            <div class="d-flex">
                                <div style="font-size: 20px">Số lượng: </div>
                                <input style="margin-left: 10px; width: 40px" type="number" name="quantity" min="1" max="${product.quantity}" value="1">
                            </div>
                            <button style="margin: 15px 30px" class="btn btn-outline-dark" type="submit"> 
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <!-- Footer-->
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
    </body>
</html>
