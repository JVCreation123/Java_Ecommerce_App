

<%@page import="com.app.entities.Items"%>
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page import="com.app.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />        
    </head>
    <body>

        <!--Start Navbar-->
        <section id="header">
            <a href="#" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span>
                <div>
                    <ul id="navbar">
                        <li><a href="index2.jsp">Home</a></li>
                        <li><a href="profile.jsp">Shop</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li id="lg-bag"><a href="profile.jsp"><i class="far fa-shopping-bag"></i></a></li>
                        <!--<li><a href="login_page.jsp" class="active"><span class="fa fa-user-circle"></span> Login</a></li>-->
                        <a href="#" id="close"><i class="far fa-times"></i></a>

                    </ul>
                </div>
                <div id="mobile">
                    <a href="profile.jsp"><i class="far fa-shopping-bag"></i></a>
                    <i id="bar" class="fas fa-outdent"></i>

                </div>
        </section> 
        <!--end Navbar-->


        <main class="d-flex align-items-center banner-background login-bg" >
            <div class="container">
                <div class="row">
                    <div class="col-md-3 offset-md-3">
                        <div class="card" style="width:40rem;">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p class="text-white ">Login here</p>
                            </div>

                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {

                            %>
                            <div class="alert <%=m.getCssClass()%> alert-dismissible fade show" role="alert">
                                <%= m.getContent()%>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }

                                ItemsDao dao = new ItemsDao(ConnectionProvider.getConnection());
                                int pid = Integer.parseInt(request.getParameter("pid"));
                                session.setAttribute("pid", pid);
                                Items item = (Items) dao.getSingleItem(pid);

                            %>    

                            <div class="card-body">
                                <!--Profile Edit-->
                                <div id="product-edit">
                                    <h3>Please Edit Carefully</h3>
                                    <form action="EditProductServlet" method="post">
                                        <table class="table">
                                            <tr>
                                                <td>Id :</td>
                                                <td><%= item.getPid()%></td>
                                            </tr>
                                            <tr>
                                                <td>Name :</td>
                                                <td><input class="form-control" type="text" name="name" value="<%= item.getPrName()%>" /></td>
                                            </tr>
                                            <tr>
                                                <td>Product Company :</td>
                                                <td><input class="form-control" type="text" name="company" value="<%= item.getPrCompany()%>" /></td>
                                            </tr>
                                            <tr>
                                                <td>Price :</td>
                                                <td><input class="form-control" type="number" name="price" value="<%= item.getPrPrice()%>" /></td>
                                            </tr>

                                            <!--
                                                                                    <tr>
                                                                                        <td>Add Profile pic:</td>
                                                                                        <td><input type="file" name="image" class="form-control" required /></td>
                                                                                    </tr>-->
                                        </table>



                                            <hr>
                                        <div class="container text-center">
                                            <button type="submit" class="btn btn-outline-success">Save</button>
                                        </div>
                                    </form>

                                </div>                
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>




        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="js/script.js" type="text/javascript"></script>
    </body>
</html>
