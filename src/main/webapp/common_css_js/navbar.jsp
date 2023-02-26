<%-- 
    Document   : navbar
    Created on : 14-Oct-2022, 3:02:04 am
    Author     : CHIRAG VOHRA 
--%>

<%@page import="com.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");
    
    
%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg ">
    

        <a class="navbar-brand" href="index.jsp"><span class="fa fa-tv mr-5" style="color: #FDD835; font-weight: bolder; font-size: 35px">My Cart </span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp"><span class="fa fa-home" style="color: white; font-weight: bolder; font-size: 25px"> Home </span><span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     <span class="fa fa-toggle-down" style="color: white; font-weight: bolder; font-size: 25px"> Categories </span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <!--      <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                      </li>-->
            </ul>
            <!--    <form class="form-inline my-2 my-lg-0">
                  <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>-->
            
                                <li class="nav-item active">
                                    <a class="nav-link" href="#" data-toggle="modal" data-target="#card"> <i class="fa fa-cart-plus" style="font-size:30px;"></i><span class="ml-0 cart-items" style="size: 25px">(0)</span></a>   
                </li>
            <ul class ="navbar-nav ml-auto">
                <% 
                    if(user1==null){
                    
                    %>
                    <li class="nav-item active">
                    <a class="nav-link" href="login.jsp"><span class="fa fa-sign-in" style="color: white; font-weight: bolder; font-size: 20px"> Sign in </span></a>
                </li>
                <li class="nav-item active">
                      <a class="nav-link" href="register.jsp"><span class="fa fa-user-plus" style="color: white; font-weight: bolder; font-size: 20px"> Sign Up </span></a>
                </li>
                <%
                    }
                    else{
                    
%>
<li class="nav-item active">
    <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"   %>"><span class="fa fa-user" style="color: white; font-weight: bolder; font-size: 20px"> <%= user1.getUserName()%> </span></a>
                </li>
                <li class="nav-item active">
                      <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out" style="color: white; font-weight: bolder; font-size: 20px"> LogOut </span></a>
                </li>
<%

                    }
                
                
                %>
                
            </ul>

        </div>
    </div>
</nav>
