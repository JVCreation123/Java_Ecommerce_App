<%-- 
    Document   : changepassword_page
    Created on : 12 Oct, 2023, 9:52:26 PM
    Author     : Dell 3505
--%>

<%@page import="com.app.entities.Message"%>
<%@page import="com.app.entities.User"%>
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
                            <form action="ChangepasswordServlet" method="post">
                                <div class="form-group text-left">
                                    <label for="exampleInputPassword1">Enter New Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                    <label for="exampleInputPassword1">Confirm Password</label>
                                    <input type="password" name="password2" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                </div>
                                <button type="submit" onclick="return ckeckPassword()"  class="btn btn-success mb-3">Save</button><br>
                                <a href="signup_page.jsp">change email?</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <script>
            
            function checkPassword(){
                let pass1=document.getElementById("password")
                let pass2=document.getElementById("password2")
                if(pass1!=pass2){
                    alert("Passwords did not match...!")
                }

            }
            
        </script>

    </body>
</html>
