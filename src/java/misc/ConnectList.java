package misc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ConnectList implements ServletContextListener {
Connection con;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eshops", "root", "root");
            sce.getServletContext().setAttribute("mycon", con);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectList.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectList.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConnectList.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
