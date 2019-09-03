
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
</head>
    <body>
        <%
    String dept=request.getParameter("dept");
     String staff=request.getParameter("staff");

     // out.println(dept+staff);
Connection con;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
//out.println(con);
Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
ResultSet rs=stmt.executeQuery("select distinct subcode as sb from it_theory_feedback where staffname='"+staff+"'");
ResultSet rs2=stmt1.executeQuery("select distinct sub as sb from it_lab_feedback where staff='"+staff+"'");
//sb.append("<select class='form-control input100' id='sub' onchange='sltdept2();'>");

out.println("<label>Handling Subjects</label><select class='form-control input100' id='hand_dept' name='hand_dept' ><option>----select-----</option>");

while(rs.next())
{
 out.println("<option value="+"\""+rs.getString(1)+"_"+"Theory"+"\">"+rs.getString(1)+"</option>");
}
while(rs2.next())
{
 out.println("<option value="+"\""+rs2.getString(1)+"_"+"Laboratory"+"\">"+rs2.getString(1)+"</option>");
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
