
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.app.entities.OrderData"%>
<%@page import="com.app.entities.Order"%>
<%@page import="com.app.dao.OrderDao"%>
<%@page import="com.app.dao.BlogDao"%>
<%@page import="java.util.List"%>
<%@page import="com.app.dao.UserDao"%>
<%@page import="com.app.entities.Categories"%>
<%@page import="com.app.entities.Items"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page import="com.app.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user.getUsertype().equalsIgnoreCase("normal")) {
        response.sendRedirect("login_page.jsp");
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
        <link rel="stylesheet" href="css/style.css">
        <style>
            body{
                background-image: url("img/admin_bg.jpg");
                background-size: cover;
            }
        </style>
    </head>
    <body>



        <%
            ItemsDao da = new ItemsDao(ConnectionProvider.getConnection());
            ArrayList<Categories> cats = da.getAllCategories();


        %>
        <section id="header">
            <a href="#" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span>
                <div>
                    <ul id="navbar">
                        <li><a href="index.jsp" class="active">Home</a></li>
                        <li><a href="profile.jsp">Shop</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li id="lg-bag"><a href="cart.html"><i class="far fa-shopping-bag"></i></a></li>
                        <li class="nav-link"><a class="nav-item" href="#!" data-toggle="modal" data-target="#profile-modal"><img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-height: 50px; min-width: 50px; border-color: #1a1a1a;"  alt="User Image"/> Admin</a></li>
                        <a href="#" id="close"><i class="far fa-times"></i></a>
                        <li><a href="LogoutServlets"><i class="far fa-sign-out"></i> Logout</a></li>
                    </ul>
                </div>
                <div id="mobile">
                    <a href="profile.jsp"><i class="far fa-shopping-bag"></i></a>
                    <i id="bar" class="fas fa-outdent"></i>

                </div>
        </section>        







        <!--start main body-->

        <!--Start Items Model-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-3 ">

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        <div class="card-body fa-4x" data-toggle="model" data-target="#add-items">
                            <i class="fa fa-plus"></i>
                            <h3>Add Items</h3>
                        </div>
                    </button>
                </div>



                <div class="col-3 text-center">

                    <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">-->
                    <div class="card-body fa-4x bg-danger text-white" data-toggle="model" data-target="#add-items">
                        <i class="fa fa-align-justify"></i><%= cats.size()%> 
                        <h3>Categories</h3>
                    </div>

                </div>

                <div class="col-3 text-center">
                    <%
//                        User user2 = (User) session.getAttribute("currentUser");
                        UserDao ddd = new UserDao(ConnectionProvider.getConnection());
                        int count = ddd.getUserscount();
                        List<User> users = ddd.getAllUsers();
                    %>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#UsersDataModal">
                    <div class="card-body fa-4x text-white" data-toggle="model" data-target="#add-items">
                        <i class="fa fa-users"></i><%= count%> 
                        <h3>Users</h3>
                    </div>
                </div>


                <div class="col-3 text-center">
                    <%
                        List<Items> item = null;
                        ItemsDao ddao = new ItemsDao(ConnectionProvider.getConnection());
                        int itemcount = ddao.getProductscount();
                        item = ddao.getAllItems();
                    %>

                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#itemsModal">
                        <div class="card-body fa-4x  text-white">
                            <svg  xmlns="http://www.w3.org/2000/svg"  height="1em" viewBox="0 0 512 512"><path d="M326.3 218.8c0 20.5-16.7 37.2-37.2 37.2h-70.3v-74.4h70.3c20.5 0 37.2 16.7 37.2 37.2zM504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-128.1-37.2c0-47.9-38.9-86.8-86.8-86.8H169.2v248h49.6v-74.4h70.3c47.9 0 86.8-38.9 86.8-86.8z"/></svg><%= itemcount%> 
                            <h3>Products</h3>
                        </div>
                    </button>
                </div>


                <div class="col-3 mt-5">

                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addblogModal">
                        <div class="card-body fa-4x" data-toggle="model" data-target="#add-items">
                            <i class="fa fa-plus"></i>
                            <h3>Add Blogs</h3>
                        </div>
                    </button>
                </div>



                <div class="col-3 mt-5 text-center">
                    <%
                        BlogDao dao = new BlogDao(ConnectionProvider.getConnection());
                        int blogs = dao.BlogCount();

                    %>
                    <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">-->
                    <div class="card-body fa-4x text-white" style="background-color: darkblue;" data-toggle="model" data-target="#add-items">
                        <i class="fa fa-solid fa-book"></i> <%= blogs%> 
                        <h3>Blogs</h3>
                    </div>
                </div>



                <div class="col-3 mt-5">
                    <%
                        OrderDao dd = new OrderDao(ConnectionProvider.getConnection());
                        List<OrderData> orders = dd.getAllOrders();
                        SimpleDateFormat formatdate = new SimpleDateFormat("dd/MM/yyyy");

                    %>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#Orders">
                        <div class="card-body fa-4x" data-toggle="model" data-target="#Orders">
                            <i class="fa fa-shopping-cart"></i><%= orders.size()%>
                            <h3>All  Orders</h3>
                        </div>
                    </button>
                </div>

            </div>




            <!-- Button trigger modal -->


            <!--Start UserData Model-->


            <div class="modal fade" id="UsersDataModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content ">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Users</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">User Id</th>                                        
                                        <th scope="col">User Image</th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">User Email</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Register Date</th>
<!--                                        <th scope="col">Delete</th>-->
                                    </tr>
                                </thead>
                                <%                                for (User u: users) {
                                %>
                                <tbody>
                                    <tr>
                                        <td><%=u.getId()%></td>
                                        <td><img  style="height: 100px; width: 100px; border-radius:  50%;" src="pics/<%= u.getProfile()%>" alt=""></td>
                                        <td><%=u.getName()%></td>
                                        <td><%=u.getEmail()%></td>
                                        <td><%=u.getGender()%></td>
                                        <td><%=formatdate.format(u.getDate())%></td>
                                        
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


            <!--End UsersData Model-->




            <!--Start add blog--> 

            <div class="modal fade" id="addblogModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add Blogs</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form  id="add-blogs" action="BlogServlet" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Blog Title</label>
                                    <input type="text" name="title" required="" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Blog Title">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Blog Content</label>
                                    <input type="text" name="content" required="" class="form-control" id="exampleInputPassword1" placeholder="Enter Blog Content">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select File</label>
                                    <input type="file" name="blogPic" required="" />
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--End add blog--> 











        <!-- Modal -->
        <!-- Button trigger modal -->



        <div class="modal fade" id="itemsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Products</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Category Id</th>                                        
                                    <th scope="col">Product Image</th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Company</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <%                                for (Items i : item) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%=i.getCid()%></td>
                                    <td><img  style="height: 100px; width: 100px;" src="Items_pic/<%= i.getPrPic()%>" alt=""></td>
                                    <td><%=i.getPrName()%></td>
                                    <td><%=i.getPrCompany()%></td>
                                    <td><%=i.getPrPrice()%></td>
                                    <td><a class="btn btn-danger text-white" href="edit_product.jsp?pid=<%= i.getPid()%>">Edit</a></td>
                                    <td><a class="btn btn-danger text-white" href="RemoveItemservlet?pid=<%= i.getPid()%>">Remove</a></td>
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


        <!--Start All Orders Modal-->

        <div class="modal fade" id="Orders" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg " style="width:90vw; margin-left: 225px" role="document">
                <div class="modal-content "  style="width:70vw;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">All Orders</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Order Id</th>  
                                    <th scope="col">User Id</th>
                                    <th scope="col">User Name</th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Mobile</th>
                                    <th scope="col">Pin</th>
                                    <th scope="col">Order Date</th>
                                </tr>
                            </thead>
                            <%                                for (OrderData i : orders) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%=i.getId()%></td>
                                    <td><%=i.getUid()%></td>
                                    <td><%=i.getName()%></td>
                                    <td><img  style="height: 100px; width: 100px;" src="Items_pic/<%= i.getPic()%>" alt=""></td>
                                    <td><%=i.getPrname()%></td>
                                    <td><%=i.getQuantity()%></td>
                                    <td><%=i.getPrprice()%></td>
                                    <td><%=i.getAddress()%></td>
                                    <td><%=i.getMob()%></td>
                                    <td><%=i.getPin()%></td>
                                    <td><%=formatdate.format(i.getDates())%></td>
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


        <!--End All orders Modal-->

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form  id="add-items" action="ItemsServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Product Name</label>
                                <input type="text" name="prName" required="" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Product Name">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Price</label>
                                <input type="text" name="prPrice" required="" class="form-control" id="exampleInputPassword1" placeholder="Enter Price">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Category</label>
                                <select class="form-control" name="cid">
                                    <option selected disabled>Select</option>                                      
                                    <%for (Categories cc : cats) {%>
                                    <option value="<%= cc.getCid()%>"><%= cc.getName()%></option> 
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Company</label>
                                <input type="text" name="prCompany" required="" class="form-control" id="exampleInputPassword1" placeholder="Enter Company Name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Select File</label>
                                <input type="file" name="prPic" required="" />
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--End Items Model-->

    <!--Start Categories Model-->
    <!--End Categories Model-->






    <!--end main body-->







    <!--start of profile model-->


    <!--end of model-->








    <script src="js/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



    <script>
        $(document).ready(function (e) {
            //asyncronous request using ajax


            $("#add-items").on("submit", function (event) {
                //this from called when form submitted
                event.preventDefault();
                console.log("submitted");
                //getting data in form var

                let form = new FormData(this);
                //now requesting to server

                $.ajax({
                    url: "ItemsServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //seccess
                        if (data.trim() === 'Done')
                        {
                            swal("Good job!", "Post Successfully", "success");
                        } else
                        {
                            swal("Error", "Something went wrong try again...!!", "error");
                        }


                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error
                        swal("Error", "Something went wrong try again...!!!", "error");

                    },
                    processData: false,
                    contentType: false

                });

            });


        });
    </script>



    <script>
        $(document).ready(function (e) {
            //asyncronous request using ajax


            $("#add-blogs").on("submit", function (event) {
                //this from called when form submitted
                event.preventDefault();
                console.log("submitted");
                //getting data in form var

                let form = new FormData(this);
                //now requesting to server

                $.ajax({
                    url: "BlogServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //seccess
                        if (data.trim() === 'Done')
                        {
                            swal("Good job!", "Post Successfully", "success");
                        } else
                        {
                            swal("Error", "Something went wrong try again...!!", "error");
                        }


                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error
                        swal("Error", "Something went wrong try again...!!!", "error");

                    },
                    processData: false,
                    contentType: false

                });

            });


        });
    </script>







</body>
</html>
