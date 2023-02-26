
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login-My cart</title>
        <%@include file="common_css_js/commonForAll.jsp" %>
    </head>
    <body>
        <%@include file="common_css_js/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">

                        <div class="card-header custom-bg text-white text-center">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            <h3 style="font-family: fantasy">Login here</h3>
                        </div> 

                        <div class="card-body">
                            <%@include file ="common_css_js/warning.jsp" %>
                            <form action="LoginServlet" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                               
                                <div class="container text-center">
                                     <button type="submit" class="btn btn-primary custom-bg border-0">Login</button>
                                     <a href ="register.jsp" type="submit" class="btn btn-primary custom-bg border-0">Sign up</a>
                                </div>
                                
                            </form>
                        </div>
                      

                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
