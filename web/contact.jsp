<%-- 
    Document   : about
    Created on : 22 Nov, 2023, 4:22:13 PM
    Author     : Dell 3505
--%>

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
    </head>

    <body>

        <section id="header">
            <a href="index.jsp" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span></a>

            <div>
                <ul id="navbar">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="profile.jsp">Shop</a></li>
                    <li><a href="blog.jsp" >Blog</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp" class="active">Contact</a></li>
                    <li id="lg-bag"><a href="profile.jsp"><i class="far fa-shopping-bag"></i></a></li>
                    <a href="#" id="close"><i class="far fa-times"></i></a>

                </ul>
            </div>
            <div id="mobile">
                <a href="profile.jsp"><i class="far fa-shopping-bag"></i></a>
                <i id="bar" class="fas fa-outdent"></i>

            </div>
        </section>


        <section id="page-header" class="about-header" style="background-image: url(img/about/banner.png);">
            <h2>#let's_talk</h2>
            <p>LEAVE A MESSAGE, We love to hear you!</p>
        </section>


        <section id="contact-details" class="section-p1">
            <div class="details">
                <span>GET IN TOUCH</span>
                <h2>Visit one of our agency location or contact us Today.</h2>
                <h3>Head Office</h3>
                <div>
                    <li>
                        <i class="fal fa-map"></i>
                        <p>562 New C.G. Road, Sola Cross, Chandkheda</p>
                    </li>
                    <li>
                        <i class="far fa-envelope"></i>
                        <p>jvcreation123@gmail.com</p>
                    </li>
                    <li>
                        <i class="fas fa-phone-alt"></i>
                        <p>contact@gmail.com</p>
                    </li>
                    <li>
                        <i class="far fa-clock"></i>
                        <p>Monday to Saturday: 9:00am to 16:00pm</p>
                    </li>
                </div>
            </div>


            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3669.499395250199!2d72.57987987505477!3d23.115414512857683!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e824dd4bde447%3A0xa4f7bdadcce2ff4e!2z4Kqw4KuC4Kqm4KuN4Kqw4Kq-4KqV4KuN4Kq3IOCqleCri-CqruCrjeCqquCrjeCqsuCrh-CqleCrjeCquA!5e0!3m2!1sgu!2sin!4v1701248946048!5m2!1sgu!2sin"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>

        </section>


        <section id="form-details">
            <form class="contact-form" method="post" onsubmit="SendEmail();reset(); return false;">
                <span>LEAVE A MESSAGE</span>
                <h2>We love to hear from you</h2>
                <input type="text" name="name" required placeholder="Your Name">
                <input type="text" name="email" required placeholder="Your Email">
                <input type="text" name="subject" required placeholder="Your Subject">
                <textarea name="msg" required id="" cols="30" rows="10" placeholder="Your Message"></textarea>
                <button type="submit" class="normal">Submit</button>
            </form>


            <div class="people">
                <div>
                    <img src="img/people/1.png" alt="">
                    <p><span>John doe</span> Senior Marketing Manager <br> Phone: +9097876897 <br>Email: contact@gmail.com
                    </p>
                </div>
                <div>
                    <img src="img/people/2.png" alt="">
                    <p><span>John doe</span> Senior Marketing Manager <br> Phone: +9097876897 <br>Email: contact@gmail.com</p>
                </div>
                <div>
                    <img src="img/people/3.png" alt="">
                    <p><span>John doe</span> Senior Marketing Manager <br> Phone: +9097876897 <br>Email: contact@gmail.com</p>
                </div>
            </div>
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


        

        <script src="script.js"></script>
    </body>
</html>
