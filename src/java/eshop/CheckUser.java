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

public class CheckUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
String unm=request.getParameter("unm");
String pass=request.getParameter("pass");
Connection con=(Connection) this.getServletContext().getAttribute("mycon");
PreparedStatement ps=con.prepareStatement("select * from users where userid=? and password=?");
ps.setString(1, unm);
ps.setString(2, pass);
ResultSet rs=ps.executeQuery();
boolean found=rs.next();
if(found){
                String uname=rs.getString(2);
                String utype=rs.getString(6);
                request.getSession().setAttribute("uname", uname);
   if(utype.equalsIgnoreCase("Buyer"))
                    response.sendRedirect("buyershome.jsp");
   else
                    response.sendRedirect("sellershome.jsp");
}
else{
        String aid=(String)this.getServletContext().getInitParameter("adminid");
        String aps=(String)this.getServletContext().getInitParameter("adminpass");
       if(unm.equalsIgnoreCase(aid) && pass.equalsIgnoreCase(aps))
           response.sendRedirect("adminhome.jsp");
       else{
       out.println("<h2>Invalid User Details......</h2>");
       out.println("<a href=login.jsp>Try-Again</a>");
       }
}
        } catch (SQLException ex) {
            out.println(ex);
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
 
    
    