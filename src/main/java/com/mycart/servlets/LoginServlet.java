 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycart.servlets;

import com.mycart.dao.UserDao;
import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CHIRAG VOHRA
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            // We can also do some validations here , but for now I didnt need
            // authenticating data
            UserDao userDao;
            userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, password);
            //System.out.println(user);
            HttpSession httpSession = request.getSession();
            
             
            if(user==null){
                 httpSession.setAttribute("warning", "Invalid email or password !! login with valid email");
                  response.sendRedirect("login.jsp");
            }
            else{
               
                
                 
            
              httpSession.setAttribute("current-user", user);
               
                
             
                //normal.jsp
                switch (user.getUserType()) {
                    case "normal":
                        response.sendRedirect("normal.jsp");
                        break;
                    case "admin":
                        response.sendRedirect("admin.jsp");
                        break;
                    default:
                        out.println("Some error is there");
                        break;
                }
            
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
