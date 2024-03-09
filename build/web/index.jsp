
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.entities.Items"%>
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page errorPage="error_page.jsp" %>
<!--dark blue = #1A2238 purple = #9DAAF2  orange = #FF6A3D yellow = #F4DB7D-->
<%@include file="navbar.jsp" %>
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

        <link rel="stylesheet" href="css/style.css">

    </head>

    <body>


        <section id="hero" style="background-image: url('img/mainbanner.png');">
            <!--            <h4>Trade-in-offer</h4>
                        <h2>Super value deals</h2>
                        <h1>On all products</h1>
                        <p>Save more with coupons & upto 70% off!</p>-->
            <button  style="background-image: url('img/button.png'); margin-top: 280px;"> <a href="signup_page.jsp" style="color: #E3E6F3;">Signup</a></button>
        </section> 

        <section id="feature" class="section-p1 ">
            <div class="fe-box">
                <img src="img/features/f1.png" alt="">
                <h6>Free Shipping</h6>
            </div>
            <div class="fe-box">
                <img src="img/features/f2.png" alt="">
                <h6>Online Order</h6>
            </div>
            <div class="fe-box">
                <img src="img/features/f3.png" alt="">
                <h6>Save Money</h6>
            </div>
            <div class="fe-box">
                <img src="img/features/f4.png" alt="">
                <h6>Promotions</h6>
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
        

        <section id="product1" class="section-p1">
            <h2>Featured Products</h2>
            <p>Summer Collection New Morden Design</p>
            <div class="pro-container">
                <%  
                    int var=0;
                    request.getSession().setAttribute("loader", var);
                    List<Items> item = null;
                    ItemsDao dao = new ItemsDao(ConnectionProvider.getConnection());
                    int ids = 1;
                    if (ids == 1) {
                        item = dao.getAllItemsById(ids);
                    }
                    for (Items i : item) {
                %>
                <div class="pro">
                    <img src="Items_pic/<%= i.getPrPic()%>" alt="">
                    <div class="des">
                        <span><%= i.getPrCompany()%></span>
                        <h5><%= i.getPrName()%></h5>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h4><i class="fas fa-rupee-sign"></i> <%= i.getPrPrice()%></h4>
                    </div>

                    <a href="login_page.jsp"><i class="fal fa-shopping-cart cart"></i></a>
                </div>
                <%
                    }
                %>
            </div>
        </section>


        <section id="banner" style="  background-image: url('img/banner/b2.jpg');" class="section-m1">
            <h4>Repair Services</h4>
            <h2>Up to <span>70% off</span> - All t-shirts & Accessories</h2>
            <a href="login_page.jsp"><button class="normal">Explore More</button></a>
        </section>



        <section id="product1" class="section-p1">
            <h2>New Arrivals</h2>
            <p>Summer Collection New Morden Design</p>
            <div class="pro-container">
                <%
                    ItemsDao da = new ItemsDao(ConnectionProvider.getConnection());
                    int cid = 4;
                    List<Items> item2 = da.getAllItemsById(cid);
                    for (Items i2 : item2) {

                %>
                <div class="pro">
                    <img src="Items_pic/<%= i2.getPrPic()%>" style="height: 200px; width: 200px; background-size:  cover" alt="">
                    <div class="des">
                        <span><%= i2.getPrCompany()%></span>
                        <h5><%= i2.getPrName()%></h5>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h4><i class="fas fa-rupee-sign"></i> <%= i2.getPrPrice()%></h4>
                    </div>
                    <a href="login_page.jsp"><i class="fal fa-shopping-cart cart"></i></a>
                </div>
                <%
                    }
                %>
            </div>
        </section>

        <section id="sm-banner" class="section-p1">
            <div class="banner-box" style="background-image: url('img/banner/b17.jpg'); min-width: 580px;">
                <h4>crazy deals</h4>
                <h2>buy 1 get 1 free</h2>
                <span>The best classic dress is on sele at cara</span>
                <a href="login_page.jsp"><button class="white">Learn More</button></a>
            </div>
            <div class="banner-box banner-box2" style="  background-image: url('img/banner/b10.jpg'); min-width: 580px;">
                <h4>Spring/summer</h4>
                <h2>upcomming season</h2>
                <span>The best classic dress is on sele at cara</span>
                <a href="login_page.jsp"><button class="white">Collection</button></a>
            </div>

        </section>


        <section id="banner3">
            <div class="banner-box " style="  background-image: url('img/banner/b7.jpg');">
                <h2>SEASONAL SALE</h2>
                <h3>Winter Collection -50% Off</h3>
            </div>
            <div class="banner-box banner-box2" style="  background-image: url('img/banner/b4.jpg');">
                <h2>NEW FOOTWEAR COLLECTION</h2>
                <h3>Spring / Summer 2023</h3>
            </div>
            <div class="banner-box banner-box3" style="  background-image: url('img/banner/b18.jpg');">
                <h2>T-SHIRTS</h2>
                <h3>New Trendy Prints</h3>
            </div>
        </section>


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
            <%
//                String cart = (user != null) ? "checkout.jsp" : "login_page.jsp";
            %>
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
    </body>

</html>