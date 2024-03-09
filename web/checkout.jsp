
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.entities.Cart"%>
<%@page import="com.app.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <style type="text/css">
            .table tbody td{
                vertical-align: middle;
            }
            .btn-incr, .btn-decr{
                box-shadow: none;
                font-size: 25px;
            }
        </style>
    </head>
    <body>



        <%
            User user = (User) session.getAttribute("currentUser");
            if (user == null) {
                response.sendRedirect("login_page.jsp");
            }
        %>


        <%
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
            List<Cart> cartProduct = null;
            if (cart_list != null) {
                ItemsDao idao = new ItemsDao(ConnectionProvider.getConnection());
                cartProduct = idao.getCartProducts(cart_list);
                double total = idao.getTotalCartPrice(cart_list);
                request.setAttribute("cart_list", cart_list);
                request.setAttribute("total", total);

            }

        %>
        <!--Start of navbar-->
        <section id="header">
            <a href="#" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span>
            
                <ul id="navbar">
                    <li><a href="index.jsp" class="active">Home</a></li>
                    <li><a href="profile.jsp">Shop</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li class="nav-link"><a class="nav-item" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user"></span> <%= user.getName()%></a></li>
                    <a href="#" id="close"><i class="far fa-times"></i></a>
                    <li><a href="profile.jsp"><i class="far fa-sign-out"></i> Back</a></li>
                </ul>
            <div id="mobile">
                <a href="profile.jsp"><i class="far fa-shopping-bag"></i></a>
                <i id="bar" class="fas fa-outdent"></i>

            </div>
        </section>        

        <!--End of navbar-->



        <!--Start of body-->

        <div class="container">
            <div class="d-flex py-3">
                <h3>Total Price: ₹ ${ (total>0)?total:0 }</h3> 
                <a class="mx-3 btn btn-primary" href="CheckoutServlet">Check out</a>
            </div>

            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Buy now</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        if (cart_list != null) {
                            for (Cart c : cartProduct) {


                    %>


                    <tr>
                        <td><%= c.getPrName()%></td>
                        <td>₹<%= c.getPrPrice()%></td>
                        <td>
                            <form action="OrderNowServlet" method="post" class="form-inline">
                                <input type="hidden" name="pid" value="<%= c.getPid()%>" class="form-input">
                                <div class="form-group d-flex justify-content-between w-50">
                                    <a class="btn btn-sm btn-decr" href="QuantityIncDecServlet?action=dec&pid=<%= c.getPid()%>"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control w-50 text-center" value="<%= c.getQuantity()%>" readonly> 
                                    <a class="btn btn-sm btn-incr" href="QuantityIncDecServlet?action=inc&pid=<%= c.getPid()%>"><i class="fas fa-plus-square"></i></a>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                            </form>

                        </td>
                        <td><a class="btn btn-danger text-white" href="RemoveFromCartServlet?pid=<%= c.getPid()%>">Remove</a></td>
                    </tr>
                    <%}
                            }%>

                </tbody>

            </table>
        </div>
    </div>

    <!--End of Body-->



    <script src="js/script.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
        function add_to_cart(pid, pname, pprice) {

            let cart = localStorage.getItem("cart");

            if (cart == null) {

                let products = [];
                let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice};
                products.push(product);
                localStorage.setItem("cart", JSON.stringify(products));
                showToast(products.productName + " is added to cart.")
            } else {

                let pcart = JSON.parse(cart);
                let oldProduct = pcart.find((item) => item.productId == pid)
                if (oldProduct) {

                    oldProduct.productQuantity = oldProduct.productQuantity + 1
                    pcart.map((item) => {
                        if (item.productId == oldProduct.productId) {
                            item.productQuantity = oldProduct.productQuantity;
                        }
                    });
                    localStorage.setItem("cart", JSON.stringify(pcart));
                    //                        console.log("Product quantity increased")
                    showToast(oldProduct.productName + " quantity is increased")


                } else {
                    //we have add product
                    let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice};
                    pcart.push(product)
                    localStorage.setItem("cart", JSON.stringify(pcart));
                    showToast(product.productName + " is added to cart.")

                }
            }
        }




    </script>

    <script>
        function updateCart() {
            let cartString = localStorage.getItem("cart");
            let cart = JSON.parse(cartString);
            if (cart == null || cart.length == 0) {
                console.log("cart is empty")
                $("#cart-items").html("(0)");
                $(".cart-body").html("<h3>Cart does not have any items.</h3>");
                $(".checkout-btn").attr('disabled', true);

            } else {
                console.log(cart)
                let cs = cart.length;
                $("#cart-items").html(`(` + cs + `)`);
                let table = `
                <table class='table'>
                <thead class='thread-light'>
                <tr>
                <th>Item name </th>
                <th>Price </th>
                <th>Quantity </th>
                <th>Total Price </th>
                <th>Action </th>
                </tr>
        
                </thead>

                `;

                let totalPrice = 0;

                cart.map((item) => {

                    let price = item.productPrice;
                    table +=
                            `<tr>
                        <td>` + item.productName + `</td>
                        <td>` + price + `</td>
                        <td>` + item.productQuantity + `</td>
                        <td>` + (item.productQuantity * price) + `</td>
                        <td>` + "<button onclick='deleteItem(" + item.productId + ")' class='btn btn-danger'>Remove</button>" + `</td>
                    </tr>`

                    totalPrice += item.productPrice * item.productQuantity;

                })
                let pr = totalPrice;
                table = table + `
                <tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ` + totalPrice + ` </td></tr>
                </table>`;
                $(".cart-body").html(table);
                $(".checkout-btn").attr('disabled', false);




            }
        }
    </script>    

    <script>
        $(document).ready(function () {

            updateCart()
        });
    </script>
    <script>
        function deleteItem(pid) {
            let cart = JSON.parse(localStorage.getItem("cart"));
            let newcart = cart.filter((item) => item.productId != pid);
            localStorage.setItem("cart", JSON.stringify(newcart))
            updateCart();
            showToast("Product is removed from cart.")

        }
    </script>
</body>
</html>
