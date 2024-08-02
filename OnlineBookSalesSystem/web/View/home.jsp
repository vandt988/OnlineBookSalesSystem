<%-- 
    Document   : home.jsp
    Created on : Mar 10, 2024, 10:27:34 PM
    Author     : Admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Book Store</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/home.css" rel="stylesheet" />
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
                                <c:if test="${sessionScope.account != null}">
                                    <span class="badge bg-danger position-absolute top-0 start-100 translate-middle" >${sessionScope.size}</span>
                                </c:if>
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
        <!-- Header-->
        <c:if test="${requestScope.listTop8 != null}">
            <header class="bg-dark py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-white"> 
                        <h1 class="display-4 fw-bolder">Shop in style</h1>
                        <p class="lead fw-normal text-white-50 mb-0"> A person who won’t read has no advantage over one who can’t read.</p>
                        <p class="lead fw-normal text-white-50 mb-0">  -- Mark Twain --</p>
                    </div>
                </div>
            </header>
        </c:if>
        <!-- Section--> 
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:if test="${requestScope.listTop8 != null}">
                        <c:forEach items="${requestScope.listTop8}" var="p">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="${p.getImage()}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">
                                                <a style="color: black" href="detail?pid=${p.getProductID()}">${p.getNameProduct()}</a>
                                            </h5>
                                            <!-- Product price-->
                                            <span style="color: red; font-size: 1.25rem"><fmt:formatNumber value="${p.getPrice()}"/> VND  </span>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </c:forEach>
                        <div style="float: right">
                            <a href="allproduct">>> Xem tất cả</a>
                        </div>
                    </c:if>


                    <c:if test="${requestScope.listProductByCateID != null}">
                        <h2>${cateName.getName()}</h2>
                        <c:forEach items="${requestScope.listProductByCateID}" var="p">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="${p.getImage()}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"><a style="color: black" href="detail?pid=${p.getProductID()}">${p.getNameProduct()}</a></h5>
                                            <!-- Product price-->
                                            <span style="color: red; font-size: 1.25rem"><fmt:formatNumber value="${p.getPrice()}"/> VND</span> 
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>

                    <c:if test="${listTop8 == null && listProductByCateID == null}">
                        <c:forEach items="${sessionScope.listAllProduct}" var="p">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="${p.getImage()}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"><a style="color: black" href="detail?pid=${p.getProductID()}">${p.getNameProduct()}</a></h5>
                                            <!-- Product price-->
                                            <span style="color: red; font-size: 1.25rem"> <fmt:formatNumber value="${p.getPrice()}"/> VND</span>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

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

