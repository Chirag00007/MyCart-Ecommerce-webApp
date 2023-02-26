<%-- 
    Document   : admin
    Created on : 15-Oct-2022, 12:31:51 pm
    Author     : CHIRAG VOHRA
--%>

<%@page import="com.mycart.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycart.entities.Category"%>
<!--// this authentication is done to check whether the current user is login && isAdmin.
// is he is not login || notAdmin then just give him a warning top of the login page-->
<%@page import="com.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("warning", "You are not Logged in || Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("warning", "You are not admin. you cannot access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%  CategoryDao cat = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cat.getCategories();
    //getting count to dynamic provide the value to admin page
    
    Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file = "common_css_js/commonForAll.jsp" %>
        <style>
            .adminn .card{
                border: 2px solid #6200EA;
                border-radius: 4px;
            }
            .adminn .card:hover{
                background: #BFACE0;
                cursor: pointer;
                font-weight: bolder;

            }
        </style>
    </head>
    <body>
        <%@include file = "common_css_js/navbar.jsp" %>

        <div class="container adminn">

            <!--// this div is for showing the message when the category or product is added--> 
            <div class="container-fluid mt-2">
                <%@include file="common_css_js/message.jsp"  %>
            </div>

            <div class="row mt-3">


                <!--first box-->
                <div class="col-md-4">

                    <div class="card text-center">

                        <div class="card-body">

                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid rounded-circle" src="images/ancestors.png" alt="alt"/>
                            </div>
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-muted text-uppercase">Users</h1>
                        </div>

                    </div>

                </div>


                <!--second box-->
                <div class="col-md-4">

                    <div class="card text-center">

                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid rounded-circle" src="images/categories.png" alt="alt"/>
                            </div>
                            <h1><%= list.size() %></h1>

                            <h1 class="text-muted text-uppercase">Categories</h1>
                        </div>

                    </div>

                </div>

                <!--thirdbox-->

                <div class="col-md-4">

                    <div class="card text-center">

                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid rounded-circle" src="images/delivery-box.png" alt="alt"/>
                            </div>
                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-muted text-uppercase">Products</h1>
                        </div>

                    </div>

                </div>





            </div>

            <div  class="row mt-2">

                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid rounded-circle" src="images/cart.png" alt="alt"/>
                            </div>
                            <p class="mt-2">
                                click here to add new category.
                            </p>
                            <h1 class="text-muted text-uppercase">Add category</h1>
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid rounded-circle" src="images/add.png" alt="alt"/>
                            </div>
                            <p class="mt-2">
                                click here to add new category.
                            </p>
                            <h1 class="text-muted text-uppercase">Add  Products</h1>
                        </div>

                    </div>
                </div>


            </div>


        </div>

        <!--Add category modal-->



        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addCategory"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 275px" class="form-control" name="catDesc" placeholder="Enter Category Description" required></textarea>
                            </div>

                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>



                        </form>

                    </div>

                </div>
            </div>
        </div>



        <!--end of add category modal-->


        <!--Product modal staring-->

        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="operation" value="Product"/>    


                        <div class="form-group">
                            <select name="catID" class="form-control">
                                <option selected disabled>---Select category----</option>

                                <%                                    for (Category c : list) {
                                %>

                                <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%></option>
                                <%
                                    }
                                %>
                            </select>


                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" name="pName" placeholder="Enter Product Name" required/>
                        </div>
                        <div class="form-group">
                            <textarea style="height: 275px" class="form-control" name="pDesc" placeholder="Enter Product Description" required></textarea>
                        </div>





                        <div class="form-group">
                            <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required/>
                        </div>

                        <div class="form-group">
                            <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required/>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="pQuantity" placeholder="Enter available Quantity " required/>
                        </div>
                        <div class="form-group">
                            <label for="pPic" style="font-weight: bolder; color: purple; text-align: center">Upload Product photo</label>
                            <input type="file" id="pPic" name="pPic" placeholder="Upload Product Photo" class="form-control" required/>
                        </div>




                        <div class="container text-center">

                            <button class="btn btn-outline-success">Add Product</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>



                    </form>

                </div>


            </div>
        </div>

        <!--Product Modal ending-->

        <%@include file = "common_css_js/common_modals.jsp" %>
    </body>
</html>
