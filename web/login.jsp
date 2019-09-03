<%--
    Document   : login.jsp
    Created on : Jul 30, 2019, 2:08:32 PM
    Author     : SJIT_IT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Students Feedback Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
<!--===============================================================================================-->
</head>
<body>
    <%
    String username,password;
    username=request.getParameter("user");
    password=request.getParameter("pass");

    //out.println("Invalid password");
    Connection con;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
//out.println(con);
Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from student_login where username='"+username+"'");
//sb.append("<select class='form-control input100' id='sub' onchange='sltdept2();'>");

//out.println("<div class='col-4 mx-auto' >"+"<label>Subject Code & Subject Name</label>"+"<select class='form-control input100' id='subcode' name='subcode' onchange='sltdept2()';>");

String udb=null,pwddb=null,us=null;
if(rs.next())
{

    us=rs.getString(1);
    if(us.equalsIgnoreCase(username))
   {
                pwddb=rs.getString(2);
                if(pwddb.equals(password))
           {
                    session.setAttribute("name", username);
                    response.sendRedirect("stafflog1_backup.jsp");

           }
                else
               {
                    out.println("Invalid password");
                }
   }

}
 else
               {
    %><script>alert("INVALID USER");location.href="login.html"; </script><%
// remove comment to add user
//        stmt1.executeUpdate("insert into student_login values('"+username+"','"+password+"');");
//         session.setAttribute("name", username);
//                    response.sendRedirect("stafflog1_backup.jsp");
    }
//while(rs.next())
//{
//// out.println("<option value="+"\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
//// out.println("hai");
///*sb.append("<option value=");
//sb.append("\""+rs.getString(1)+"\"");
//sb.append(rs.getString(1)+"</option>");*/
//    udb=rs.getString(1);
//    pwddb=rs.getString(2);
////out.println(udb);
////out.println(pwddb);
//}
//
//if((udb.equalsIgnoreCase(username))&&(pwddb.equals(password)))
//{
//
//session.setAttribute("name", username);
//response.sendRedirect("stafflog1_backup.jsp");
//}
//else
//{
//    out.println("User");
//    out.println("Invalid User");
////    alert("invalid User");
//}

}catch(Exception e)
            {
            out.println(e.getMessage());
            }

    %>

</body>
</html>
