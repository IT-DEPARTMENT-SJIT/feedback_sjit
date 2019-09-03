
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ay=request.getParameter("ay");
    String ys=request.getParameter("ys");
    String dept=request.getParameter("dd1");
    String sem1=request.getParameter("sem");
    String sec=request.getParameter("sec");
    String sub=request.getParameter("sub");
    String staff=request.getParameter("staff");
    String tl=request.getParameter("tl");
    %>
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
<!--	<link rel="stylesheet" type="text/css" href="css/ind_staff_report.css">-->
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
    table.center{
        margin-left:auto;
        margin-right:auto;
    }
    span{
        font-size: 20px;
        font-weight: bold;
    }
    th
    {
        text-align: center;
    }
    #d1{
        font-size: 25px;
        font-weight: bold;
    }
</style>
</head>
    <body>
        <div class="limiter">
	<div class="container-login100">
			<div class="top-logo"><img src="images/image.png" alt="IMG" height="60%" width="60%" ></div>
			<div class="wrap-login100">

                        <label id="d1">Department:<%out.println(" "+dept);%></label><br>
                        <span class="login100-form-title">Academic Year : 2019-2020 (ODD Semester)</span><br>
			<span class="login100-form-title">Department Wise Report</span><br>
                        <span class="login100-form-title">Theory</span><br><br>
                        <table border=2 class="center">
            <tbody> <tr class="table_header"><th>S.No</th><th>Staff Name</th><th>Semester</th><th>Department</th><th>Section</th><th>Subject Code and Name</th><th>Mark Obtained</th></tr>
        <%
     String dept1=request.getParameter("dd1");

    // out.println(dept1+sub1);
     int i=1;
     String d1,sem11,sec11;

     Connection con;
     ResultSet rs=null,rs1=null,rs2=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
//out.println(con);
Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
Statement stmt2=con.createStatement();

if(dept1.equals("IT"))
{
    rs1=stmt1.executeQuery("select name as s from it_staff where dept='"+dept1+"'");
}
else if(dept1.equals("CSE"))
{
    rs1=stmt1.executeQuery("select name as s from cse_staff where dept='"+dept1+"'");
}
else if(dept1.equals("EEE"))
{
    rs1=stmt1.executeQuery("select name as s from eee_staff where dept='"+dept1+"'");
}
else if(dept1.equals("ECE"))
{
    rs1=stmt1.executeQuery("select name as s from ece_staff where dept='"+dept1+"'");
}
else if(dept1.equalsIgnoreCase("CIVIL"))
{
    rs1=stmt1.executeQuery("select name as s from civil_staff where dept='"+dept1+"'");
}
else if(dept1.equalsIgnoreCase("MECH"))
{
    rs1=stmt1.executeQuery("select name as s from mech_staff where dept='"+dept1+"'");
}
else if(dept1.equalsIgnoreCase("Mathematics"))
{
    rs1=stmt1.executeQuery("select name as s from maths_staff where dept='"+dept1+"'");
}
else if(dept1.equalsIgnoreCase("Chemistry"))
{
    rs1=stmt1.executeQuery("select name as s from chemistry_staff where dept='"+dept1+"'");
}
else if(dept1.equalsIgnoreCase("Physics"))
{
    rs1=stmt1.executeQuery("select name as s from physics_staff where dept='"+dept1+"'");
}
else if(dept1.equalsIgnoreCase("English"))
{
    rs1=stmt1.executeQuery("select name as s from english_staff where dept='"+dept1+"'");
}



while(rs1.next())
{

 String sname = rs1.getString(1);
 rs=stmt.executeQuery("select subcode as sb,staffname as s, round(avg(avg1)) as a,semester as sem,dept as dep,section as sec from it_theory_feedback where staffname='"+sname+"'group by subcode,sec order by sem");
//ResultSet rs=stmt.executeQuery();

//sb.append("<select class='form-control input100' id='sub' onchange='sltdept2();'>");
//out.println(rs.getFetchSize());
//out.println("<div class='col-4 mx-auto' >"+"<label>Subject Code & Subject Name</label>"+"<select class='form-control input100' id='sub'>");


while(rs.next())
{


%>
<tr><td><%out.println(i);%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(1)%></td><td><%=rs.getString(3)%></td></tr>
<%  i=i+1;%>
<%

}
 }
%> </tbody>
        </table>
        <br><br>
         <span class="login100-form-title">Laboratory</span><br><br>
                        <table border=2 class="center">
            <tbody> <tr class="table_header"><th>S.No</th><th>Staff Name</th><th>Semester</th><th>Department</th><th>Section</th><th>Subject Code and Name</th><th>Mark Obtained</th></tr><%
rs1.beforeFirst();
i=1;
while(rs1.next())
{
     String sname = rs1.getString(1);
  rs2=stmt2.executeQuery("select distinct sub as sb,staff as s,round(avg(avg1)) as a ,sem as sem,dept as dep,sec as sec from it_lab_feedback where staff='"+sname+"' group by sub,sec order by sem");
while(rs2.next())
{


 %>

 <tr><td><%out.println(i);%></td><td><%=rs2.getString(2)%><td><%=rs2.getString(4)%></td><td><%=rs2.getString(5)%></td><td><%=rs2.getString(6)%></td></td><td><%=rs2.getString(1)%></td><td><%=rs2.getString(3)%></td></tr>
 <%i=i+1;

}





%>
<%}%>

         <%

}
catch(Exception e)
        {
        out.println(e.getMessage());
        }

/*sb.append("<option value=");
sb.append("\""+rs.getString(1)+"\"");
sb.append(rs.getString(1)+"</option>");*/


//out.println("</select></div>");

//sb.append("</select>");
//String ss=sb.toString();*/
        %>
          </tbody>
        </table>
          <br>
            <button onclick="display();" class="btn btn-danger mybtn">Download</button>
          <br><br>
        </div>

        </div>


                        </div>

			<script>
        function display()
        {
            window.print();
        }
        </script>



<div id="doc">


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
			</div>
		</div>
	</div>


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
