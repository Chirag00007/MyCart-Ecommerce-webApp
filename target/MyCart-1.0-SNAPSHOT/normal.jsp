<%-- 
    Document   : normal
    Created on : 15-Oct-2022, 12:32:02 pm
    Author     : CHIRAG VOHRA
--%>
<%@page import="com.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("warning", "You are not Logged in || Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
    if(user.getUserType().equals("admin")){
    session.setAttribute("warning", "You are not usser. you cannot access this page");
        response.sendRedirect("login.jsp");
        return;  
    }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file = "common_css_js/commonForAll.jsp" %>
    </head>
    <body>
        <%@include file ="common_css_js/message.jsp" %>
        <%@include file = "common_css_js/navbar.jsp" %>
    </body>
</html>
