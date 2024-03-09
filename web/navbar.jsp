<%-- 
    Document   : navbar
    Created on : 6 Jul, 2023, 7:49:32 AM
    Author     : Dell 3505
--%>

<%@page import="com.app.entities.User"%>
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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Roboto&family=Source+Code+Pro:wght@300&display=swap" rel="stylesheet">

    </head>
    <body>

        <section id="header">
            <a href="index.jsp" style="text-decoration: none; list-style: none;"><span class="logo" style=" font-family: 'Dancing Script', cursive; font-family: 'Roboto', sans-serif; font-family: 'Source Code Pro', monospace; font-style:none; color: #1a1a1a; font-weight: 1000; font-size:30px; ">Jvcre@tion<i class="fa fa-solid fa-feather"></i></span></a>
            <ul id="navbar">
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="profile.jsp">Shop</a></li>
                <li><a href="blog.jsp">Blog</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                    <%  
//                       User user = (User) session.getAttribute("currentUser");
//                       String log = (user != null) ? "profile.jsp" : "login_page.jsp";

                    %>
                <li id="lg-bag"><a href="login_page.jsp"><i class="far fa-shopping-bag"></i></a></li>
                        <%                            
//                                String banner = (user == null) ? "<li><a href='login_page.jsp'><span class='fa fa-user-circle'></span> Login</a></li>" : "<li><a id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='cursor: pointer;'><i class='fa fa-user'> Profile</i></a>  <div class='dropdown-menu' aria-labelledby='navbarDropdown'>     <div class='dropdown-item' href='#!' data-toggle='modal' data-target='#profile-modal'><span class='fa fa-user'></span><b>"+ user.getName()+"</b></div>  <a class='dropdown-item' href='LogoutServlets'><i class='far fa-sign-out'></i> Logout</a></div>  </li>";
//                            String banner = (user == null) ? "<li><a href='login_page.jsp'><span class='fa fa-user-circle'></span> Login</a></li>" : "<li><b>"+user.getName()+"</b></li>";
                        %>
                
                <li><a href='login_page.jsp'><span class='fa fa-user-circle'></span> Login</a></li>
                <a href="#" id="close"><i class="far fa-times"></i></a>

            </ul>

            <div id="mobile">
                <a href="profile.jsp"><i class="far fa-shopping-bag"></i></a>
                <i id="bar" class="fas fa-outdent"></i>
            </div>
        </section>        






        <script src="js/script.js"></script>


        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
