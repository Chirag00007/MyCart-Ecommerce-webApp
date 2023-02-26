/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycart.servlets;

import com.mycart.dao.CategoryDao;
import com.mycart.entities.Category;
import com.mycart.entities.Product;
import com.mycart.dao.ProductDao;
import com.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author CHIRAG VOHRA
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

//            In this servlet two actions are performing , we are geting the data of category as well as product
            String op = request.getParameter("operation");
            if (op.trim().equals("addCategory")) {
//            Fetching category data

                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDesc");
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                //Category ko database mai save karna hai;
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
//               out.println("category saved" + catId);
//                sending message to admin page which will access message component and show the saved message above the page
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "New Category is added successfully. Its category Id is :" + catId);
                response.sendRedirect("admin.jsp");
            } // if admin is adding the product
            else if (op.trim().equals("Product")) {
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catID"));

                //for image
                Part part = request.getPart("pPic");

                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscout(pDiscount);
                p.setpQuanntiy(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());

                // get category be id
                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cDao.getCategoryById(catId);
                p.setCategory(category);

                //Product save
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                // till now we just have save the data also save the pic name only
                // now we have to save the pic as well in images->products section to access the image

                // pic upload
                // find out the path to upload photo
                String path = request.getRealPath("images") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                System.out.print(path);

                // uploading code
                try{
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream fis = part.getInputStream();

//                reading data
                    byte[] data = new byte[fis.available()];
                    fis.read(data);
                    fos.write(data);
                    fos.close();
                
                }catch(Exception e){
                    e.printStackTrace();
                }
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "New Product is added successfully. Its product Id is :" + p.getpId());
                response.sendRedirect("admin.jsp");

            }
        }
    }

}
