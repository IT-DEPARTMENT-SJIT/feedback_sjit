<%--
    Document   : staff_theory_evaluation
    Created on : Jul 27, 2019, 9:37:09 PM
    Author     : SJIT_IT
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
 <%
    String dept=request.getParameter("dept");
     String sec=request.getParameter("sec");
      String ys=request.getParameter("ys");
       String ay=request.getParameter("ay");
        String sub=request.getParameter("sub");
     String staff=request.getParameter("staff");
     String tl=request.getParameter("tl");
     String sem=request.getParameter("sem");


        String user=(String)session.getAttribute("name");
        session.setAttribute("user", user);

           out.println(dept+sec+ys+ay+sub+staff+tl+sem+user);
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
            String r10=request.getParameter("selection[10]");
            String r11=request.getParameter("selection[11]");
            String r12=request.getParameter("selection[12]");
            String r13=request.getParameter("selection[13]");
            String r14=request.getParameter("selection[14]");
            String r15=request.getParameter("selection[15]");
            String r16=request.getParameter("selection[16]");
            String r17=request.getParameter("selection[17]");
            String r18=request.getParameter("selection[18]");
            String r19=request.getParameter("selection[19]");
            //String r20=request.getParameter("selection[20]");
            String r21=request.getParameter("selection[21]");


           out.println(r0+r1+r2+r3+r4+r5+r6+r7);
           int rr0=0,rr1=0,rr2=0,rr3=0,rr4=0,rr5=0,rr6=0,rr7=0,rr8=0,rr9=0,rr10=0,rr11=0,rr12=0,rr13=0,rr14=0,rr15=0,rr16=0,rr17=0,rr18=0,rr19=0;//,rr20=0;
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
        if(r10.equals("Strongly Agree"))
           {
               rr10=5;
           }
           else if(r10.equals("Agree"))
           {
              rr10=4;

           }
           else if (r10.equals("Neutral"))
           {
              rr10=3;

           }
           else if(r10.equals("Generally disagree"))
           {
               rr10=2;

           }
           else
           {
               rr10=-2;

           }
         if(r11.equals("Strongly Agree"))
           {
               rr11=5;
           }
           else if(r11.equals("Agree"))
           {
              rr11=4;

           }
           else if (r11.equals("Neutral"))
           {
              rr11=3;

           }
           else if(r11.equals("Generally disagree"))
           {
               rr11=2;

           }
           else
           {
               rr11=-2;

           }
          if(r12.equals("Strongly Agree"))
           {
               rr12=5;
           }
           else if(r12.equals("Agree"))
           {
              rr12=4;

           }
           else if (r12.equals("Neutral"))
           {
              rr12=3;

           }
           else if(r12.equals("Generally disagree"))
           {
               rr12=2;

           }
           else
           {
               rr12=-2;

           }
           if(r13.equals("Strongly Agree"))
           {
               rr13=5;
           }
           else if(r13.equals("Agree"))
           {
              rr13=4;

           }
           else if (r13.equals("Neutral"))
           {
              rr13=3;

           }
           else if(r13.equals("Generally disagree"))
           {
               rr13=2;

           }
           else
           {
               rr13=-2;

           }
            if(r14.equals("Strongly Agree"))
           {
               rr14=5;
           }
           else if(r14.equals("Agree"))
           {
              rr14=4;

           }
           else if (r14.equals("Neutral"))
           {
              rr14=3;

           }
           else if(r14.equals("Generally disagree"))
           {
               rr14=2;

           }
           else
           {
               rr14=-2;

           }
             if(r15.equals("Strongly Agree"))
           {
               rr15=5;
           }
           else if(r15.equals("Agree"))
           {
              rr15=4;

           }
           else if (r15.equals("Neutral"))
           {
              rr15=3;

           }
           else if(r15.equals("Generally disagree"))
           {
               rr15=2;

           }
           else
           {
               rr15=-2;

           }
              if(r16.equals("Strongly Agree"))
           {
               rr16=5;
           }
           else if(r16.equals("Agree"))
           {
              rr16=4;

           }
           else if (r16.equals("Neutral"))
           {
              rr16=3;

           }
           else if(r16.equals("Generally disagree"))
           {
               rr16=2;

           }
           else
           {
               rr16=-2;

           }
               if(r17.equals("Strongly Agree"))
           {
               rr17=5;
           }
           else if(r17.equals("Agree"))
           {
              rr17=4;

           }
           else if (r17.equals("Neutral"))
           {
              rr17=3;

           }
           else if(r17.equals("Generally disagree"))
           {
               rr17=2;

           }
           else
           {
               rr17=-2;

           }
                if(r18.equals("Strongly Agree"))
           {
               rr18=5;
           }
           else if(r18.equals("Agree"))
           {
              rr18=4;

           }
           else if (r18.equals("Neutral"))
           {
              rr18=3;

           }
           else if(r18.equals("Generally disagree"))
           {
               rr18=2;

           }
           else
           {
               rr18=-2;

           }
                 if(r19.equals("Strongly Agree"))
           {
               rr19=5;
           }
           else if(r19.equals("Agree"))
           {
              rr19=4;

           }
           else if (r19.equals("Neutral"))
           {
              rr19=3;

           }
           else if(r19.equals("Generally disagree"))
           {
               rr19=2;

           }
           else
           {
               rr19=-2;

           }

           /*       if(r20.equals("Strongly Agree"))
           {
               rr20=5;
           }
           else if(r20.equals("Agree"))
           {
              rr20=4;

           }
           else if (r20.equals("Neutral"))
           {
              rr20=3;

           }
           else if(r20.equals("Generally disagree"))
           {
               rr20=2;

           }
           else
           {
               rr20=1;

           }*/
                  int total;
                  total=rr0+rr1+rr2+rr3+rr4+rr5+rr6+rr7+rr8+rr9+rr10+rr11+rr12+rr13+rr14+rr15+rr16+rr17+rr18+rr19;//+rr20;
float avg=((float)total/100)*100;

                  try
                  {
Class.forName("com.mysql.jdbc.Driver");
ResultSet rs1=null;
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","itdept");
Statement stmt1=con.createStatement();
rs1=stmt1.executeQuery("select * from it_theory_feedback where subcode='"+sub+"'and"+" "+"loginval='"+user+"'and"+" "+"staffname='"+staff+"'");

 if(rs1.next()==false)
 {PreparedStatement stmt=con.prepareStatement("insert into it_theory_feedback values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
//1 specifies the first parameter in the query
stmt.setString(1,dept);
stmt.setString(2,sem);
stmt.setString(3,sec);
stmt.setString(4,sub);
stmt.setString(5,staff);
stmt.setInt(6,rr0 );
stmt.setInt(7,rr1 );
stmt.setInt(8, rr2);
stmt.setInt(9, rr3);
stmt.setInt(10, rr4);
stmt.setInt(11, rr5);
stmt.setInt(12, rr6);
stmt.setInt(13, rr7);
stmt.setInt(14, rr8);
stmt.setInt(15, rr9);
stmt.setInt(16, rr10);
stmt.setInt(17, rr11);
stmt.setInt(18, rr12);
stmt.setInt(19, rr13);
stmt.setInt(20, rr14);
stmt.setInt(21, rr15);
stmt.setInt(22, rr16);
stmt.setInt(23, rr17);
stmt.setInt(24, rr18);
stmt.setInt(25, rr19);
//stmt.setInt(26, rr20);
stmt.setInt(26, total);
stmt.setFloat(27, avg);
stmt.setString(28, ay);
stmt.setString(29, ys);
stmt.setString(30, user);
stmt.setString(31, r21);

int i=stmt.executeUpdate();
System.out.println(i+" records inserted");
con.close();

}}
catch(Exception e)
{
    out.println(e);
}





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
