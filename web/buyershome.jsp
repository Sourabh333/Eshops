<%@page import="java.util.ArrayList"%>
<%
String uname=(String)session.getAttribute("uname");
int items=0;
ArrayList list=(ArrayList)session.getAttribute("cart");
if(list!=null){
items=list.size();
}
%>
<%@include file="header.jsp" %>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
    <marquee><b>U have <%=items%> items in your cart........</b></marquee>
        <h3>Hello <%=uname%>,the buyer!</h3>
        <pre>
        <a href="showProList.jsp">View the product categories</a>
        <a href="">View the product list</a>
        <a href="showCart.jsp">View the cart</a>
        <a href="">Make payment</a>
        <a href="">Logout</a>
        </pre>
    </body>
</html>
<%@include file="footer.jsp" %>