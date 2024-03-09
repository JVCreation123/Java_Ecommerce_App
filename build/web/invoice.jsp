<%@page import="com.app.entities.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.app.dao.ItemsDao"%>
<%@page import="com.app.helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.app.entities.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.app.entities.OrderData"%>
<%@page import="com.app.dao.OrderDao"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice PDF</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%
            ArrayList<Order> orders = (ArrayList<Order>) request.getSession().getAttribute("orderinfo");
            
            User user = (User) request.getSession().getAttribute("currentUser");
            OrderData mob=  (OrderData) request.getSession().getAttribute("ordersforbill");
             
            OrderData ordersdata = (OrderData) request.getSession().getAttribute("ordersforbill");
            OrderDao idao = new OrderDao(ConnectionProvider.getConnection());
            double total = 0;
//            OrderData dates = idao.getTotalOrderPrice(ordersdata.getUid());

            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-YYYY");
            Date date = new Date();
//            request.setAttribute("date", date);
            Random rnd = new Random();
            int number = rnd.nextInt(999999);
            request.setAttribute("number", number);

        %>
        <div class="card" id="invoice">
            <div class="card-body">
                <div class="container mb-5 mt-3">
                    <div class="row d-flex align-items-baseline">
                        <div class="col-xl-9">
                            <p style="color: #7e8d9f;font-size: 20px;">Invoice >> <strong>ID: ${number}</strong></p>
                        </div>

                        <hr>
                    </div>

                    <div class="container">
                        <div class="col-md-12">
                            <div class="text-center">
                                <i class="fab fa-mdb fa-4x ms-0" style="color:#5d9fc5 ;"></i>
                                <p class="pt-0">JvCre@tion</p>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-xl-8">
                                <ul class="list-unstyled">
                                    <li class="text-muted">To: <span style="color:#5d9fc5 ;"><%= user.getName()%></span></li>
                                    <li class="text-muted"><%= user.getAddress()%></li>
                                    <li class="text-muted">Ahmedabad, Gujarat</li>
                                    <li class="text-muted"><i class="fas fa-phone"></i> <%= mob.getMob()%></li>
                                </ul>
                            </div>
                            <div class="col-xl-4">
                                <p class="text-muted">Invoice</p>
                                <ul class="list-unstyled">
                                    <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                                            class="fw-bold">ID:</span> ${number}</li>
                                    <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                                            class="fw-bold">Creation Date: </span> <%= formatter.format(date)%></li>
                                    <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                                            class="me-1 fw-bold">Status:</span><span class="badge bg-warning text-black fw-bold">
                                            Order Placed</span></li>
                                </ul>
                            </div>
                        </div>

                        <div class="row my-2 mx-1 justify-content-center">
                            <table class="table table-striped table-borderless">
                                <thead style="background-color:#84B0CA ;" class="text-white">
                                    <tr>
                                        <th scope="col">id</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                        <!--<th scope="col">Amount</th>-->
                                    </tr>
                                </thead>
                                <%for (Order o : orders) {
                                %>
                                <tbody>
                                    <tr>
                                        <th scope="row"><%= o.getOrderId()%></th>
                                        <td><%= o.getPrName()%></td>
                                        <td><%= o.getQuantity()%></td>
                                        <td><%= o.getPrPrice()%></td>
                                        <!--<td>$800</td>-->
                                    </tr>

                                </tbody>

                                <%

                                        total = total + o.getPrPrice();
                                    }
                                    request.setAttribute("total", total);

                                    double tax = total * 0.15;
                                    tax = Double.parseDouble(new DecimalFormat("##.##").format(tax));
                                    request.setAttribute("tax", tax);

                                    double maintotal = total + tax;
                                    request.setAttribute("maintotal", maintotal);
                                %>

                            </table>
                        </div>
                        <div class="row">
                            <div class="col-xl-8">
                                <p class="ms-3">Customer Staisfaction is our first priority. <br>"Quality is Important then Quantity."</p>

                            </div>
                            <div class="col-xl-3">
                                <ul class="list-unstyled">
                                    <li class="text-muted ms-3"><span class="text-black me-4">SubTotal</span> <i class="fas fa-rupee-sign"></i> ${total}
                                    </li>
                                    <li class="text-muted ms-3 mt-2"><span class="text-black me-4">Tax(15%)</span> ${tax}</li>
                                </ul>
                                <p class="text-black float-start"><span class="text-black me-4"> Total Amount</span>
                                    <span style="font-size: 25px;">  <br><i class="fas fa-rupee-sign"></i> ${maintotal}</span></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-10">
                                <p>Thank you for your purchase</p>
                            </div>

                            <!--<a href="guru_download">Download</a>-->
                            <!--<button id="download">Download</button>-->
                        </div>
                        <hr>


                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 float-end text-center mb-5">
            <button id="download" class="btn btn-light text-capitalize border-0" style="font-size: 24px;" data-mdb-ripple-color="dark"><i
                    class="fas fa-print text-primary"></i> Download</button>
        </div>

        <!--<button class="btn btn-success" > Download pdf</button>-->



        <script>
            window.onload = function () {
                document.getElementById("download")
                        .addEventListener("click", () => {
                            const invoice = this.document.getElementById("invoice");
                            var opt = {
                                filename: 'invoice',
                                image: {type: 'jpeg', quality: 0.98},
                                html2canvas: {scale: 2},
                                jsPDF: {unit: 'in', format: 'letter', orientation: 'portrait'}
                            };
                            html2pdf().from(invoice).set(opt).save();

                        })
            }

        </script>
    </body>
</html>
