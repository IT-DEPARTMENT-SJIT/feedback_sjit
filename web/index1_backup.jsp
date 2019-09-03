
<%@ page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

        String str1=request.getParameter("dept");
        String str2=request.getParameter("sem");
        String str3=request.getParameter("sec");


        String user=(String)session.getAttribute("name");
        session.setAttribute("user", user);


    //   String usr =request.getParameter("user");
//        String subc= request.getParameter("sub");
       StringBuffer sb=null;
//out.println(str1+str2+str3);
Connection con;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
//out.println(con);
Statement stmt=con.createStatement();
ResultSet rs=null;
if(str1.equals("IT"))
{
     rs=stmt.executeQuery("select distinct subcode from it_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'");
}
else if(str1.equals("CSE"))
{
     rs=stmt.executeQuery("select distinct subcode from cse_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'");
}
else if(str1.equals("ECE"))
{
     rs=stmt.executeQuery("select distinct subcode from ece_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'");
}
else if(str1.equals("EEE"))
{
     rs=stmt.executeQuery("select distinct subcode from eee_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'");
}
else if(str1.equals("Civil"))
{
     rs=stmt.executeQuery("select distinct subcode from civil_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'");
}
else if(str1.equals("Mech"))
{
     rs=stmt.executeQuery("select distinct subcode from mech_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'");
}


//sb.append("<select class='form-control input100' id='sub' onchange='sltdept2();'>");

out.println("<div class='col-4 mx-auto' >"+"<label>Subject Code & Subject Name</label>"+"<select class='form-control input100' id='subcode' name='subcode' onchange='sltdept2()';><option>---select---</option>");

while(rs.next())
{
 out.println("<option value="+"\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
 out.println("hai");
/*sb.append("<option value=");
sb.append("\""+rs.getString(1)+"\"");
sb.append(rs.getString(1)+"</option>");*/

}
out.println("<option>-----Close-----</option></select></div>");

//sb.append("</select>");
//String ss=sb.toString();*/
//out.println(ss);
//ResultSet rs1=stmt.executeQuery("select staffname as s from it_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'");
//out.println("<div class='col-4 mx-auto'>");
//out.println("Staff Details<select class='form-control input100' id='sub1'>");
//
//while(rs1.next())
//{
//   out.println("<option value="+"\""+rs1.getString(1)+"\">"+rs1.getString(1)+"</option>");
//    out.println("hai");
//
///*sb.append("<option value=");
//sb.append("\""+rs.getString(1)+"\"");
//sb.append(rs.getString(1)+"</option>");*/
//
//}
//out.println("</select></div>");
//out.println("<div class='col-4 mx-auto'><label>Theory or Laboratory</label><select class='form-control input100' id='thelab' onchange='TLnavi();'><option vaule='0'>Select</option><option value='Theory'>Theory</option><option value='Laboratory'>Laboratory</option></select></div>");

con.close();
}
catch(Exception e)
        {

        out.println(e.getMessage());
        }
 // out.println(e.getMessage());

        %>
    </body>
</html>
