<%-- 
    Document   : signup_page
    Created on : 7 Jul, 2023, 11:19:32 PM
    Author     : Dell 3505
--%>
<%@page errorPage="error_page.jsp" %>
<%@include file="navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>



        <main class="p-5 signup-bg">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form action="RegisterServlet" method="post" id="reg-form">


                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Name</label>
                                    <input type="text" required name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>       


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" required name="user_email"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" required name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" required value="male" name="gender">Male
                                    <input type="radio" id="gender" required value="female" name="gender">Female
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                    <textarea name="user_address" required class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your Address" rows="3"></textarea>
                                </div>


                                <div class="form-check">
                                    <input type="checkbox" required name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>please wait.....</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Sign up</button>
                            </form>
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


<!--        <script>
            $(document).ready(function () {
                console.log("loaded");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $('#submit-btn').hide();
                    $('#loader').show();

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $('#submit-btn').show();
                            $('#loader').hide();

                            if (data.trim() === 'done') {
                                swal("Registered Successfully.... We are redirecting to login Page.....")
                                        .then((value) => {
                                            window.location = "login_page.jsp";
                                        });
                            } else
                            {
                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            $('#submit-btn').show();
                            $('#loader').hide();

                            swal("Something went wrong...!");
                        },
                        processData: false,
                        contentType: false

                    });
                });
            });
        </script>-->


    </body>
</html>
