<%-- 
    Document   : register
    Created on : 14-Oct-2022, 3:49:15 am
    Author     : CHIRAG VOHRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up </title>
        <%@include file="common_css_js/commonForAll.jsp" %>
        <style>
            body{
                background-size: auto;
            }
        </style>
      
    </head>
    <body>
        <%@include file="common_css_js/navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <%@include file = "common_css_js/message.jsp" %>
                    <div class="card-body">
                        <div class="card-header text-center">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            <h3>Register here</h3>
                        </div>

                        <form action="RegisterServlet" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input name="user_name" required="required" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your Name">
                        <!--                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input name="user_email" required="required" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Your email">
                        <!--                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input name="user_pass" required="required" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Your password">
                        <!--                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                             </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input name="user_phone" required="required" type="phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Your phone no.">
                            <!--                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <textarea name="user_address" style="height: 200px" class="form-control" placeholder="enter your address"></textarea>                    
                        </div>
                        <div class="container text-center">

                            
                            <button type="submit" class="btn btn-outline-warning">Register</button>
                            <button type="reset" class="btn btn-outline-warning">Reset</button>
                        </div>
                </form>
                   
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
