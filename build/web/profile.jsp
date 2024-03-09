<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.app.entities.Order"%>
<%@page import="com.app.dao.OrderDao"%>
<%@page import="com.app.entities.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.app.entities.Items"%>
<%@page import="java.util.Locale.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page import="com.app.entities.Message"%>
<%@page import="com.app.entities.User"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a href="index.jsp" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span></a>
            <div>
                <ul id="navbar">
                    <li><a href="index2.jsp" >Home</a></li>
                    <li><a href="profile.jsp" class="active">Shop</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>

                    <li id="lg-bag"><a href="checkout.jsp"><i class="fa fa-cart-plus cart"></i><span class="badge badge-primary" style="font-size: 15px;">${ ((cart_list.size()>0)?cart_list.size():0) } </span></a></li>
                    <!--<span id="cart-items" style="color: black;"></span>-->
                    <li><a id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer;"><img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-height: 50px; min-width: 50px; border-color: #1a1a1a;"  alt="User Image"/> Profile</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user"></span> <%= user.getName()%></a>
                            <a class="dropdown-item" href="LogoutServlets"><i class="far fa-sign-out"></i> Logout</a>
                            <a class="dropdown-item" data-toggle="modal" data-target="#ordersModal" style="cursor: pointer;"><i class="fas fa-shopping-bag"></i> Orders History</a>
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


        <section id="page-header11">
            <div id="carouselExampleIndicators" class="carousel slide " data-ride="carousel">
                <ol class="carousel-indicators mt-0">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>                
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="img/amz_banner.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="img/amz_banner2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="img/amz_banner3.jpg" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="img/amz_banner4.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>

        <section id="feature" class="section-p1 ">
            <div class="fe-box">
                <a href="#"><img src="img/menselect.png" alt="">
                    <h6>Men's Cloth</h6></a>
            </div>
            <div class="fe-box">
                <a href="#"><img src="img/womenselect.png" alt="">
                    <h6>Women's Cloth</h6></a>
            </div>
            <div class="fe-box">
                <a href="footwear_page.jsp?itemId=4"><img src="img/footwear.png" alt="">
                    <h6>Footwear</h6></a>
            </div>
            <div class="fe-box">
                <a href="watches_page.jsp?catId=6"><img src="img/watches.png" alt="">
                    <h6>Watches</h6></a>
            </div>
            <div class="fe-box">
                <img src="img/features/f5.png" alt="">
                <h6>Happy Sell</h6>
            </div>
            <div class="fe-box">
                <img src="img/features/f6.png" alt="">
                <h6>24/7 Support</h6>
            </div>
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







        <!--End Main body part--> 






        <!--Start of orders history modal-->
        <%
            OrderDao odd=new OrderDao(ConnectionProvider.getConnection());
            List<Order> orders = odd.OrdersHistory(user.getId());
            SimpleDateFormat formatdate=new SimpleDateFormat("yyyy-MM-dd");
        %>
        
        <div class="modal fade" id="ordersModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Orders History</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Order Id</th>                                        
                                    <th scope="col">Product Image</th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Date</th>
                                </tr>
                            </thead>
                            <%
                                for (Order i : orders) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%=i.getOrderId()%></td>
                                    <td><img  style="height: 100px; width: 100px;" src="Items_pic/<%= i.getPrPic()%>" alt=""></td>
                                    <td><%=i.getPrName()%></td>
                                    <td><%=i.getQuantity()%></td>
                                    <td><%=i.getPrPrice()%></td>
                                    <td><%= i.getDate() %></td>
                                </tr>
                            </tbody>
                            <%
                                }

                            %>

                        </table>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        
                    </div>
                </div>
            </div>
        </div>
        
        <!--End of orders history modal-->



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
                    url: "load_items.jsp",
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $('#item-container').html(data)
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
