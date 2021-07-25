<%
String uname=(String)session.getAttribute("uname");
%>
<%@include file="header.jsp" %>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Hello <%=uname%>, the seller!</h3>
        <pre>
        <a href="">View the product categories</a>
        <a href="">View the the products</a>
        <a href="">Manage the offers</a>
        <a href="">Receive the payment</a>
        <a href="">Logout</a>
        </pre>
    </body>
</html>
<%@include file="footer.jsp" %>