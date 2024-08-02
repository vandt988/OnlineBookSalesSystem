<%-- 
    Document   : login
    Created on : Mar 11, 2024, 11:25:41 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Signup</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/login.css" rel="stylesheet" />
    </head>
    <body>
        <section class="bg-light p-3 p-md-4 p-xl-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-xxl-11">
                        <div class="card border-light-subtle shadow-sm">
                            <div class="row g-0">
                                <div class="col-12 col-md-3"> </div>
                                <div class="col-12 col-md-6 d-flex align-items-center justify-content-center">
                                    <div class="col-12 col-lg-11 col-xl-10">
                                        <div class="card-body p-3 p-md-4 p-xl-5"> 
                                            <div class="col-9">
                                                <a class="btn btn-outline-primary btn-lg" style="font-size: 1rem" href="login"><< Back</a>
                                            </div>
                                            <div class="row">
                                                <div class="d-flex gap-3 flex-column">
                                                    <h1 style="text-align: center; margin-bottom: 30px">Sign Up</h1>
                                                </div>
                                            </div> 
                                            <c:if test="${requestScope.message != null}">
                                                <div class="alert alert-danger" style="text-align:center;font-size: large;" role="alert">
                                                    ${requestScope.message} 
                                                </div>
                                            </c:if>
                                            <form action="signup" method="post">
                                                <div class="row gy-3 overflow-hidden">
                                                    <div class="col-12"> 
                                                        <input style="height: 50px" type="text" class="form-control" name="username" placeholder="Username" required> 
                                                    </div>

                                                    <div class="col-12"> 
                                                        <input style=" height: 50px" type="email" class="form-control" name="email" placeholder="Email" required> 
                                                    </div>

                                                    <div class="col-12"> 
                                                        <input style="height: 50px;" type="text" class="form-control" name="phone" id="phone" pattern="[0-9]{10}" placeholder="Phone" title="Số điện thoại phải gồm 10 chữ số." required> 
                                                    </div>

                                                    <div class="col-12"> 
                                                        <input style=" height: 50px" type="text" class="form-control" name="address" placeholder="Address"> 
                                                    </div>

                                                    <div class="col-12"> 
                                                        <input style=" height: 50px" type="password" class="form-control" name="password" placeholder="Password" required> 
                                                    </div>

                                                    <div class="col-9" style="margin-left: 60px;">
                                                        <div class="d-grid">
                                                            <button class="btn btn-dark btn-lg" type="submit">Sign up now</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
