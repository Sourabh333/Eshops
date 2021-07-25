/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dotpoint
 */
public class RegisterUser extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
String uid=request.getParameter("uid");
String unm=request.getParameter("unm");
String add=request.getParameter("add");
String mob=request.getParameter("mob");
String pass=request.getParameter("pass");
String utype=request.getParameter("utype");
String b1=request.getParameter("b1");
Connection con=(Connection)this.getServletContext().getAttribute("mycon");
PreparedStatement ps;
try {
if(b1.equalsIgnoreCase("save")){
                
ps=con.prepareStatement("insert into users values(?,?,?,?,?,?)");
ps.setString(1, uid);
ps.setString(2, unm);
ps.setString(3, add);
ps.setString(4, mob);
ps.setString(5, pass);
ps.setString(6, utype);
ps.executeUpdate();
out.println("<h1>User Registered Successfully.....</h1>");
}
else if(b1.equalsIgnoreCase("Update")){
ps=con.prepareStatement("update users set name=?,address=?,mob=?,password=?,usertype=? where userid=?");
ps.setString(1, unm);
ps.setString(2, add);
ps.setString(3, mob);
ps.setString(4, pass);
ps.setString(5, utype);
ps.setString(6, uid);
ps.executeUpdate();
out.println("<h1>User Updated Successfully.....</h1>");
}
else if(b1.equalsIgnoreCase("delete")){
ps=con.prepareStatement("delete from  users where userid=?");
ps.setString(1, uid);
ps.executeUpdate();
out.println("<h1>User Removed Successfully.....</h1>");

}
}catch (SQLException ex) {
                    Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
                }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
