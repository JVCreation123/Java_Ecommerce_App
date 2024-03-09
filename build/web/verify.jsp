<%-- 
    Document   : verify
    Created on : 1 Aug, 2023, 10:48:12 PM
    Author     : Dell 3505
--%>
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
                        <div class="card-body  text-center">
                            <form action="verifyCode" method="post">
                                <div class="form-group text-left">
                                    <label for="exampleInputPassword1">Enter OTP</label>
                                    <input type="password" name="authcode" class="form-control" id="exampleInputPassword1" placeholder="OTP">
                                </div>
                                <button type="submit" class="btn btn-primary mb-3">Submit</button><br>
                                <a href="signup_page.jsp">change email?</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
