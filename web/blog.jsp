<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.BlogDao"%>
<%@page import="java.util.List"%>
<%@page import="com.app.entities.Blogs"%>
<%@page import="com.app.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JV | E-commerce</title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <!-- <script src="https://kit.fontawesome.com/1e90208b6b.js" crossorigin="anonymous"></script>  -->

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

        <section id="header">
            <a href="index.jsp" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span></a>
            <div>
                <ul id="navbar">
                    <li><a href="index2.jsp">Home</a></li>
                    <li><a href="profile.jsp">Shop</a></li>
                    <li><a href="blog.jsp" class="active">Blog</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                        <%
                            User user = (User) session.getAttribute("currentUser");
                            if (user == null) {
                                response.sendRedirect("login_page.jsp");
                            }
                            String log = (user != null) ? "profile.jsp" : "login_page.jsp";
                        %>
                    <li id="lg-bag"><a href="<%=log%>"><i class="far fa-shopping-bag"></i></a></li>
                            <%
//                                String banner = (user == null) ? "<li><a href='login_page.jsp'><span class='fa fa-user-circle'></span> Login</a></li>" : "<li><a id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='cursor: pointer;'><i class='fa fa-user'> Profile</i></a>  <div class='dropdown-menu' aria-labelledby='navbarDropdown'>     <div class='dropdown-item' href='#!' data-toggle='modal' data-target='#profile-modal'><span class='fa fa-user'></span><b>"+ user.getName()+"</b></div>  <a class='dropdown-item' href='LogoutServlets'><i class='far fa-sign-out'></i> Logout</a></div>  </li>";
                                String profile = (user == null) ? "<li><a href='login_page.jsp'><span class='fa fa-user-circle'></span> Login</a></li>" : "<li><b>" + user.getName() + "</b></li>";

                            %>
                    <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-height: 50px; min-width: 50px; border-color: #1a1a1a;"  alt="User Image"/><%=profile%>
                    <a href="#" id="close"><i class="far fa-times"></i></a>

                </ul>
            </div>
            <div id="mobile">
                <a href="profile.jsp"><i class="far fa-shopping-bag"></i></a>
                <i id="bar" class="fas fa-outdent"></i>

            </div>
        </section>        


        <section id="page-header" class="blog-header" style="  background-image: url(img/banner/b19.jpg);">
            <h2>#readmore</h2>
            <p>Read all case studies about our products!</p>
        </section>



        <section id="blog" >
            <%
                List<Blogs> list = null;

                Integer inc = (Integer) request.getSession().getAttribute("blogg");
                Integer loader = (Integer) request.getSession().getAttribute("loader");
                BlogDao dao = new BlogDao(ConnectionProvider.getConnection());

                if (loader == 0) {
                    list = dao.getBlogs(4);
                    inc=4;

                } else {
                    list = dao.getBlogs(inc);

                }
                SimpleDateFormat dateformat = new SimpleDateFormat("dd/MM/yy");

                for (Blogs blog : list) {
            %>
            <div class="blog-box" id="card-container">
                <div class="blog-img">
                    <img src="Blog_pics/<%= blog.getBlogPic()%>" alt="" srcset="">
                </div>
                <div class="blog-details">
                    <h4><%=blog.getTitle()%></h4>
                    <p><%=blog.getContent()%>...</p>
                    <a href="#">CONTINUE READING</a>
                </div>
                <h1><%=dateformat.format(blog.getDate())%></h1>
            </div>
            <%
                }
            %>
       

        </section>




        <section id="pagination" class="section-p1">
            <a href="ViewBlogPaginationServlet?page=<%=inc%>" id="load-more" >Load more</a>
<!--            <a href="ViewBlogPaginationServlet?page=2">2</a>
            <a href=""><i class="fal fa-long-arrow-alt-right"></i></a>-->

        </section>




        <section id="newsletter" class="section-p1 section-m1">
            <div class="newstext">
                <h4>Sign Up For Newsletters</h4>
                <p>Get E-mail updates about our latest shop and <span>special offers.</span></p>
            </div>
            <div class="form">
                <input type="text" placeholder="Your email address">
                <button class="normal">Sign Up</button>
            </div>
        </section>


        <footer class="section-p1">
            <div class="col">
                <img class="logo" src="img/logo.png" alt="">
                <h4>Contact</h4>
                <p><strong>Address : </strong>562 New C.G. Road, Sola Cross, Chandkheda</p>
                <p><strong>Phone : </strong> +91 9999 345 /(+91) 01 2345 6789</p>
                <p><strong>Hours : </strong>10:00 - 18:00, Mon - Sat</p>
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
                <a href="#">Sign in</a>
                <a href="#">View Cart</a>
                <a href="#">My Wishlist</a>
                <a href="#">Track My Order</a>
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


        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="js/script.js"></script>

    </body>

</html>
