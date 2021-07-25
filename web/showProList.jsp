<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>

<html>

    <body>
        <h3><u>List of Product Categories</u></h3>
<%
Connection con=(Connection)application.getAttribute("mycon");
ResultSet rs=con.createStatement().executeQuery("select * from product_categories");
while(rs.next()){
String pcid=rs.getString(1);
String pcnm=rs.getString(2);
%>
<a href="showProducts.jsp?pcid=<%=pcid%>"><%=pcnm%></a><br>
<%
}
%>
    </body>
</html>
<%@include file="footer.jsp" %>