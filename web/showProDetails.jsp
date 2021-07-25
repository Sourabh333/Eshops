<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>
<html>
    <body>
        <h3><u>Product Specifications</u></h3>
<%
String pid=request.getParameter("pid");
Connection con=(Connection)application.getAttribute("mycon");
PreparedStatement ps=con.prepareStatement("select * from products where pid=?");
ps.setString(1, pid);
ResultSet rs=ps.executeQuery();
rs.next();
String pids=rs.getString(1);
String pnm=rs.getString(2);
int price=rs.getInt(3);
int disper=rs.getInt(4);
String pdesc=rs.getString(6);
%>
<pre><h3>
Product Name  : <%=pnm%>
Description   : <%=pdesc%>
Product Rate  : <%=price%>
Discount(in %): <%=disper%>
</h3>
</pre>
<a href="AddCart?pid=<%=pids%>">Add to cart</a> 
    </body>
</html>
<%@include file="footer.jsp" %>