<%@include file="header.jsp"%>
<html><head>
    <script>
        var request
        function showUser(){
        request=new XMLHttpRequest()
        request.onreadystatechange=getOutput
        var v=document.getElementById("uid").value
        //alert(uid)
        request.open("get", "DisplayUser?uid="+v, true)
        request.send(null)
        }
        function getOutput(){
                if(request.readyState==4 && request.status==200){
                    var result=request.responseText
                    //alert(result)
                    var data=result.split(",")
                    document.getElementById("unm").value=data[0]
                    document.getElementById("add").value=data[1]
                    document.getElementById("mob").value=data[2]
                    document.getElementById("pass").value=data[3]
                  //  document.getElementById("utype").innerHTML=data[4]
                }
                  
        }
        
        
    </script>
    </head>    
    <body>
        <h3>User Registration Form</h3>
        <form action="RegisterUser" method="Post">
            <pre>
User ID   : <input type="text" name="uid" id="uid"/><input type="button" value="Search" onclick="showUser()" />
User Name : <input type="text" name="unm" id="unm"/>
Address   : <input type="text" name="add" id="add"/>
User Mob  : <input type="text" name="mob" id="mob"/>
Password  : <input type="password" name="pass" id="pass"/>
User Type : <select name="utype" id="utype">
<option>Buyer</option>
<option>Seller</option>
</select>
<input type="submit" name="b1" value="Save"/><input type="submit" name="b1" value="Update"/><input type="submit" name="b1" value="Delete"/>

            </pre>
        </form>
    </body>
</html>
<%@include file="footer.jsp" %>
