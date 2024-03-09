<%-- 
    Document   : forgotpassword_page
    Created on : 12 Oct, 2023, 9:13:30 PM
    Author     : Dell 3505
--%>

<%@page import="com.app.entities.Message"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            body {
                background: #007bff;
                background: linear-gradient(to right, #0062E6, #33AEFF);
            }



        </style>
    </head>
    <body>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-5">
                        <div class="card-header text-center">
                            <i class="fa fa-key fa-3x" aria-hidden="true"></i>
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

                            %>
                        
                        <div class="card-body  text-center">
                            <form  action="ForgotpasswordServlet" method="post">
                                <div class="form-group text-left">
                                    <label for="exampleInputPassword1">Enter Email</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputPassword1" placeholder="Email">
                                </div>
                                <button type="submit" class="btn btn-primary mb-3">Find me</button><br>
                                <a href="signup_page.jsp">change email?</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>













        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


        <script>
            $(document).ready(function (e) {

                $("#findEmail").on("submit", function (event) {
                    event.preventDefault();
                    console.log("submitted");

                    let form = new FormData(this);

                    $.ajax({
                        url: "ForgotpasswordServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() === "Done")
                            {
                                swal("Done", "Account is found.","success");
                            } else
                            {
                                swal("Error", "Something went wrong try again...!!", "error");
                            }
                        },

//                        error: function (jqXHR, textStatus, errorThrown) {
//                            //error
//                            swal("Error", "Something went wrong try again...!!!", "error");
//
//                        },
                        processData: false,
                        contentType: false



                    });
                });

            });
        </script>

    </body>
</html>
