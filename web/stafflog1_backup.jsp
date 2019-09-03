<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<!DOCTYPE html>
<%@ page import="java.sql.*;" %>


  <%
//String user= request.getParameter("user");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
//HttpSession sess=request.getSession(true);

String user=(String)session.getAttribute("name");
String yos=" ",deptbelong=" ";
//out.println(user);
int len=0;
len=user.length();
//out.println(len);
if(user==null || user.equals("null"))
{
   %> <script> location.href="login.html";</script> <%
}
else if(len < 8){

    %> <script>alert("INVALID USERNAME"); window.location="login.html";</script> <%
}
else{
    //out.println(user);
    session.setAttribute("name", user);
     if(len==8 || len == 9)
            {yos=String.valueOf(user.charAt(0))+String.valueOf(user.charAt(1));
      deptbelong=String.valueOf(user.charAt(len-6))+String.valueOf(user.charAt(len-5));
      //out.print(yos);
      //out.print(deptbelong);
     }
        else if(len==12)
     {
        yos=String.valueOf(user.charAt(4))+String.valueOf(user.charAt(5));
      deptbelong=String.valueOf(user.charAt(6))+String.valueOf(user.charAt(7))+String.valueOf(user.charAt(8));
      //out.print(yos);
     // out.print(deptbelong);
     }
    else
               {

         %> <script>alert("INVALID USERNAME"); window.location="login.html"; </script> <%
    }

           }









%>







<html lang="en">
<head>
	<title>Theory Feedback</title>
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
	<link rel="stylesheet" type="text/css" href="css/theoryfb.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--===============================================================================================-->
<style media="screen">
    a{
        padding: 11px 80px ;
        text-decoration: none;
        color: white;
        background-color:red;
        border-radius:30px
    }
a:hover
{
    /*color:yellow;*/
    opacity: 0.7;
    color:#ffffff;

}

</style>
<script>
    function sess_out()
    {
        //var user=null;
        //session.invalidate();
        //session.removeAttribute("name");
        //session.setAttribute("name", user);
        //alert(user);
    }
    function sltdept1() {

var dept = $("select#dept").val();
var sem = $("select#sem").val();
var sec = $("select#sec").val();
//var usr = user;
//alert(usr);

                //var dept = $("select#dept").val();
              //  var batch = $("select#batch").val();
               // var $('s1') = document.getElementById("dept").value;
               //var s2 = document.getElementById("sem").value;
             //   var s3= document.getElementById("sec").value;
//document.write("hai")
//alert(dept+sem+sec);

 callAjaxFunctionlab(dept,sem,sec);

            }

            /* function called to do Ajax Request */
            function callAjaxFunctionlab(dept,sem,sec) {
            //    alert(dept+sem+sec);

                var url="http://localhost:8080/final_Updated/index1_backup.jsp?dept="+dept+"&"+"sem="+sem+"&"+"sec="+sec;    //+"&"+"user="+usr;
             //   alert(url);

  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      response= this.responseText;
      //alert(response);
      updatepagelab(response);
    }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
            }
            function updatepagelab(response) {
               // alert(response);
               $('select#selectdummy').hide();
               $('input#staff').hide();

              // $('div#subcode').innerHTML=response;
                document.getElementById("subcode").innerHTML = response;
               // $('subcode').show();
            }


function sltdept2()
{

    var sub1 = $("select#subcode").val();

    var dept = $("select#dept").val();
    var sem = $("select#sem").val();
    var sec = $("select#sec").val();
   // alert(sub1);
   // alert($(user));




//alert();
                //var dept = $("select#dept").val();
              //  var batch = $("select#batch").val();
               // var $('s1') = document.getElementById("dept").value;
               //var s2 = document.getElementById("sem").value;
             //   var s3= document.getElementById("sec").value;
//document.write("hai")
//alert(dept+sem+sec);

 callAjaxFunction(sub1,dept,sem,sec);

            }

            /* function called to do Ajax Request */
            function callAjaxFunction(sub1,dept,sem,sec) {

                var url="http://localhost:8080/final_Updated/check_backup.jsp?dept="+dept+"&"+"sem="+sem+"&"+"sec="+sec+"&"+"sub="+sub1;
                //var url="http://localhost:8080/cs/check.jsp?sub="+subcode[0];

           var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      response= this.responseText;
     // alert(response);
      updatestaff(response);
    }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
            }
            function updatestaff(response) {
               // alert(response);
               //$('select#selectdummy').hide();
              // $('input#staff').hide();

              // $('div#subcode').innerHTML=response;
                document.getElementById("sub1").innerHTML = response;
               // $('subcode').show();

//            alert(url);
//            window.location.href=(url);

            }
 //---------------------------------------------check for duplication and theory or lab-------------------------------------//
 function checkstaff()
{

    var sub = $("select#subcode").val();
    var dept = $("select#dept").val();
    var sem = $("select#sem").val();
    var sec = $("select#sec").val();
    var staff=$("select#sub1").val();
  //  alert(sub+dept+sem+sec);
   // alert($(user));
   //alert(staff);




//alert();
                //var dept = $("select#dept").val();
              //  var batch = $("select#batch").val();
               // var $('s1') = document.getElementById("dept").value;
               //var s2 = document.getElementById("sem").value;
             //   var s3= document.getElementById("sec").value;
//document.write("hai")
//alert(dept+sem+sec);

 callAjaxFunctionstaff(sub,dept,sem,sec,staff);

            }

            /* function called to do Ajax Request */
            function callAjaxFunctionstaff(sub,dept,sem,sec,staff) {

                var url="http://localhost:8080/final_Updated/staff_check.jsp?dept="+dept+"&"+"sem="+sem+"&"+"sec="+sec+"&"+"sub="+sub+"&"+"staff="+staff;
                //var url="http://localhost:8080/cs/check.jsp?sub="+subcode[0];

           var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      response= this.responseText;
     // alert(response);
      updatestaff123(response);
    }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
            }
            function updatestaff123(response) {
               // alert(response);
               //$('select#selectdummy').hide();
              // $('input#staff').hide();

              // $('div#subcode').innerHTML=response;
                document.getElementById("thelab").innerHTML = response;
               // $('subcode').show();

//            alert(url);
//            window.location.href=(url);

            }






//
function TLnavi()
{
var ay1 = $("select#ay").val();
var ys1 = $("select#ys").val();
var dept1 = $("select#dept").val();
var sem1 = $("select#sem").val();
var sec1 = $("select#sec").val();
var sub1 = $("select#subcode").val();
var staff1 = $("select#sub1").val();
var tl1 = $("select#thelab").val();



//alert(ay1+ys1+staff1+tl1+dept1+sem1+sec1+sub1);
                //var dept = $("select#dept").val();
              //  var batch = $("select#batch").val();
               // var $('s1') = document.getElementById("dept").value;
               //var s2 = document.getElementById("sem").value;
             //   var s3= document.getElementById("sec").value;
//document.write("hai")
//alert(dept+sem+sec);

 callAjaxFunctionlab1(ay1,ys1,staff1,tl1,dept1,sem1,sec1,sub1);

            }

            /* function called to do Ajax Request */
            function callAjaxFunctionlab1(ay1,ys1,staff1,tl1,dept1,sem1,sec1,sub1) {
            //
            //  alert(dept1+sem1+sec1+sub1);
             var url;

             if(tl1=="Theory")
             {
                 url="http://localhost:8080/final_Updated/theory_backup.jsp?dept="+dept1+"&"+"sem="+sem1+"&"+"sec="+sec1+"&"+"sub="+sub1+"&"+"ay="+ay1+"&"+"ys="+ys1+"&"+"staff="+staff1+"&"+"tl="+tl1;
            }
            else
            {
              url="http://localhost:8080/final_Updated/lab.jsp?dept="+dept1+"&"+"sem="+sem1+"&"+"sec="+sec1+"&"+"sub="+sub1+"&"+"ay="+ay1+"&"+"ys="+ys1+"&"+"staff="+staff1+"&"+"tl="+tl1;

            }
           // alert(url);
            window.location.href=(url);
            }


//
//==








//
</script>


</head>
<body >






	<div class="limiter">
		<div class="container-login100">
			<div class="top-logo"><img src="images/image.png" alt="IMG" height="60%" width="60%" >
			</div>

			<div class="wrap-login100" style="width:70%;select{padding:0px;}">
			<span class="login100-form-title" style="font-family:Copperplate Gothic Light;color:purple; font-weight: bold">
						Theory Staff Feedback
					</span>
					<form class="wrap-input100">
						<div class="form-row align-items-center my-4">
						<div class="col-4 col-sm-4 mx-auto">
                                                    <center><label style="font-family:Copperplate Gothic Light;color:purple; font-weight: bold">Academic Year</label> </center>
						<select class="form-control input100" id="ay">
											<%if(yos.equals("16")){%>
											<option vaule="A">2016-2020</option>
                                                                                        <%}else if(yos.equals("17")){%>
											<option vaule="A">2017-2021</option>
                                                                                        <%}else if(yos.equals("18")){%>
											<option vaule="A">2018-2022</option>
                                                                                        <%}else if(yos.equals("19")){%>
											<option vaule="A">2019-2023</option>    <% } %>
									</select>
									</div>
										<div class="col-4 col-sm-4 mx-auto">
                                                                                    <center><label style="font-family:Copperplate Gothic Light;color:purple; font-weight: bold;">Year of Study</label></center>
						<select id="ys" class="form-control input100">
											<%if(yos.equals("19")){%>
											<option value="I">I</option>
                                                                                        <%}else if(yos.equals("18")){%>
											<option value="II">II</option>
                                                                                        <%}else if(yos.equals("17")){%>
											<option value="III">III</option>
                                                                                        <%}else if(yos.equals("16")){%>
											<option value="IV">IV</option>  <% } %>
								</select>
							 </div>
								<div class="col-4 col-sm-4 mx-auto">
									 <center><label style="font-family:Copperplate Gothic Light;color:purple; font-weight: bold">Semester</label> </center>
						<select  id="sem" class="form-control input100" >

                                                                                        <%if(yos.equals("19")){%>
											<option value="I">I</option>
                                                                                        <%}else if(yos.equals("18")){%>
											<option value="III">III</option>
                                                                                        <%}else if(yos.equals("17")){%>
											<option value="V">V</option>
                                                                                        <%}else if(yos.equals("16")){%>
											<option value="VII">VII</option> <%}%>
									</select>
								</div>
							 </div>
							 <div class="form-row align-items-center my-4">
						<div class="col-4 mx-auto">
						 <center><label style="font-family:Copperplate Gothic Light;color:purple; font-weight: bold">Department</label> </center>
						<select id="dept" class="form-control input100">
											<%if(deptbelong.equals("CS") || deptbelong.equals("cs") || deptbelong.equals("104") ){%>
												<option value="CSE">CSE</option>
                                                                                                <%}else if(deptbelong.equals("IT")|| deptbelong.equals("it")  || deptbelong.equals("205")){%>
												<option value="IT">IT</option>
                                                                                                <%}else if(deptbelong.equals("EC")|| deptbelong.equals("ec") || deptbelong.equals("106")){%>
												<option value="ECE">ECE</option>
                                                                                                <%}else if(deptbelong.equals("EE")|| deptbelong.equals("ee") || deptbelong.equals("105")){%>
												<option value="EEE">EEE</option>
                                                                                                <%}else if(deptbelong.equals("ME")|| deptbelong.equals("me") || deptbelong.equals("114")){%>
												<option value="Mech">MECH</option>
                                                                                                <%}else if(deptbelong.equals("CE")|| deptbelong.equals("ce")  || deptbelong.equals("103")){%>
												<option value="Civil">CIVIL</option>  <%}%>
									</select>
									</div>
										<div class="col-4 mx-auto">
									 <center><label style="font-family:Copperplate Gothic Light;color:purple; font-weight: bold">Section</label> </center>
						<select id="sec" class="form-control input100" onchange="sltdept1();">
											<option value="0">Select Section</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
								</select>
							 </div>
                                                         </div>




								<div id="subcode" class="form-row align-items-center my-4">
						<!--<select class="form-control input100" id="selectdummy">
							<option> Select Subject</option>


						</select>  -->


<!--                 <div class="col-4 mx-auto">
                   <label>Theory or Laboratory</label>
                 <select class="form-control input100" id="thelab">
                       <option vaule="0">Select</option>
                       <option vaule="Theory">Theory</option>
                       <option vaule="Laboratory">Laboratory</option>
                   </select>
                 </div>-->

                 </div>
                                            <div id="sub1" class="form-row align-items-center my-4"></div>
                                            <div id="thelab" class="form-row align-items-center my-4"></div>



                                        </form>

							 </div>










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

		</div><center>
<div style="background-color:#000; padding:11px;" >
    <a href="thank.jsp" onclick="sess_out();">
                                                        Logout</a>

            </div>
</center>
	<script>
//	$(document).ready(function(){
//	  $("#thelab").change(function(){
//            if($(this).val()==="Theory"){
//                location.href="index.html";
//            }
//            else
//                location.href="login.html";
//	   // $("#tab").show();
//	  });

		// $("#vallab").change(function(){
		// 	$("#tablab").show();
		// });
	//});

	//



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
