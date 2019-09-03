<%--
    Document   : theory
    Created on : 26 Jul, 2019, 11:32:11 PM
    Author     : Rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
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
        margin-left: 30%;
        display:inline-block;
    }
    #l2{
        margin-left: 5%;
          display:inline-block;
    }

    #d1{
        margin-left: 5%;
          display:inline-block;
    }
table
{
    table-layout: fixed;
}


    table.center{
    margin-left: auto;
    margin-right: auto;
}
.table_main{
  font-family: Poppins-Medium;
  display: medium;
  justify-content:center;
  margin-left: 6%;
  text-align: center;
  font-size: 15px;
}
.table_header th{
  text-align: center;
}
.table_main th,td{
  border: 2px solid;
  justify-content: center;
}

.table_main td{
  padding: 5px;
}
label
{
    margin-left:25%;
    float:left;
    font-weight:bold;
}
span
{
    font-size: 20px;
    font-weight: bold;
}
</style>
</head>
    <body>
        <%
    String dept=request.getParameter("dept");
    String staff=request.getParameter("sub1");

%>

	<div class="limiter">
		<div class="container-login100">
			<div class="top-logo"><img src="images/image.png" alt="IMG" height="60%" width="60%" ></div>



                                      <label id="l1">Academic Year :<%out.println("2019-2020");%></label>


                                      <label id="d1" >Department:<%out.println(" "+dept);%></label>


                                      <label id="l2">Staff :<%out.println(" "+staff);%></label>


      </div>
                                      <br><br>


			<span class="login100-form-title" style="margin-left:50px;">
						 Individual Staff Report
					</span>

				<form class="login100-form validate-form">


					<!--<div class="wrap-input100 validate-input" data-validate = "Valid username is required">
						<input class="input100" type="text" name="Username" placeholder="Username">-->
					<!--div-->
                                        <div class="table_main" align="center">

             <%
                  Connection con;
 try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
Statement stmt=con.createStatement(); 
ResultSet rs = null;
int sno = 1;
rs = stmt.executeQuery("select subcode as sb, dept as d, yearofstudy as ys, semester as sem, section as sec,round(avg(avg1)) as a from it_theory_feedback where staffname='"+staff+"' group by subcode,section");
if(!(rs.next() == false)){
    %>
             <span class="login100-form-title">
						Theory
					</span>
          <table class="center">
            <tbody>
              <tr class="table_header">
              	   <th>S.No</th>
                <th>Subject code & Name</th>
                <th>  Department </th>
                <th>Year</th> 
                <th>Semester</th>
                <th>Section </th>
                <th>Percentage </th>
             </tr>
                                            <%
                                            rs.beforeFirst();
while(rs.next()){
   %> <tr><td><%out.println(sno++);%></td><%
    for(int i = 1;i<7;++i){
   %><td><%= rs.getString(i)%></td><%
    }
   %></tr><%
}
  }%>
 </tbody>
          </table>



<%
    rs = stmt.executeQuery("select sub as sb, dept as d, ys as ys, sem as sem, sec as sec,round(avg(avg1)) as a from it_lab_feedback where staff='"+staff+"' group by sub,sec");
    sno = 1;
    if(!(rs.next()==false)){
        %>
        <br>
        <span class="login100-form-title">
						Laboratory
					</span>
        <table class="center">
            <tbody>
              <tr class="table_header">
              	   <th>S.No</th>
                <th>Subject code & Name</th>
                <th>  Department </th>
                <th>Year</th> 
                <th>Semester</th>
                <th>Section </th>
                <th>Percentage </th>
             </tr>
        <%
        rs.beforeFirst();
    while(rs.next()){
   %> <tr><td><%out.println(sno++);%></td><%
    for(int i = 1;i<7;++i){
   %><td><%= rs.getString(i)%></td><%
    }
   %></tr><%
}
    }%>
    <%
                    }

        catch(Exception e)
        {
        out.println(e.getMessage());
        }
               %>


















            </tbody>
          </table>

        </div>










				</form>

		</div>
               <br><br>
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
