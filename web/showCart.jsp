<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>
<%
Connection con=(Connection)application.getAttribute("mycon");
String qry="select * from products where pid in ('";
ArrayList list=(ArrayList)session.getAttribute("cart");
for(int i=0;i<list.size();i++){
        String p=(String)list.get(i);
        qry=qry+p+"','";
}
qry=qry.substring(0, qry.length()-2)+")";
//out.println(qry);
ResultSet rs=con.createStatement().executeQuery(qry);
%>
<html>
    <body>
        <h3>Here is your cart....</h3>
        <form action="RemoveMarked">
        <table border="4" width="3" cellspacing="3" cellpadding="4">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Disc(%)</th>
                    <th>Disc(Rs)</th>
                    <th>Sourbu Price</th>
                    <th>Remove</th>
                    <th>Mark</th>
                </tr>
            </thead>
            <tbody>
<%
double totprice=0,totdisrs=0,totsprc=0;
while(rs.next()){  
String pid=rs.getString(1);
String name=rs.getString(2);
String desc=rs.getString(6);
int price=rs.getInt(3);
int disper=rs.getInt(4);
double disrs=price*disper/100;
double sprc = price-disrs;
totprice+=price;
totdisrs+=disrs;
totsprc+=sprc;
%>
                <tr>
                    <td><%=name%></td>
                    <td><%=desc%></td>
                    <td><%=price%></td>
                    <td><%=disper%></td>
                    <td><%=disrs%></td>
                    <td><%=sprc%></td>
                    <td align="center"><a href="EditCart?pid=<%=pid%>">X</a></td>
                    <td align="center"><input type="checkbox" name="pid" value="<%=pid%>" /></td>
                </tr>
<%
}
%>
<tr>
    <td colspan="2"><b><center>Total</center></b></td>
    <td><b><%=totprice%></b></td><td></td>
    <td><b><%=totdisrs%></b></td>
    <td><b><%=totsprc%></b></td><td colspan="2"><input type="submit" value="Remove Marked"/></td>
</tr>
            </tbody>
        </table>
</form>
    </body>
</html>
<%@include file="footer.jsp" %>