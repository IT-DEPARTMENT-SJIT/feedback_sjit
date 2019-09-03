<%--
    Document   : theory
    Created on : 26 Jul, 2019, 11:32:11 PM
    Author     : Rohith
--%>
<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<title>Staff Report</title>
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
	<!--<link rel="stylesheet" type="text/css" href="css/ind_staff_report.css">-->
<!--===============================================================================================-->
<style>
     body{
        margin:0;
        text-align:center;
    }
    img{
        margin-left:auto;
        margin-right:auto;
    }
    #l1{
        margin-left: 23%;
        display:inline-block;
    }
    #l2{
        margin-left: 13%;
          display:inline-block;
    }
    #l3{
         margin-left: 5%;
          display:inline-block;
    }
    #l4{
         margin-left: 5%;
          display:inline-block;
    }
    #d1{
        margin-left: 20%;
          display:inline-block;
    }
    table.center{
        margin-left:auto;
        margin-right:auto;
     }
.table_main{
  font-family: Poppins-Medium;
  display: medium;
  font-size: 15px;
  margin-left:0%;
  margin-right:auto;
}
.table_header th{
  text-align: center;
}
.table_main th,td{
  border: 2px solid;
}
.table_main td{
  padding: 7px;
}
label
{
    margin-left:25%;
    float:left;
    font-weight:bold;
}
#sug
{
    font-weight: bold;
    font-family: 30px;
    float:left;
}
h6
{

    margin: 0px;
    float:left;
}
table.suggest{

    width:70%;

}
</style>

</head>

    <body>
        <%
    String dept=request.getParameter("dept");
        String sub=request.getParameter("hand_dept");
     String staff=request.getParameter("sub1");
     String tl[]=sub.split("_");
     String t2[]=sub.split("_");

     String sem=request.getParameter("sem");


%>

	<div class="limiter">
		<div class="container-login100">
			<div class="top-logo"><img src="images/image.png" alt="IMG" height="60%" width="60%" ></div>
			<div class="wrap-login100">


                                    <label id="l1">Academic Year:<%out.println("2019-2020");%></label>



                                      <label id="d1" >Department:<%out.println(" "+dept);%></label>



                                      <br>

                                     <label id="l2">Subject Name:<%out.println(" "+t2[0]);%></label>


                                      <label id="l3">Staff :<%out.println(" "+staff);%></label>


                                      <label id="l4">Subject Type :<%out.println(" "+tl[1]);%></label>

              </div>
                        <br><br>


				<form class="login100-form validate-form">


					<!--<div class="wrap-input100 validate-input" data-validate = "Valid username is required">
						<input class="input100" type="text" name="Username" placeholder="Username">-->
					<!--div-->
                                        <div class="table_main">
        <%
        if(t2[1].equals("Theory")){

Connection con;
int count11=0;
int[] count5 = new int[20];
int[] count4 = new int[20];
int[] count3 = new int[20];
int[] count2 = new int[20];
int[] count1 = new int[20];
double[] avg=new double[20];
//int counto5=0,counto4=0,count03=0,counto3=0,counto2=0,count_o2=0;
ResultSet rs=null;
int j=0,sum=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");



Statement stmt=con.createStatement();
 rs=stmt.executeQuery("select * from it_theory_feedback where staffname='"+staff+"'"+" "+"and"+" "+"subcode='"+t2[0]+"'");

while(rs.next())
{
    count11++;
}
rs.beforeFirst();
for(int i=6;i<=25;i++)
{
    while(rs.next())
    {
        if(rs.getInt(i)==5)
            count5[j]++;
        else if(rs.getInt(i) == 4)
            count4[j]++;
        else if(rs.getInt(i) == 3)
            count3[j]++;
        else if(rs.getInt(i) == 2)
            count2[j]++;
        else if(rs.getInt(i) == -2)
            count1[j]++;
        sum=sum+rs.getInt(i);
    }
//    out.println(count5[j]);
    avg[j] = ((double)sum/count11)*20;
    avg[j] =  Math.round(avg[j] * 100.0) / 100.0;
    j++;
    rs.beforeFirst();
    sum=0;

}


}

catch(Exception e)
        {

        out.println(e.getMessage());
        }
 // out.println(e.getMessage());

        %>








            <table class="center">
            <tbody>
              <tr class="table_header">
              	   <th>S.No
                   
                </th>
                <th>Categories
                   
                </th>
                <th>
                  Average Mark in %
                </th>
                <th>
                  Total Submission
                </th>
                <th>
                  5
                </th>
                <th>
                  4
                </th>
                <th>
                  3
                </th>
                <th>
                  2
                </th>
                <th>
                  -2
                </th>


              </tr>

              <tr>
                <td>
                  1.</td><th>Inform about course outcomes(CO), Program Outcomes(PO's) and does the course delivery meet the CO's</th>

                <td >
                  <%out.println(avg[0]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[0]);%>
                </td>
                <td >
                <%out.println(count4[0]);%>
                </td><td >
                <%out.println(count3[0]);%>
                </td><td >
                <%out.println(count2[0]);%>
                </td><td >
                <%out.println(count1[0]);%>
                </td>


              </tr>
              <tr>
                <td>
                  2.</td><th>Preparedness for handling the class
                </th>
                 <td >
                  <%out.println(avg[1]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[1]);%>
                </td>
                <td >
                <%out.println(count4[1]);%>
                </td><td >
                <%out.println(count3[1]);%>
                </td><td >
                <%out.println(count2[1]);%>
                </td><td >
                <%out.println(count1[1]);%>
                </td>
                 </tr>
              <tr>
                <td>
                  3.</td><th>Engages the class regularly and maintains discipline
                </th>
                 <td >
                   <%out.println(avg[2]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[2]);%>
                </td>
                <td >
                <%out.println(count4[2]);%>
                </td><td >
                <%out.println(count3[2]);%>
                </td><td >
                <%out.println(count2[2]);%>
                </td><td >
                <%out.println(count1[2]);%>
                </td>

              </tr>
              <tr>
                <td>
                  4.</td><th>Speaks clearly and audibly
                  <br />
                </th>
                <td >
                   <%out.println(avg[3]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[3]);%>
                </td>
                <td >
                <%out.println(count4[3]);%>
                </td><td >
                <%out.println(count3[3]);%>
                </td><td >
                <%out.println(count2[3]);%>
                </td><td >
                <%out.println(count1[3]);%>
                </td>

              </tr>
              <tr>
                <td>
                  5.</td><th>Writes and draws legibly
                </th>
                 <td >
                  <%out.println(avg[4]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[4]);%>
                </td>
                <td >
                <%out.println(count4[4]);%>
                </td><td >
                <%out.println(count3[4]);%>
                </td><td >
                <%out.println(count2[4]);%>
                </td><td >
                <%out.println(count1[4]);%>
                </td>

              </tr>
              <tr>
                <td>
                  6.</td><th>Explain clearly and effectively the concepts with appropriate examples
                </th>
                 <td >
                  <%out.println(avg[5]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[5]);%>
                </td>
                <td >
                <%out.println(count4[5]);%>
                </td><td >
                <%out.println(count3[5]);%>
                </td><td >
                <%out.println(count2[5]);%>
                </td><td >
                <%out.println(count1[5]);%>
                </td>

              </tr>
              <tr>
                <td>
                  7.</td><th>Teach effectively suiting the student level of understanding
                </th>
                <td >
                   <%out.println(avg[6]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[6]);%>
                </td>
                <td >
                <%out.println(count4[6]);%>
                </td><td >
                <%out.println(count3[6]);%>
                </td><td >
                <%out.println(count2[6]);%>
                </td><td >
                <%out.println(count1[6]);%>
                </td>

              </tr>
              <tr>
                <td>
                  8.</td><th>Covers the syllabus at appropriate pace
                </th>
                <td >
                     <%out.println(avg[7]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[7]);%>
                </td>
                <td >
                <%out.println(count4[7]);%>
                </td><td >
                <%out.println(count3[7]);%>
                </td><td >
                <%out.println(count2[7]);%>
                </td><td >
                <%out.println(count1[7]);%>
                </td>

              </tr>
              <tr>
                <td>
                  9.</td><th>Ensures student participation in learning and problem solving in the clas
                </th>
                 <td > <%out.println(avg[8]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[8]);%>
                </td>
                <td >
                <%out.println(count4[8]);%>
                </td><td >
                <%out.println(count3[8]);%>
                </td><td >
                <%out.println(count2[8]);%>
                </td><td >
                <%out.println(count1[8]);%>
                </td>

              </tr>
              <tr>
                <td>
                  10.</td><th>Encourages questioning/raising doubts by students and answer them well
                </th>
                 <td >
                      <%out.println(avg[9]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[9]);%>
                </td>
                <td >
                <%out.println(count4[9]);%>
                </td><td >
                <%out.println(count3[9]);%>
                </td><td >
                <%out.println(count2[9]);%>
                </td><td >
                <%out.println(count1[9]);%>
                </td>

              </tr>
              <tr>
                <td>
                  11.</td><th>Motivate students by identifying the strengths/weakness and providing right level of guidance
                </th>
                <td >
                     <%out.println(avg[10]+"%");%>
                </td>
               <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[10]);%>
                </td>
                <td >
                <%out.println(count4[10]);%>
                </td><td >
                <%out.println(count3[10]);%>
                </td><td >
                <%out.println(count2[10]);%>
                </td><td >
                <%out.println(count1[10]);%>
                </td>
              </tr>
              <tr>
                <td>
                  12.</td><th>Use of modern ICT tools(LCD/Webinar/Multimedia presentation/NPTEL videos etc)
                </th>
                <td >
                      <%out.println(avg[11]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[11]);%>
                </td>
                <td >
                <%out.println(count4[11]);%>
                </td><td >
                <%out.println(count3[11]);%>
                </td><td >
                <%out.println(count2[11]);%>
                </td><td >
                <%out.println(count1[11]);%>
                </td>

              </tr>
              <tr>
                <td>
                  13.</td><th>Upload course materials in web portal at appropriate time
                </th>
                <td >
                      <%out.println(avg[12]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[12]);%>
                </td>
                <td >
                <%out.println(count4[12]);%>
                </td><td >
                <%out.println(count3[12]);%>
                </td><td >
                <%out.println(count2[12]);%>
                </td><td >
                <%out.println(count1[12]);%>
                </td>

              </tr>
              <tr>
                <td>
                  14.</td><th>Effectiveness of the course material uploaded
                </th>
                 <td >
                       <%out.println(avg[13]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[13]);%>
                </td>
                <td >
                <%out.println(count4[13]);%>
                </td><td >
                <%out.println(count3[13]);%>
                </td><td >
                <%out.println(count2[13]);%>
                </td><td >
                <%out.println(count1[13]);%>
                </td>

              </tr>
              <tr>
                <td>
                  15.</td><th>Provides helpful information for preparing and writing exam
                </th>
                <td >
                      <%out.println(avg[14]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[14]);%>
                </td>
                <td >
                <%out.println(count4[14]);%>
                </td><td >
                <%out.println(count3[14]);%>
                </td><td >
                <%out.println(count2[14]);%>
                </td><td >
                <%out.println(count1[14]);%>
                </td>

              </tr>
              <tr>
                <td>
                  16.</td><th>Prompt in evaluating and returning answer sheets,assessment sheets on time
                </th>
               <td >
                     <%out.println(avg[15]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[15]);%>
                </td>
                <td >
                <%out.println(count4[15]);%>
                </td><td >
                <%out.println(count3[15]);%>
                </td><td >
                <%out.println(count2[15]);%>
                </td><td >
                <%out.println(count1[15]);%>
                </td>

              </tr>
              <tr>
                <td>
                  17.</td><th>Provides feedback on performance improving while distributing answer sheets
                </th>
                <td >
                      <%out.println(avg[16]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[16]);%>
                </td>
                <td >
                <%out.println(count4[16]);%>
                </td><td >
                <%out.println(count3[16]);%>
                </td><td >
                <%out.println(count2[16]);%>
                </td><td >
                <%out.println(count1[16]);%>
                </td>

              </tr>
              <tr>
                <td>
                  18.</td><th>Fairness in evaluating answer sheets
                </th>
                <td >
                      <%out.println(avg[17]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[17]);%>
                </td>
                <td >
                <%out.println(count4[17]);%>
                </td><td >
                <%out.println(count3[17]);%>
                </td><td >
                <%out.println(count2[17]);%>
                </td><td >
                <%out.println(count1[17]);%>
                </td>

              </tr>
              <tr>
                <td>
                  19.</td><th>Courteous and unbiased in dealing with students
                </th>
                <td >
                      <%out.println(avg[18]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[18]);%>
                </td>
                <td >
                <%out.println(count4[18]);%>
                </td><td >
                <%out.println(count3[18]);%>
                </td><td >
                <%out.println(count2[18]);%>
                </td><td >
                <%out.println(count1[18]);%>
                </td>

              </tr>
              <tr>
                <td>
                  20.</td><th>Offer assistance and counselling to the students beyond regular class
                </th>
                 <td >
                       <%out.println(avg[19]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[19]);%>
                </td>
                <td >
                <%out.println(count4[19]);%>
                </td><td >
                <%out.println(count3[19]);%>
                </td><td >
                <%out.println(count2[19]);%>
                </td><td >
                <%out.println(count1[19]);%>
                </td>

              </tr>

            </tbody>
          </table>
                <% rs.beforeFirst();
                %><br><p id="sug">Suggestions</p><br><table class="suggest"><%
                while(rs.next()){
                    if((rs.getString(31).length())>0)
                                            %><tr><td><%  {out.print(rs.getString(31));%></td></tr><%}
                }

                %>
                    </table>
 <% }%>

         <%
        if(t2[1].equals("Laboratory")){

Connection con;
int count11=0;
int[] count5 = new int[20];
int[] count4 = new int[20];
int[] count3 = new int[20];
int[] count2 = new int[20];
int[] count1 = new int[20];
double[] avg=new double[20];
//int counto5=0,counto4=0,count03=0,counto3=0,counto2=0,count_o2=0;
ResultSet rs=null;
int j=0,sum=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");



Statement stmt=con.createStatement();
 rs=stmt.executeQuery("select * from it_lab_feedback where staff='"+staff+"'"+" "+"and"+" "+"sub='"+t2[0]+"'");
while(rs.next())
{
    count11++;
}
rs.beforeFirst();
for(int i=9;i<=18;i++)
{
    while(rs.next())
    {
        if(rs.getInt(i)==5)
            count5[j]++;
        else if(rs.getInt(i) == 4)
            count4[j]++;
        else if(rs.getInt(i) == 3)
            count3[j]++;
        else if(rs.getInt(i) == 2)
            count2[j]++;
        else if(rs.getInt(i) == -2)
            count1[j]++;
        sum=sum+rs.getInt(i);
    }
//    out.println(count5[j]);
    avg[j] = ((double)sum/count11)*20;
    avg[j] =  Math.round(avg[j] * 100.0) / 100.0;
    j++;
    rs.beforeFirst();
    sum=0;

}


}

catch(Exception e)
        {

        out.println(e.getMessage());
        }
 // out.println(e.getMessage());

        %>








            <table>
            <tbody>
              <tr class="table_header">
              	   <th>S.No
                   
                </th>
                <th>Categories
                   
                </th>
                <th>
                  Average Mark in %
                </th>
                <th>
                  Total Submission
                </th>
                <th>
                  5
                </th>
                <th>
                  4
                </th>
                <th>
                  3
                </th>
                <th>
                  2
                </th>
                <th>
                  -2
                </th>


              </tr>

              <tr>
                <td>
                  1.</td><th>Inform about course outcomes(CO), Program Outcomes(PO's) and does the course delivery meet the CO's</th>

                <td >
                  <%out.println(avg[0]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[0]);%>
                </td>
                <td >
                <%out.println(count4[0]);%>
                </td><td >
                <%out.println(count3[0]);%>
                </td><td >
                <%out.println(count2[0]);%>
                </td><td >
                <%out.println(count1[0]);%>
                </td>


              </tr>
              <tr>
                <td>
                  2.</td><th>Preparedness for handling the class
                </th>
                 <td >
                  <%out.println(avg[1]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[1]);%>
                </td>
                <td >
                <%out.println(count4[1]);%>
                </td><td >
                <%out.println(count3[1]);%>
                </td><td >
                <%out.println(count2[1]);%>
                </td><td >
                <%out.println(count1[1]);%>
                </td>
                 </tr>
              <tr>
                <td>
                  3.</td><th>Engages the class regularly and maintains discipline
                </th>
                 <td >
                   <%out.println(avg[2]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[2]);%>
                </td>
                <td >
                <%out.println(count4[2]);%>
                </td><td >
                <%out.println(count3[2]);%>
                </td><td >
                <%out.println(count2[2]);%>
                </td><td >
                <%out.println(count1[2]);%>
                </td>

              </tr>
              <tr>
                <td>
                  4.</td><th>Helping students the students in conducting the experiments through demonstrations
                  <br />
                </th>
                <td >
                   <%out.println(avg[3]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[3]);%>
                </td>
                <td >
                <%out.println(count4[3]);%>
                </td><td >
                <%out.println(count3[3]);%>
                </td><td >
                <%out.println(count2[3]);%>
                </td><td >
                <%out.println(count1[3]);%>
                </td>

              </tr>
              <tr>
                <td>
                  5.</td><th>Help the student to explore the area of study involved in the experiment
                </th>
                 <td >
                  <%out.println(avg[4]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[4]);%>
                </td>
                <td >
                <%out.println(count4[4]);%>
                </td><td >
                <%out.println(count3[4]);%>
                </td><td >
                <%out.println(count2[4]);%>
                </td><td >
                <%out.println(count1[4]);%>
                </td>

              </tr>
              <tr>
                <td>
                  6.</td><th>Takes interest in conducting viva for clear understanding of the experiment
                </th>
                 <td >
                  <%out.println(avg[5]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[5]);%>
                </td>
                <td >
                <%out.println(count4[5]);%>
                </td><td >
                <%out.println(count3[5]);%>
                </td><td >
                <%out.println(count2[5]);%>
                </td><td >
                <%out.println(count1[5]);%>
                </td>

              </tr>
              <tr>
                <td>
                  7.</td><th>Regular checking of the observation and records
                </th>
                <td >
                   <%out.println(avg[6]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[6]);%>
                </td>
                <td >
                <%out.println(count4[6]);%>
                </td><td >
                <%out.println(count3[6]);%>
                </td><td >
                <%out.println(count2[6]);%>
                </td><td >
                <%out.println(count1[6]);%>
                </td>

              </tr>
              <tr>
                <td>
                  8.</td><th>Provide helpful information for preparing and writing examination
                </th>
                <td >
                     <%out.println(avg[7]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[7]);%>
                </td>
                <td >
                <%out.println(count4[7]);%>
                </td><td >
                <%out.println(count3[7]);%>
                </td><td >
                <%out.println(count2[7]);%>
                </td><td >
                <%out.println(count1[7]);%>
                </td>

              </tr>
              <tr>
                <td>
                  9.</td><th>Prompt and Fairness in evaluating and returning answer sheets,assessment sheets on time
                </th>
                 <td > <%out.println(avg[8]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[8]);%>
                </td>
                <td >
                <%out.println(count4[8]);%>
                </td><td >
                <%out.println(count3[8]);%>
                </td><td >
                <%out.println(count2[8]);%>
                </td><td >
                <%out.println(count1[8]);%>
                </td>

              </tr>
              <tr>
                <td>
                  10.</td><th>Courteous and unbiased in dealing with students
                </th>
                 <td >
                      <%out.println(avg[9]+"%");%>
                </td>
                <td >
                <%out.println(count11);%>
                </td>
                <td >
                <%out.println(count5[9]);%>
                </td>
                <td >
                <%out.println(count4[9]);%>
                </td><td >
                <%out.println(count3[9]);%>
                </td><td >
                <%out.println(count2[9]);%>
                </td><td >
                <%out.println(count1[9]);%>
                </td>

              </tr>

            </tbody>
          </table>
                <% rs.beforeFirst();
               %><br><p id="sug">Suggestions</p><br><table class="suggest"><%
                while(rs.next()){
                    if((rs.getString(22).length())>0)
                                         %><tr><td><%  {out.print(rs.getString(22));%></td></tr><%}
                }
                %>
               </table>
 <% }%>









        </div>


        	<br>






				<!-- 	<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					 -->


					<!--<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>-->

					<!--<div class="text-center p-t-136">
						<a class="txt2" href="#">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>-->
				</form>
			</div>
		</div>
                <button onclick="display();" class="btn btn-danger mybtn">Download</button>
                <br><br>
	</div>
        <script>
        function display()
        {
            window.print();
        }
        </script>




<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
