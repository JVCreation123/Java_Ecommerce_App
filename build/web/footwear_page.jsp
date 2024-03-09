
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page import="java.util.List"%>
<%@page import="com.app.entities.Items"%>
<%@page import="com.app.entities.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.app.entities.Items"%>
<%@page import="java.util.Locale.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page import="com.app.entities.Message"%>
<%@page import="com.app.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@include file="common_model.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--<link rel="stylesheet" href="css/style.css">-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>

        </style>
    </head>
    <body>



        <section id="header">
            <a href="#" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span>
                <div>
                    <ul id="navbar">
                        <li><a href="index2.jsp">Home</a></li>
                        <li><a href="profile.jsp" class="active">Shop</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">Contact</a></li>

                        <li id="lg-bag"><a href="checkout.jsp"><i class="fa fa-cart-plus cart"></i><span class="badge badge-primary" style="font-size: 15px;">${ ((cart_list.size()>0)?cart_list.size():0) } </span></a></li>
                        <!--<span id="cart-items" style="color: black;"></span>-->
                        <li><a id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer;"><i class="fa fa-user-circle"> Profile</i></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user"></span> <%= user.getName()%></a>
                                <a class="dropdown-item" href="LogoutServlets"><i class="far fa-sign-out"></i> Logout</a>
                            </div>
                        </li>
                        <a href="#" id="close"><i class="far fa-times"></i></a>
                    </ul>
                </div>
                <div id="mobile">
                    <a href="profile.jsp"><i class="far fa-shopping-bag"></i></a>
                    <i id="bar" class="fas fa-outdent"></i>

                </div>
        </section>        





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
        %>


        <!--Start main body part-->


        <section id="hero" style="background-image: url('img/footwearbanner.jpg');">

        </section>




        <div id="item-container">
            <div class="container text-center" id="loader">
                <i class="fa fa-refresh fa-spin fa-4x"></i>
                <h3>loading...</h3>
            </div>
        </div>
        <div class="container-fluid" id="post-container">

        </div>
        <div id="toast"></div>



        <section id="product1" class="section-p1">
            <h2>Featured Products</h2>
            <p>Trending Collection New Morden Design Shoes</p>
            <div class="pro-container">

                <%
                    int itemId = Integer.parseInt(request.getParameter("itemId"));
                    List<Items> items = null;
                    ItemsDao da = new ItemsDao(ConnectionProvider.getConnection());
                    if (itemId
                            == 4) {
                        items = da.getAllItemsById(itemId);
                    }
                    for (Items ii : items) {

                %>
                <div class="pro" >
                    <img src="Items_pic/<%= ii.getPrPic()%>" style="height: 200px; width: 200px; background-size:  cover" alt="">
                    <div class="des">
                        <span><%= ii.getPrCompany()%></span>
                        <h5><%= ii.getPrName()%></h5>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h4><i class="fas fa-rupee-sign"></i> <%= ii.getPrPrice()%></h4>
                    </div>                
                    <a href="AddToCartFootwear?pid=<%=ii.getPid()%>"><button class="btn btn-primary cart-click" style="margin-bottom: 12px;">add to cart</button></a>
                    <a href="OrderNowServlet?pid=<%=ii.getPid()%>&quantity=1"><i class="fal fa-shopping-cart cart"></i></a>

                </div>
                <%
                    }
                %>
            </div>
        </section>



        <section id="product1" class="section-p1">
            <h2>Sandals and Slipers</h2>
            <p>Stylist Sandals & New Morden Design Slippers</p>
            <div class="pro-container">

                <%
                    itemId = 5;
                    if (itemId == 5) {
                        items = da.getAllItemsById(itemId);
                    }
                    for (Items ii : items) {

                %>
                <div class="pro" >
                    <img src="Items_pic/<%= ii.getPrPic()%>" style="height: 200px; width: 200px; background-size:  cover" alt="">
                    <div class="des">
                        <span><%= ii.getPrCompany()%></span>
                        <h5><%= ii.getPrName()%></h5>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h4><i class="fas fa-rupee-sign"></i> <%= ii.getPrPrice()%></h4>
                    </div>                
                    <a href="AddToCartFootwear?pid=<%=ii.getPid()%>"><button class="btn btn-primary cart-click" style="margin-bottom: 12px;">add to cart</button></a>
                    <a href="OrderNowServlet?pid=<%=ii.getPid()%>&quantity=1"><i class="fal fa-shopping-cart cart"></i></a>

                </div>
                <%
                    }
                %>
            </div>
        </section>




        <!--End Main body part--> 








        <!--start of profile model-->

        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-center text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-height: 200px; min-width: 150px;" alt="User Image"/>
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--Details-->

                            <div id="profile-detail">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">Id :</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Address :</th>
                                            <td><%= user.getAddress()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Registered On : </th>
                                            <td><%= user.getDate().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>

                            </div>


                            <!--Profile Edit-->
                            <div id="profile-edit" style="display: none;">
                                <h3>Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Id :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input class="form-control" type="text" name="user_name" value="<%= user.getName()%>" /></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input class="form-control" type="email" name="user_email" value="<%= user.getEmail()%>" /></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input class="form-control" type="password" name="user_password" value="<%= user.getPassword()%>" /></td>
                                        </tr>
                                        <tr>
                                            <td>Address :</td>
                                            <td><input class="form-control" type="text" name="user_address" value="<%= user.getAddress()%>" /></td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>

                                        <tr>
                                            <td>Add Profile pic:</td>
                                            <td><input type="file" name="image" class="form-control" required /></td>
                                        </tr>
                                    </table>




                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-success">Save</button>
                                    </div>
                                </form>

                            </div>                


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button"  class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>




        <!--end of profile model-->

        <section id="newsletter" class="section-p1 section-m1" style="  background-image: url('img/banner/b14.png');">
            <div class="newstext">
                <h4>Sign Up For Newsletters</h4>
                <p>Get E-mail updates about our latest shop and <span>special offers.</span></p>
            </div>
            <div class="form">
                <input type="text" placeholder="Your email address">
                <a href="login_page.jsp"><button class="normal">Sign Up</button></a>
            </div>
        </section>



        <footer class="section-p1">
            <div class="col">
                <span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span>
                <h4>Contact</h4>
                <p><strong>Address : </strong>562 New C.G. Road, Sola Cross, Chandkheda</p>
                <p><strong>Phone : </strong> +91 9999 345 /(+91) 01 2345 6789</p>
                <p><strong>Hours : </strong>10:00 - 18:00, Mon -  Sat</p>
                <div class="follow">
                    <h4>Follow Us</h4>
                    <div class="icon">
                        <i class="fab fa-facebook-f"></i>
                        <i class="fab fa-twitter"></i>
                        <i class="fab fa-instagram"></i>
                        <i class="fab fa-pinterest-p"></i>
                        <i class="fab fa-youtube"></i>
                    </div>
                </div>
            </div>

            <div class="col">
                <h4>About</h4>
                <a href="#">About Us</a>
                <a href="#">Delivery Information</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms & Conditions</a>
                <a href="#">Contact Us</a>
            </div>

            <div class="col">
                <h4>My Account</h4>
                <a href="signup_page.jsp">Sign in</a>
                <a href="login_page.jsp">View Cart</a>
                <a href="login_page.jsp">My Wishlist</a>
                <a href="login_page.jsp">Track My Order</a>
                <a href="#">Help</a>
            </div>

            <div class="col install">
                <h4>Install App</h4>
                <p>From App Store or Google Play</p>
                <div class="row">
                    <img src="img/pay/app.jpg" alt="">
                    <img src="img/pay/play.jpg" alt="">
                </div>
                <p>Secure Payment Gateway</p>
                <img src="img/pay/pay.png" alt="">

            </div>

            <div class="copyright">
                <p>&copy; 2021, Tecj2 etc - HTML CSS Ecommerce Template</p>
            </div>      
        </footer>














        <script src="js/script.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false;

                $('#edit-profile-button').click(function () {
                    if (editStatus === false)
                    {
                        $('#profile-detail').hide();
                        $('#profile-edit').show();
                        editStatus = true;

                        $(this).text("Back");
                    } else {
                        $('#profile-detail').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });

            });
        </script>



        <script>

            $(document).ready(function (e) {
                $.ajax({
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                    }
                });
            });
        </script>



        <script>

            function getPosts(cid, temp)
            {
                $("#loader").show();
                $("#post-container").hide();

                $(".c-link").removeClass('active');



                $.ajax({
                    url: 'load_posts.jsp',
                    data: {catId: cid},
                    success: function (data, textStatus, jqXHR) {


                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                });
            }
            $(document).ready(function (e) {
                let allPostRef = $(".c-link")[0];
                getPosts(0, allPostRef);

            });

        </script>



    </body>
</html>
