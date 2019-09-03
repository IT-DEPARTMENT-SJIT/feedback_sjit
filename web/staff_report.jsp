
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
</head>
    <body>
        <%
    String dept=request.getParameter("dept");
      //out.println(dept);
Connection con;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
//out.println(con);
Statement stmt=con.createStatement();
ResultSet rs=null;
if(dept.equals("IT"))
rs=stmt.executeQuery("select name as a from it_staff where dept='"+dept+"'");
else if(dept.equals("CSE"))
rs=stmt.executeQuery("select name as a from cse_staff where dept='"+dept+"'");
else if(dept.equals("EEE"))
rs=stmt.executeQuery("select name as a from eee_staff where dept='"+dept+"'");
else if(dept.equals("ECE"))
rs=stmt.executeQuery("select name as a from ece_staff where dept='"+dept+"'");
else if(dept.equals("CIVIL"))
rs=stmt.executeQuery("select name as a from civil_staff where dept='"+dept+"'");
else if(dept.equals("MECH"))
rs=stmt.executeQuery("select name as a from mech_staff where dept='"+dept+"'");
else if(dept.equals("Mathematics"))
rs=stmt.executeQuery("select name as a from maths_staff where dept='"+dept+"'");
else if(dept.equals("Physics"))
rs=stmt.executeQuery("select name as a from physics_staff where dept='"+dept+"'");
else if(dept.equals("Chemistry"))
rs=stmt.executeQuery("select name as a from chemistry_staff where dept='"+dept+"'");
else if(dept.equals("English"))
rs=stmt.executeQuery("select name as a from english_staff where dept='"+dept+"'");

//sb.append("<select class='form-control input100' id='sub' onchange='sltdept2();'>");

out.println("<label>Staff Name</label><select class='form-control input100' id='sub' name='sub1' onchange='dept1();'><option>----select-----</option>");

while(rs.next())
{
 out.println("<option value="+"\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
 //out.println("hai");
/*sb.append("<option value=");
sb.append("\""+rs.getString(1)+"\"");
sb.append(rs.getString(1)+"</option>");*/

}
out.println("</select>");

//sb.append("</select>");
//String ss=sb.toString();*/
//out.println(ss);


con.close();
}
catch(Exception e)
        {

        out.println(e.getMessage());
        }
 // out.println(e.getMessage());

        %>
