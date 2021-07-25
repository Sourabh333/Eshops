<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>
<html>
    <body>
        <h3><u>List of Products in this category</u></h3>
<%
String pcid=request.getParameter("pcid");
Connection con=(Connection)application.getAttribute("mycon");
PreparedStatement ps=con.prepareStatement("select * from products where pcid=?");
ps.setString(1, pcid);
ResultSet rs=ps.executeQuery();
while(rs.next()){
String pid=rs.getString(1);
String pnm=rs.getString(2);
%>
<a href="showProDetails.jsp?pid=<%=pid%>"><%=pnm%></a><br>
<%
}
%>
    </body>
</html>
<%@include file="footer.jsp" %>