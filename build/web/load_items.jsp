<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="com.app.entities.Items"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page import="java.util.List"%>
<section id="product1" class="section-p1">
    <h2>Featured Products</h2>
    <p>Summer Collection New Morden Design</p>
    <div class="pro-container">

        <%
            List<Items> item = null;
            ItemsDao i = new ItemsDao(ConnectionProvider.getConnection());
            int cid = 1;
//                    Integer.parseInt(request.getParameter("cid"));    

            if (cid == 1) {
                item = i.getAllItemsById(cid);
            } else if (cid == 2) {
                item = i.getAllItemsById(cid);
            } else {
                item = i.getAllItemsById(cid);
            }

            for (Items ii : item) {

        %>
<!--onclick="window.location.href='sproduct.html'"-->
        <div class="pro" >
            <img src="Items_pic/<%= ii.getPrPic()%>" alt="">
            <div class="des">
                <span><%= ii.getPrCompany()%></span>
                <h5><%= ii.getPrName()%></h5>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4><i class="fas fa-rupee-sign"></i> <%= ii.getPrPrice()%></h4>
            </div>                
            <a href="add_to_cart?pid=<%=ii.getPid()%>"><button class="btn btn-primary cart-click" style="margin-bottom: 12px;">add to cart</button></a>
            <a href="OrderNowServlet?pid=<%=ii.getPid()%>&quantity=1"><i class="fal fa-shopping-cart cart"></i></a>
            
        </div>
        <%
            }
        %>
    </div>
</section>



<section id="product1" class="section-p1">
    <h2>New Arrivals</h2>
    <p>Summer Collection New Morden Design</p>
    <div class="pro-container">

        <%
            cid = 2;
            if (cid == 1) {
                item = i.getAllItemsById(cid);
            } else if (cid == 2) {
                item = i.getAllItemsById(cid);
            } else {
                item = i.getAllItemsById(cid);
            }

            for (Items ii : item) {

        %>

        <div class="pro">
            <img src="Items_pic/<%= ii.getPrPic()%>" alt="">
            <div class="des">
                <span><%= ii.getPrCompany()%></span>
                <h5><%= ii.getPrName()%></h5>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4><i class="fas fa-rupee-sign"></i> <%= ii.getPrPrice()%></h4>
            </div>
            <a href="add_to_cart?pid=<%=ii.getPid()%>"><button class="btn btn-primary cart-click" style="margin-bottom: 12px;">add to cart</button></a>
            <a href="OrderNowServlet?pid=<%=ii.getPid()%>&quantity=1"><i class="fal fa-shopping-cart cart"></i></a>
        </div>
        <%
//            }
            }
        %>
    </div>
</section>



<section id="product1" class="section-p1">
    <h2>Old Stock</h2>
    <p>Summer Collection New Morden Design</p>
    <div class="pro-container">

        <%
            cid = 3;
            if (cid == 1) {
                item = i.getAllItemsById(cid);
            } else if (cid == 2) {
                item = i.getAllItemsById(cid);
            } else {
                item = i.getAllItemsById(cid);
            }

            for (Items ii : item) {

        %>

        <div class="pro">
            <img src="Items_pic/<%= ii.getPrPic()%>" alt="">
            <div class="des">
                <span><%= ii.getPrCompany()%></span>
                <h5><%= ii.getPrName()%></h5>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4><i class="fas fa-rupee-sign"></i> <%= ii.getPrPrice()%></h4>
            </div>
            <a href="add_to_cart?pid=<%=ii.getPid()%>"><button class="btn btn-primary cart-click" style="margin-bottom: 12px;">add to cart</button></a>
             <a href="OrderNowServlet?pid=<%=ii.getPid()%>&quantity=1"><i class="fal fa-shopping-cart cart"></i></a>
        </div>
        <%
//            }
            }
        %>
    </div>
</section>





