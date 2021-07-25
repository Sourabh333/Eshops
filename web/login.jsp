<%@include file="header.jsp" %>
<html>
    <head>
    </head>
    <body>
        <h2>Login page</h2>
        <form action="CheckUser" method="post">
            <pre>
            UserName : <input type="text" name="unm"/>
            Password : <input type="password" name="pass"/>
                       <input type="submit" value="Login"/>

<a href="registration.jsp">New User, Register Here</a>
            </pre>
        </form>
    </body>
</html>
<%@include file="footer.jsp" %>
