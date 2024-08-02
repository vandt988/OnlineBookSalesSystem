<%-- 
    Document   : table
    Created on : Mar 13, 2024, 3:02:22 PM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Manager Product</title>
        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="css/admin.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <div id="wrapper">
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <div class="sidebar-brand d-flex align-items-center justify-content-center">
                    <div>
                        <img class="img-responsive" style="width: 50px" src="images/logo.jpg" alt="Book Store" />
                    </div>
                    <div class="sidebar-brand-text mx-3">Admin </div>
                </div>
                <hr class="sidebar-divider my-0">
                <li class="nav-item active">
                    <a class="nav-link" href="product">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Manager Product</span></a>
                </li> 
                <hr class="sidebar-divider">  
                <!-- Nav Item - Charts -->
                <li class="nav-item active">
                    <a class="nav-link" href="order">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Manager Oder</span></a>
                </li>  
                <!-- Nav Item - Tables -->
                <hr class="sidebar-divider">    
                <li class="nav-item active">
                    <a class="nav-link" href="account">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Manager Account</span></a>
                </li> 
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block"> 
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">  
                <div id="content"> 
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"> 
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>

                        <ul class="navbar-nav ml-auto">  
                            <div class="topbar-divider d-none d-sm-block"></div                         
                            <li class="nav-item dropdown no-arrow">
                                <a class="dropdown-item" href="logout" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a> 
                            </li> 
                        </ul> 
                    </nav>  
                    <div class="container-fluid"> 
                        <div class="row">
                            <div class="col-2">
                                <h1 class="h3 mb-2 text-gray-800">Product</h1>
                            </div>
                            <div class="col-8">
                                <c:if test="${requestScope.status != null}">
                                    <div class="alert alert-warning" role="alert">
                                        ${requestScope.status}
                                    </div>
                                </c:if>
                            </div>
                            <div class="col-2"> 
                                <button style="color: #0a53be" class="edit-link" data-toggle="modal" data-target="#addModal">Add new product</button> 
                            </div>
                        </div>
                        <div class="card shadow mb-4"> 
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Image</th>
                                                <th>Quantity</th>
                                                <th>
                                                    <div style="overflow: hidden; height: 20px">Description</div>
                                                </th>
                                                <th>Category</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead> 
                                        <c:forEach items="${sessionScope.listAllProduct}" var="p">
                                            <tbody >   
                                                <tr>
                                                    <td>${p.getProductID()}</td>
                                                    <td>${p.getNameProduct()}</td>
                                                    <td><fmt:formatNumber value="${p.getPrice()}"/></td>
                                                    <td>${p.getImage()}</td>
                                                    <td>${p.getQuantity()}</td>
                                                    <td> 
                                                        <div style="overflow: auto; height: 100px">${p.getDescription()}</div>
                                                    </td>
                                                    <td>${p.getCategory().getName()}</td>
                                                    <td><a href="#" class="edit-link" data-toggle="modal" data-target="#edit${p.getProductID()}" data-account-id="${p.getProductID()}">Edit</a></td>
                                                    <td><a href="#" class="edit-link" data-toggle="modal" data-target="#delete${p.getProductID()}">Delete</a></td>
                                                </tr>
                                            </tbody>
                                            <div class="modal fade" id="edit${p.getProductID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                                 aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <form action="edit?eid=${p.getProductID()}" method="post">
                                                        <div class="modal-content">
                                                            <h2 style="text-align: center; margin-top: 10px; color: black">Edit Product</h2> 
                                                            <div class="col-12"> 
                                                                <input style="height: 50px; margin: 7px 0" type="text" class="form-control" name="name" value="${p.getNameProduct()}"> 
                                                            </div> 
                                                            <div class="col-12"> 
                                                                <input style=" height: 50px; margin: 7px 0" type="number   " class="form-control" name="price" value="${p.getPrice()}"> 
                                                            </div> 
                                                            <div class="col-12"> 
                                                                <input style=" height: 50px; margin: 7px 0" type="text" class="form-control" name="image" value="${p.getImage()}"> 
                                                            </div> 
                                                            <div class="col-12"> 
                                                                <input style=" height: 50px; margin: 7px 0" type="number" class="form-control" name="quantity" value="${p.getQuantity()}"> 
                                                            </div> 
                                                            <div class="col-12"> 
                                                                <select name = "category" style="height: 50px; margin: 7px 0; width: 475px; border-radius: 5px; color: gray"> 
                                                                    <c:forEach items="${sessionScope.listCategory}" var="c">
                                                                        <option value="${c.getID()}" ${p.getCategory().getID() == c.getID() ? "selected":""}>${c.getName()}</option> 
                                                                    </c:forEach> 
                                                                </select><br> 
                                                            </div> 
                                                            <div class="col-12"> 
                                                                <textarea style="margin: 7px 0 15px 0" rows="4" cols="50" class="form-control" name="des">${p.getDescription()}</textarea>
                                                            </div> 
                                                            <div class="modal-footer">
                                                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                                <button class="btn btn-primary" type="submit">Save</button>
                                                            </div> 
                                                        </div>
                                                    </form>
                                                </div> 
                                            </div>       

                                            <div class="modal fade" id="delete${p.getProductID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <form action="delete?did=${p.getProductID()}" method="post">  
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Ready to Delete?</h5>
                                                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">Select "Delete" below if you're sure to delete this product.</div>
                                                            <div class="modal-footer">
                                                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                                <button class="btn btn-primary" type="submit">Delete</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>       
                                            </div>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div> 
                    </div>  
                </div>  
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Địa chỉ: Khu CNC Hòa Lạc, Thạch Hòa, Thạch Thất, Hà Nội</span><br> <br>
                            <span>Tel: 028.73008182 - Fax: 028.39733234 - Email: hotro@book.com</span>
                        </div>
                    </div>
                </footer> 
            </div> 
        </div>  

        <!-- Add product Modal -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form action="add" method="post">
                    <div class="modal-content">
                        <h2 style="text-align: center; margin-top: 10px; color: black">Add Product</h2> 
                        <div class="col-12"> 
                            <input style="height: 50px; margin: 7px 0" type="text" class="form-control" name="name" placeholder="Name" required> 
                        </div> 
                        <div class="col-12"> 
                            <input style=" height: 50px; margin: 7px 0" type="number" class="form-control" name="price" placeholder="Price" required> 
                        </div> 
                        <div class="col-12"> 
                            <input style=" height: 50px; margin: 7px 0" type="text" class="form-control" name="image" placeholder="Image" required> 
                        </div> 
                        <div class="col-12"> 
                            <input style=" height: 50px; margin: 7px 0" type="number" class="form-control" name="quantity" placeholder="Quantity" required> 
                        </div> 
                        <div class="col-12"> 
                            <select name = "category" style="height: 50px; margin: 7px 0; width: 475px; border-radius: 5px; color: gray"> 
                                <c:forEach items="${sessionScope.listCategory}" var="c">
                                    <option value="${c.getID()}">${c.getName()}</option> 
                                </c:forEach> 
                            </select>
                        </div> 
                        <div class="col-12"> 
                            <textarea style="margin: 7px 0 15px 0" rows="4" cols="50" class="form-control" name="des" placeholder="Description"></textarea>         
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <button class="btn btn-primary" type="submit">Add</button>
                        </div> 
                    </div>
                </form>
            </div> 
        </div>  

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="home">Logout</a>
                    </div>
                </div>
            </div>
        </div> 

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script> 
        <script src="js/scripts.js"></script> 
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>  
    </body>

</html>