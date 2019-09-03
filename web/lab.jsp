<%--
    Document   : lab
    Created on : 26 Jul, 2019, 11:31:47 PM
    Author     : Rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
	<title>Laboratory Feedback</title>
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
	<link rel="stylesheet" type="text/css" href="css/lab.css">
<!--===============================================================================================-->
</head>
   <body>
        <%
    String dept=request.getParameter("dept");
     String sec=request.getParameter("sec");
      String ys=request.getParameter("ys");
       String ay=request.getParameter("ay");
        String sub=request.getParameter("sub");
     String staff=request.getParameter("staff");
     String tl=request.getParameter("tl");
     String sem=request.getParameter("sem");
     String uname=(String)session.getAttribute("user");
//       out.println(uname);

%>

	<div class="limiter">
		<div class="container-login100">
			<div class="top-logo"><img src="images/image.png" alt="IMG" height="60%" width="60%" ></div>
			<div class="wrap-login100">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Academic Year:<%out.println(" "+ay);%></label>
                                </div>
                                <div class="col-md-6">
                                     <label style="margin-left: 30%;">Year of study:<%out.println(" "+ys);%></label>
                                </div>
                                <div class="col-md-6">
                                      <label>Semester:<%out.println(" "+sem);%></label>
                                </div>
                                <div class="col-md-6">
                                      <label id="d1" style="margin-left: 30%;">Department:<%out.println(" "+dept);%></label>
                                 </div>

      </div>
             <div class="row">
                 <div class="col-md-6" >
                                    <label>Section:<%out.println(" "+sec);%></label>
                                </div>
                                <div class="col-md-6">
                                     <label>Subject code and name:<%out.println(" "+sub);%></label>
                                </div>
                                <div class="col-md-6">
                                      <label>Staff :<%out.println(" "+staff);%></label>
                                </div>
                                <div class="col-md-6">
                                      <label>Theory or Laboratory:<%out.println(" "+tl);%></label>
                                 </div>
              </div>
			<span class="login100-form-title">
						Laboratory Staff Feedback
					</span>
				<form class="login100-form validate-form" action="http://localhost:8080/final_Updated/staff_lab_evaluation.jsp" method="post">

 <input type="hidden" id="dh1" name="dept" value="<%=dept%>"/>
 <input type="hidden" name="sec" value="<%=sec%>"/>
   <input type="hidden" name="ys" value="<%=ys%>"/>
   <input type="hidden" name="ay" value="<%=ay%>"/>
   <input type="hidden" name="sub" value="<%=sub%>"/>
   <input type="hidden" name="staff" value="<%=staff%>"/>
   <input type="hidden" name="tl" value="<%=tl%>"/>
   <input type="hidden" name="sem" value="<%=sem%>"/>
					<!--<div class="wrap-input100 validate-input" data-validate = "Valid username is required">
						<input class="input100" type="text" name="Username" placeholder="Username">-->
					<!--div-->
                                        <div class="table_main" style="margin-left: 5%;">
          <table>
            <tbody>
              <tr class="table_header">
              	   <th>S.No
                   
                </th>
                <th>Categories
                   
                </th>
                <th>
                  Strongly Agree
                </th>
                <th>
                  Agree
                </th>
                <th >
                  Neutral
                </th>
                <th>
                  Generally disagree
                </th>
                <th >
                  Disagree
                </th>
              </tr>

              <tr>
                <td>
                  1.</td><th>Inform about course outcomes(CO), Program Outcomes(PO's) and does the course delivery meet the CO's</th>

                <td >
                  <input type="radio" name="selection[0]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[0]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[0]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[0]" value="Generally disagree" required="" />
                </td>
                <td style="text-align:center" class="form-matrix-values">
                  <input type="radio" name="selection[0]" value="Disagree" required="" />
                </td>
              </tr>
              <tr>
                <td>
                  2.</td><th>Preparedness for handling the class
                </th>
                 <td >
                  <input type="radio" name="selection[1]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[1]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[1]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[1]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[1]" value="Disagree" required="" />
                </td> </tr>
              <tr>
                <td>
                  3.</td><th>Engages the class regularly and maintains discipline
                </th>
                 <td >
                  <input type="radio" name="selection[2]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[2]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[2]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[2]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[2]" value="Disagree" required="" />
                </td>
              </tr>
              <tr>
                <td>
                  4.</td><th>Helping students the students in conducting the experiments through demonstrations
                  <br />
                </th>
                <td >
                  <input type="radio" name="selection[3]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[3]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[3]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[3]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[3]" value="Disagree" required="" />
                </td>
              </tr>
              <tr>
                <td>
                  5.</td><th>Help the student to explore the area of study involved in the experiment
                </th>
                 <td >
                  <input type="radio" name="selection[4]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[4]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[4]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[4]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[4]" value="Disagree" required="" />
                </td>
              </tr>
              <tr>
                <td>
                  6.</td><th>Takes interest in conducting viva for clear understanding of the experiment
                </th>
                 <td >
                  <input type="radio" name="selection[5]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[5]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[5]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[5]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[5]" value="Disagree" required="" />
                </td>
              </tr>
              <tr>
                <td>
                  7.</td><th>Regular checking of the observation and records
                </th>
                <td >
                  <input type="radio" name="selection[6]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[6]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[6]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[6]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[6]" value="Disagree" required="" />
                </td>
              </tr>
              <tr>
                <td>
                  8.</td><th>Provide helpful information for preparing and writing examination
                </th>
                <td >
                  <input type="radio" name="selection[7]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[7]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[7]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[7]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[7]" value="Disagree" required="" />
                </td>
              </tr>
              <tr>
                <td>
                  9.</td><th>Prompt and Fairness in evaluating and returning answer sheets,assessment sheets on time
                 <td >
                  <input type="radio" name="selection[8]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[8]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[8]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[8]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[8]" value="Disagree" required="" />
                </td>
              </tr>
                <tr>
                <td>
                  10.</td><th>Courteous and unbiased in dealing with students
                </th>
                <td >
                  <input type="radio" name="selection[9]" value="Strongly Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[9]" value="Agree" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[9]" value="Neutral" required="" />
                </td>
                <td >
                  <input type="radio"   name="selection[9]" value="Generally disagree" required="" />
                </td>
                <td >
                  <input type="radio" name="selection[9]" value="Disagree" required="" />
                </td>
              </tr>


            </tbody>
          </table>
           <br>
          <label style="float: left;padding:0px;margin:0px">Suggestion :</label><br>
          <textarea name="selection[13]" class="text-area"></textarea>
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
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" action = "first_page.html">
							Submit
						</button>
					</div>

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
