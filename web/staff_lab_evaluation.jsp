<%--
    Document   : staff_lab_evaluation
    Created on : Jul 27, 2019, 11:09:49 PM
    Author     : SJIT_IT
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%
    String ay=request.getParameter("ay");
    String ys=request.getParameter("ys");
    String dept=request.getParameter("dept");
    String sem=request.getParameter("sem");
    String sec=request.getParameter("sec");
    String sub=request.getParameter("sub");
    String staff=request.getParameter("staff");
    String tl=request.getParameter("tl");

      String user=(String)session.getAttribute("name");
        session.setAttribute("user", user);

           out.println(dept+sec+ys+ay+sub+staff+tl+sem);
            String r0=request.getParameter("selection[0]");
            String r1=request.getParameter("selection[1]");
            String r2=request.getParameter("selection[2]");
            String r3=request.getParameter("selection[3]");
            String r4=request.getParameter("selection[4]");
            String r5=request.getParameter("selection[5]");
            String r6=request.getParameter("selection[6]");
            String r7=request.getParameter("selection[7]");
            String r8=request.getParameter("selection[8]");
            String r9=request.getParameter("selection[9]");
            //String r10=request.getParameter("selection[10]");
           // String r11=request.getParameter("selection[11]");
           // String r12=request.getParameter("selection[12]");
            String r13=request.getParameter("selection[13]");
          out.println(r13);
          out.println(r0+r1+r2+r3+r4+r5+r6+r7);
           int rr0=0,rr1=0,rr2=0,rr3=0,rr4=0,rr5=0,rr6=0,rr7=0,rr8=0,rr9=0,rr10=0,rr11=0,rr12=0;
          if(r0.equals("Strongly Agree"))
           {
               rr0=5;
           }
           else if(r0.equals("Agree"))
           {
              rr0=4;

           }
           else if (r0.equals("Neutral"))
           {
              rr0=3;

           }
           else if(r0.equals("Generally disagree"))
           {
               rr0=2;

           }
           else
           {
               rr0=-2;

           }
 if(r1.equals("Strongly Agree"))
           {
               rr1=5;
           }
           else if(r1.equals("Agree"))
           {
              rr1=4;

           }
           else if (r1.equals("Neutral"))
           {
              rr1=3;

           }
           else if(r1.equals("Generally disagree"))
           {
               rr1=2;

           }
           else
           {
               rr1=-2;

           }
  if(r2.equals("Strongly Agree"))
           {
               rr2=5;
           }
           else if(r2.equals("Agree"))
           {
              rr2=4;

           }
           else if (r2.equals("Neutral"))
           {
              rr2=3;

           }
           else if(r2.equals("Generally disagree"))
           {
               rr2=2;

           }
           else
           {
               rr2=-2;

           }
   if(r3.equals("Strongly Agree"))
           {
               rr3=5;
           }
           else if(r3.equals("Agree"))
           {
              rr3=4;

           }
           else if (r3.equals("Neutral"))
           {
              rr3=3;

           }
           else if(r3.equals("Generally disagree"))
           {
               rr3=2;

           }
           else
           {
               rr3=-2;

           }
    if(r4.equals("Strongly Agree"))
           {
               rr4=5;
           }
           else if(r4.equals("Agree"))
           {
              rr4=4;

           }
           else if (r4.equals("Neutral"))
           {
              rr4=3;

           }
           else if(r4.equals("Generally disagree"))
           {
               rr4=2;

           }
           else
           {
               rr4=-2;

           }
    if(r5.equals("Strongly Agree"))
           {
               rr5=5;
           }
           else if(r5.equals("Agree"))
           {
              rr5=4;

           }
           else if (r5.equals("Neutral"))
           {
              rr5=3;

           }
           else if(r5.equals("Generally disagree"))
           {
               rr5=2;

           }
           else
           {
               rr5=-2;

           }
     if(r6.equals("Strongly Agree"))
           {
               rr6=5;
           }
           else if(r6.equals("Agree"))
           {
              rr6=4;

           }
           else if (r6.equals("Neutral"))
           {
              rr6=3;

           }
           else if(r6.equals("Generally disagree"))
           {
               rr6=2;

           }
           else
           {
               rr6=-2;

           }
      if(r7.equals("Strongly Agree"))
           {
               rr7=5;
           }
           else if(r7.equals("Agree"))
           {
              rr7=4;

           }
           else if (r7.equals("Neutral"))
           {
              rr7=3;

           }
           else if(r7.equals("Generally disagree"))
           {
               rr7=2;

           }
           else
           {
               rr7=-2;

           }
      if(r8.equals("Strongly Agree"))
           {
               rr8=5;
           }
           else if(r8.equals("Agree"))
           {
              rr8=4;

           }
           else if (r8.equals("Neutral"))
           {
              rr8=3;

           }
           else if(r8.equals("Generally disagree"))
           {
               rr8=2;

           }
           else
           {
               rr8=-2;

           }



       if(r9.equals("Strongly Agree"))
           {
               rr9=5;
           }
           else if(r9.equals("Agree"))
           {
              rr9=4;

           }
           else if (r9.equals("Neutral"))
           {
              rr9=3;

           }
           else if(r9.equals("Generally disagree"))
           {
               rr9=2;

           }
           else
           {
               rr9=-2;

           }

           int total;
                  total=rr0+rr1+rr2+rr3+rr4+rr5+rr6+rr7+rr8+rr9;
float avg=((float)total/50)*100;

              try
                  {
Class.forName("com.mysql.jdbc.Driver");
ResultSet rs1=null;
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
Statement stmt1=con.createStatement();
rs1=stmt1.executeQuery("select * from it_lab_feedback where sub='"+sub+"'and"+" "+"loginval='"+user+"'and"+" "+"staff='"+staff+"'");
 if(rs1.next()==false)
 {PreparedStatement stmt=con.prepareStatement("insert into it_lab_feedback values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
//1 specifies the first parameter in the query
stmt.setString(1, ay);
stmt.setString(2, ys);
stmt.setString(3, dept);
stmt.setString(4, sem);
stmt.setString(5, sec);
stmt.setString(6, sub);
stmt.setString(7, staff);
stmt.setString(8, tl);
stmt.setInt(9, rr0);
stmt.setInt(10, rr1);
stmt.setInt(11, rr2);
stmt.setInt(12, rr3);
stmt.setInt(13, rr4);
stmt.setInt(14, rr5);
stmt.setInt(15, rr6);
stmt.setInt(16, rr7);
stmt.setInt(17, rr8);
stmt.setInt(18, rr9);
stmt.setInt(19, total);
stmt.setFloat(20, avg);
stmt.setString(21,user);
stmt.setString(22, r13);


int i=stmt.executeUpdate();
System.out.println(i+" records inserted");
        //general comments
       /* if(r21=="Strongly Agree")
           {
               rr21=5;
           }
           else if(r21=="Agree")
           {
              rr21=4;

           }
           else if (r21=="Neutral")
           {
              rr21=3;

           }
           else if(r21=="Generally disagree")
           {
               rr21=2;

           }
           else
           {
               rr21=1;

           }*/

}}
catch(Exception e)
{
    out.println(e);
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var url="localhost:8080/final_Updated/stafflog1_backup.jsp"
            window.location.href=(url);
            </script>
    </head>
    <body>

    </body>
</html>
