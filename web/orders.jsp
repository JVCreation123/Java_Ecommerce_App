<%-- 
    Document   : orders
    Created on : 31 Jul, 2023, 10:43:00 PM
    Author     : Dell 3505
--%>

<%@page import="java.util.List"%>
<%@page import="com.app.entities.Order"%>
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.OrderDao"%>
<%@page import="com.app.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("currentUser");
            List<Order> orders = null;
            if (user != null) {

                orders = new OrderDao(ConnectionProvider.getConnection()).userOrder(user.getId());

            } else {

                response.sendRedirect("login_page.jsp");
            }
        %>
        <!--Start of Navbar-->
        <section id="header">
            <a href="#" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span>
                <div>
                    <ul id="navbar">
                        <li><a href="index2.jsp" class="active">Home</a></li>
                        <li><a href="profile.jsp">Shop</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li class="nav-link"><a class="nav-item" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user"></span> <%= user.getName()%></a></li>
                        <a href="#" id="close"><i class="far fa-times"></i></a>
                        <li><a href="profile.jsp"><i class="far fa-sign-out"></i> Back</a></li>
                    </ul>
                </div>
                <div id="mobile">
                    <a href="profile.jsp"><i class="far fa-shopping-bag"></i></a>
                    <i id="bar" class="fas fa-outdent"></i>

                </div>
        </section>        

        <!--End of Navbar-->




        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected Items</h3>
                            <div class="cart-body">
                                <table class="table table-light">
                                    <thead>
                                        <tr>
                                            <th scope="col">Date</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <!--<th scope="col">Buy now</th>-->
                                            <th scope="col">Cancel</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            double dd = 0;
                                            long total = 0;

                                            if (orders != null) {

                                                for (Order o : orders) {%>
                                        <tr>    
                                            <td><%= o.getDate()%></td>
                                            <td><%= o.getPrName()%></td>
                                            <td><%= o.getQuantity()%></td>
                                            <td>₹<%= o.getPrPrice()%></td>
                                            <td><a class="btn btn-sm btn-danger" href="CancelOrderServlet?id=<%= o.getOrderId()%>">Cancel</a></td>
                                        </tr>
                                        <%
                                                    dd = o.getPrPrice();
                                                    total += dd;

                                                }
                                                session.setAttribute("orderinfo", orders);

                                            }

//                                            total = total+dd;
%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Details for Order</h3>

                            <form action="AddressOrder" method="post">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="uemail" required value="<%= user.getEmail()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your Shipping Name</label>
                                    <input type="text" name="uname" value="<%= user.getName()%>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name"required />
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                    <input name="uaddress" value="<%= user.getAddress()%>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Address" required  />
                                </div>
                                <!--                                <select class="form-control">
                                                                    <option>Select Payment type</option>
                                                                </select>                                -->
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your City</label>
                                    <input type="text" name="ucity" class="form-control" required id="name" aria-describedby="emailHelp" placeholder="Enter City">
                                </div>                          
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">PIN code</label>
                                        <input type="text" name="upin" class="form-control" required id="name" aria-describedby="emailHelp" placeholder="Enter PIN">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Mobile no.</label>
                                        <input type="text" name="umob" class="form-control" required id="name" aria-describedby="emailHelp" placeholder="Enter Mobile Number">
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Total Payment:</label>
                                    <input type="text" value="₹<%= total%>" name="pay" class="form-control" required id="payment_field" aria-describedby="emailHelp">
                                </div>  
                                <!-- 16:9 aspect ratio -->
                                <div class="embed-responsive embed-responsive-4by3" style="height: 150px;">
                                    <iframe class="embed-responsive-item"  height="20" width="50" scrolling="auto" src="iframecondition.html" required></iframe>
                                </div>
                                <br>
                                <div class="form-group form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1" required>
                                    <label class="form-check-label" for="exampleCheck1">Read all condition then check me out.</label>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-success" onclick="paymentStart()">Order Now</button>
                                    <a href="profile.jsp" class="btn btn-primary">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        

        <script src="js/script.js" type="text/javascript"></script>
        <script>
                                        var myIframe = document.getElementById('iframe');
                                        myIframe.onload = function () {
                                            myIframe.contentWindow.scrollTo(xcoord, ycoord);
                                        }
        </script>


    </body>
</html>
