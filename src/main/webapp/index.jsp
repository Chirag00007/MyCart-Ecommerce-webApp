<%-- 
    Document   : index
    Created on : 10-Oct-2022, 6:12:34 am
    Author     : CHIRAG VOHRA by 💕
--%>

<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart - Home</title>

        <%@include file="common_css_js/commonForAll.jsp" %>
        <style>
            .product-card:hover{
                background-color: #ccccff;
                cursor: pointer;
            }
        </style>

    </head>
    <body>
        <%@include file="common_css_js/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">




                <%      String caT = (request.getParameter("category"));

                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());

                    List<Product> list;
                    if (caT == null) {
                        list = pdao.getAllProducts();
                    } else if (caT.equals("0")) {
                        list = pdao.getAllProducts();
                    } else {

                        int cid = Integer.parseInt(caT);
                        list = pdao.getAllProductsById(cid);

                    }

                    //List<Product> list = pdao.getAllProducts();
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();

                %>
                <!--show categoreis-->

                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=0" class="list-group-item list-group-item-action custom-bg active text-white">
                            All Products
                        </a>



                        <%for (Category c : clist) {
                        %>

                        <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>


                <!--        //for products-->

                <div class="col-md-10">

                    <div class="row mt-4">


                        <div class="col-md-12">

                            <div class="card-columns">
                                <% for (Product p : list) {%>

                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img class="card-img-top m-2" style="max-height: 250px;max-width: 100%; width: auto;" src="images/products/<%=p.getpPhoto()%>" alt="Card image cap">
                                    </div>
                                    <div class="card-body">

                                        <h5 class="card-title"><%= p.getpName()%> </h5> 
                                        <p class="card-text"> <%=Helper.get10Words(p.getpDesc())%></p>

                                    </div> 
                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white text-center" onclick="add_to_cart(<%=p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterApplyingDiscount()%>)">Add to cart</button>
                                        <button class="btn btn-outline-success text-center" >&#x20B9; <b><%= p.getPriceAfterApplyingDiscount()%>/-</b> <span style="font-size: 12px!important;
                                                                                                                                                             font-style: italic!important;
                                                                                                                                                             text-decoration: line-through!important;" class="text-secondary discount-label">&#x20B9; <%= p.getpPrice()%> <%=p.getpQuanntiy()%>% Off</span> </button>
                                    </div>



                                </div>






                                <% }

                                    if (list.size() == 0) {
                                        out.println("<h3>Oops!No product is found</h3>");
                                    }

                                %>

                            </div>
                        </div>

                    </div>



                </div>
            </div>


        </div>
        <%@include file="common_css_js/common_modals.jsp" %>
    </body>
</html>
