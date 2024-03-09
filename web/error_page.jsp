<%-- 
    Document   : error_page
    Created on : 18 Jul, 2023, 12:46:56 PM
    Author     : Dell 3505
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something Went wrong........!!!!</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <style>
            *{
                margin: 0;
                padding:0;
                box-sizing: border-box;
            }
            body{
                background: #e2e2e2;
            }
            .container{
                text-align: center;
                margin-top: 20px;

            }
            .container img{
                width: 40%;
            }
        </style>


    </head>
    <body>
        <div class="container">
            <h1 style="font-family: monospace; color: red;" >Something Went wrong........!!!!</h1>
            <img src="img/error.png" alt="alt"/>
            <br><br>
            <h3 style="font-family: monospace"><%= exception%></h3>
            <br><br>
            <a class="btn btn-primary" href="login_page.jsp">Back to Home</a>            

        </div>



        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
