
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ay=request.getParameter("ay");
    String ys=request.getParameter("yc1");
    String dept=request.getParameter("dp1");
    String sem=request.getParameter("sem");
    String sec=request.getParameter("s1");
    String sub=request.getParameter("sub");
    String staff=request.getParameter("staff");
    String tl=request.getParameter("tl");
    int i=1;
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
    #l1{
        margin-left: 20%;
        display:inline-block;
    }
    #l2{
        margin-left: 5%;
          display:inline-block;
    }
    #l3{
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
  padding: 7px;
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
        <div class="limiter">
	<div class="container-login100">
			<div class="top-logo"><img src="images/image.png" alt="IMG" height="60%" width="60%" ></div>
			<div class="wrap-login100">

                                    <label id="l1">Academic Year : <%out.println("2019-2020");%></label>
                                    <label id="l2">Year:<%out.println(" "+ys);%></label>

                                     <label id="l2">Semester:<%out.println(" "+sem);%></label>


                                      <label id="l3">Department:<%out.println(" "+dept);%></label>


                                      <label id="d1">Section:<%out.println(" "+sec);%></label>


                        </div>

                        <br>

                        <br>
			<span class="login100-form-title">
						 Class Wise Report
					</span><br><br>
                                 <span class="login100-form-title">
						Theory
					</span><br><br>
                                 <table border=2 class="center">
            <tbody> <tr class="table_header"><th>S.No</th><th>Subject code & Name</th><th>Staff Name</th><th>Mark Obtained</th></tr>
        <%
     String dept1=request.getParameter("dp1");
     String sec1=request.getParameter("s1");
     String year=request.getParameter("yc1");
     //String sem=request.getParameter("sem");
    // out.println(dept1+sub1);

     Connection con;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_system_tech","root","root");
//out.println(con);
Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
ResultSet rs=null,rs1=null;
if(dept1.equals("IT"))
{
    rs1=stmt1.executeQuery("select distinct staffname as st, sub_type as sb from it_timetable where dept='"+dept1+"'"+" "+"and"+" "+"sem='"+sem+"'"+" "+"and"+" "+"section='"+sec1+"'");
}
else if(dept1.equals("CSE"))
{
    rs1=stmt1.executeQuery("select distinct staffname as st, sub_type as sb from cse_timetable where dept='"+dept1+"'"+" "+"and"+" "+"sem='"+sem+"'"+" "+"and"+" "+"section='"+sec1+"'");
}
else if(dept1.equals("EEE"))
{
    rs1=stmt1.executeQuery("select distinct staffname as st, sub_type as sb from eee_timetable where dept='"+dept1+"'"+" "+"and"+" "+"sem='"+sem+"'"+" "+"and"+" "+"section='"+sec1+"'");
}
else if(dept1.equals("ECE"))
{
    rs1=stmt1.executeQuery("select distinct staffname as st, sub_type as sb from ece_timetable where dept='"+dept1+"'"+" "+"and"+" "+"sem='"+sem+"'"+" "+"and"+" "+"section='"+sec1+"'");
}
else if(dept1.equalsIgnoreCase("Civil"))
{
    rs1=stmt1.executeQuery("select distinct staffname as st, sub_type as sb from civil_timetable where dept='"+dept1+"'"+" "+"and"+" "+"sem='"+sem+"'"+" "+"and"+" "+"section='"+sec1+"'");
}
else if(dept1.equalsIgnoreCase("Mech"))
{
    rs1=stmt1.executeQuery("select distinct staffname as st, sub_type as sb from mech_timetable where dept='"+dept1+"'"+" "+"and"+" "+"sem='"+sem+"'"+" "+"and"+" "+"section='"+sec1+"'");
}



while(rs1.next())
{
    String sname=rs1.getString(1);
    String sub_type=rs1.getString(2);
   if(sub_type.equals("Theory"))
       {
       rs=stmt.executeQuery("select subcode as sb, staffname as s,round(avg(avg1)) as a from it_theory_feedback where dept='"+dept1+"'"+" "+"and"+" "+"semester='"+sem+"'"+" "+"and"+" "+"section='"+sec1+"'"+" "+"and"+" "+"staffname='"+sname+"' group by subcode");
   }
       else break;

while(rs.next())
{
%>
<tr><td><%out.println(i);%></td><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td></tr>
<%i=i+1;%>
<%
}
    %>
<%

}
rs1.beforeFirst();%>
         </tbody>
          </table>
         <br>
        <span class="login100-form-title">
						Laboratory
					</span><br><br>
          <table border=2 class="center">
            <tbody> <tr class="table_header"><th>S.No</th><th>Subject code & Name</th><th>Staff Name</th><th>Mark Obtained</th></tr>
         <%
         i=1;
         while(rs1.next())
         {
             String sname=rs1.getString(1);
                String sub_type=rs1.getString(2);

   if(sub_type.equals("Laboratory")){
        rs=stmt.executeQuery("select sub as sb,staff as s, round(avg(avg1)) as a from it_lab_feedback where dept='"+dept1+"'"+" "+"and"+" "+"sem='"+sem+"'"+" "+"and"+" "+"sec='"+sec1+"'"+" "+"and"+" "+"staff='"+sname+"'group by sub");
              }
        while(rs.next())
                         {
             %>
             <tr><td><%out.println(i);%></td><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td></tr>
                <%i=i+1;%>
             <%
            }




         }






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
          </table><br>
                <button onclick="display();" class="btn btn-danger mybtn">Download</button>
                <br><br>
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
