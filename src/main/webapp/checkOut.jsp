<%-- 
    Document   : checkOut
    Created on : 05-Nov-2022, 8:33:42 pm
    Author     : CHIRAG VOHRA
--%>

<!--// to check that user should be login -->
<% 
User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("warning", "You are not Logged in || Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out</title>
        <%@include file = "common_css_js/commonForAll.jsp" %>
    </head>
    <body>
        <%@include file = "common_css_js/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-5">
                    <!--card-->
                    <div class="card">
                        <h2 class="text-center mt-3"> <b>Your Cart</b> <h2> 
                                <div class="cart-body">

                                </div>
                                </div>
                                </div>
                                <div class="col-md-5">
                                    <!--form details-->
                                    <div class="card">
                                        <h3 class="text-center mt-3"> <b>Your Details for order</b> <h3> 
                                                <form action="#">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Email address</label>
                                                        <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                                    </div>  
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Your Name</label>
                                                        <input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">

                                                    </div>  
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Your Phone number</label>
                                                        <input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone number">

                                                    </div>  
                                                    <div class="form-group">
                                                        <label for="exampleFormControlTextarea1">Your Shipping address</label>
                                                        <textarea value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address"></textarea>
                                                    </div>
                                                    
                                                    <div class="container text-center">
                                                        <button class="btn btn-outline-success ">Order now</button>
                                                        <button class="btn btn-outline-primary ">Continue Shopping</button>
                                                    </div>
                                                </form>
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                                <%@include file = "common_css_js/common_modals.jsp" %>
                                                </body>
                                                </html>

                                                