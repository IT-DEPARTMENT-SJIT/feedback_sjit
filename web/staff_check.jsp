
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
        String sub=request.getParameter("sub");
        String staff=request.getParameter("staff");
        //out.println(str1);
      // out.println(sub);
        String user=(String)session.getAttribute("name");
        session.setAttribute("user", user);
        //String str2=request.getParameter("name");
       //out.println(staff);
       StringBuffer sb=null;
       ResultSet rs4=null;
       // out.println(str1+str2+str3+sub+user);
Connection con;

try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
Statement stmt1=con.createStatement();

if(str1.equals("IT"))
{
     rs4=stmt1.executeQuery("select sub_type as st from it_timetable where subcode='"+sub+"'");
}
else if(str1.equals("ECE"))
{
     rs4=stmt1.executeQuery("select sub_type as st from ece_timetable where subcode='"+sub+"'");
}
else if(str1.equals("CSE"))
{
     rs4=stmt1.executeQuery("select sub_type as st from cse_timetable where subcode='"+sub+"'");
}
else if(str1.equals("EEE"))
{
     rs4=stmt1.executeQuery("select sub_type as st from eee_timetable where subcode='"+sub+"'");
}
else if(str1.equals("Civil"))
{
     rs4=stmt1.executeQuery("select sub_type as st from civil_timetable where subcode='"+sub+"'");
}
else if(str1.equals("Mech"))
{
     rs4=stmt1.executeQuery("select sub_type as st from mech_timetable where subcode='"+sub+"'");
}

rs4.next();
//out.println(rs4.getString(1));
 ResultSet rs2;
if(rs4.getString(1).equals("Theory"))
{
   rs2=stmt1.executeQuery("select * from it_theory_feedback where subcode='"+sub+"'and"+" "+"loginval='"+user+"'and"+" "+"staffname='"+staff+"'");
}
else
{
    rs2=stmt1.executeQuery("select * from it_lab_feedback where sub='"+sub+"'and"+" "+"loginval='"+user+"'and"+" "+"staff='"+staff+"'");
}
//out.println(rs2);
    boolean flag=false;

//   if(rs2.next()==true)
//   {
//       out.println("alert('feedback already submitted')");
//
//   }

//out.println(hasResult);
//if(!hasResult "){out.println("already exist");}
//else

 if(rs2.next() == false )
{
try
{
//Class.forName("com.mysql.jdbc.Driver");
//out.println(con);
Statement stmt=con.createStatement();
//ResultSet rs=stmt.executeQuery("select subcode from it_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+"str3"+"'");
////sb.append("<select class='form-control input100' id='sub' onchange='sltdept2();'>");
//
//out.println("<div class='col-4 mx-auto' >"+"<label>Subject Code & Subject Name</label>"+"<select class='form-control input100' id='subcode' name='subcode' onchange='sltdept2()';>");
//
//while(rs.next())
//{
// out.println("<option value="+"\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
// out.println("hai");
///*sb.append("<option value=");
//sb.append("\""+rs.getString(1)+"\"");
//sb.append(rs.getString(1)+"</option>");*/
//
//}
//out.println("</select></div>");

//sb.append("</select>");
//String ss=sb.toString();*/
//out.println(ss);
//ResultSet rs1=stmt.executeQuery("select staffname as s from it_timetable where dept='"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'and"+" "+"subcode='"+sub+"'");
//
//out.println("<div class='col-4 mx-auto' >"+"Staff Details<select class='form-control input100' id='sub1' name='sub1'>");
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
ResultSet rs3=null;
if(str1.equals("IT"))
{
 rs3 = stmt.executeQuery("select sub_type as st from it_timetable where dept = '"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'and"+" "+"subcode='"+sub+"'");
}
else if(str1.equals("CSE"))
{
 rs3 = stmt.executeQuery("select sub_type as st from cse_timetable where dept = '"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'and"+" "+"subcode='"+sub+"'");
}
else if(str1.equals("ECE"))
{
 rs3 = stmt.executeQuery("select sub_type as st from ece_timetable where dept = '"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'and"+" "+"subcode='"+sub+"'");
}
else if(str1.equals("EEE"))
{
 rs3 = stmt.executeQuery("select sub_type as st from eee_timetable where dept = '"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'and"+" "+"subcode='"+sub+"'");
}
else if(str1.equals("Civil"))
{
 rs3 = stmt.executeQuery("select sub_type as st from civil_timetable where dept = '"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'and"+" "+"subcode='"+sub+"'");
}
else if(str1.equals("Mech"))
{
 rs3 = stmt.executeQuery("select sub_type as st from mech_timetable where dept = '"+str1+"'and"+" "+"sem='"+str2+"'and"+" "+"section='"+str3+"'and"+" "+"subcode='"+sub+"'");
}

rs3.next();
out.println("<div class='col-4 mx-auto'><label>Theory or Laboratory</label><select class='form-control input100' id='thelab' onchange='TLnavi();'><option>---select---</option><option value="+"\""+rs3.getString(1)+"\">"+rs3.getString(1)+"</option></select></div>");

con.close();
}
catch(Exception e)
        {

        out.println(e.getMessage());
        }
 // out.println(e.getMessage());
}
}
catch(Exception e)
        {

        out.println(e.getMessage());
        }
        %>
    </body>
</html>
