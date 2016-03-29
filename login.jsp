<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="mychecknum" scope="page" class="PAC.makechecknum"></jsp:useBean>
<jsp:useBean id="mylogin" class="PAC.login"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login page</title>
</head>
<style type="text/css">

a,a:visited {font-size:12px;text-decoration: none; color: #026080;
	text-align: right;
}
a:hover	{color: #ffb200;border-bottom: #ff5555 1px dotted;}
body{ border: 0px; text-align: center; font-size: 12px; margin: 0px;font-family: Verdana,arial,宋体,sans-serif;  }

input,button,select,textarea{outline:none} 
textarea{resize:none}

table
{
font-size: 12px;
margin: 0px;font-family: Verdana,arial,宋体,sans-serif; 
}
table.border_Line
{
border-collapse: collapse;
border :solid  2px black;
}

table.border_Line td,th
{
 border-collapse : collapse;
 border :solid  1px black;	
}
select
{
	font-size:12px;
	border: #7f9db9 1px solid;   
    padding:2px;
    margin: 0px;
}
div
{
    margin: 0px auto; padding: 0px; 
} 
hr
{
     height:1px;background:black;border:0px;
}

.Upload
{
    border: #7f9db9 1px solid;   font-family:Verdana;font-size:12px;color:#7a7a7a;
 }
.clear
{
clear: both;
}
.edline
{
    height:19px;  
    vertical-align:middle; 
    padding-bottom:2px; 
	font-family: Verdana, Arial, 宋体;
	font-size:12px;	
	border-bottom: 1px solid #7f9db9;
    border-left-width: 0px;
    border-right-width: 0px; 
    border-top-width: 0px;
}
.edline1
{
    height:19px;  
    vertical-align:middle; 
    padding-bottom:2px; 
	font-family: Verdana, Arial, 宋体;
	font-size:12px;	
	border-bottom: 1px solid #ffb200;
    border-left-width: 0px;
    border-right-width: 0px; 
    border-top-width: 0px;

}
.edlineb
{
    height:19px;  
    vertical-align:middle;
    padding-bottom:2px; 
	font-family: Verdana, Arial, 宋体;
	font-size:12px;	
	border-bottom: 1px solid black;  
    border-left-width: 0px;  
    border-right-width: 0px; 
    border-top-width: 0px;
}
.ednone
{
	font-size:12px;
	border: 0px;
	background-color:#d4e4d8;
}
.none
{
	font-size:12px;
	padding-bottom:2px; 
	font-family: Verdana,arial,宋体,sans-serif;
	border: 0px;
	background-color:transparent;
}
.none1
{
	font-size:12px;
	padding-bottom:0px; 
	font-family: Verdana,arial,宋体,sans-serif;
	border: 1px solid #ffb200;
	background-color:transparent;
}
 .none:hover
 {
     border-style: none;
 }
.td {font-size: 12px;line-height:20px;padding-left:2px;padding-right:2px;}

.tbline
{
  border-collapse : collapse;  
  text-align:left;
}
.tb_line
{
   font-family: Verdana, Arial, 宋体;
    font-size:12px;
    border: 1px solid #7F9DB9;
    padding: 5px;
}.tb_line_l
{
   font-family: Verdana, Arial, 宋体;
    font-size:12px;
    border: 1px solid #7F9DB9;
    padding: 5px;
    border-right: 0px;
}.tb_line_r
{
   font-family: Verdana, Arial, 宋体;
    font-size:12px;
    border: 1px solid #7F9DB9;
    padding: 5px;
    border-left: 0px;
}
.tb_line_t
{
    border-collapse : collapse;
    font-family: Verdana, Arial, 宋体;
    font-size:12px;
    border: 1px solid #7F9DB9;
    border-bottom: 0px; 
    padding: 5px;
}
.tb_line_b
{
   font-family: Verdana, Arial, 宋体;
    font-size:12px;
    border: 1px solid #7F9DB9;
    border-top: 0px;     
    padding: 5px;
}
.err
{
	padding-right: 2px;
	padding-left: 2px;
	font-size: 12px;
	color: red;
	line-height: 25px;
}.white {font-size: 12px;color: #eeeeee}
.coursegrid
{
	padding-left:5px;
	padding-right:5px;
	vertical-align:top;
	text-align:left;
}
.formTop
{
	font-size:12px;
	border: 1px solid;
	border-bottom:0px;
	border-color: #EEEEEE;
    border-collapse : collapse;  
	background-color:White;
	text-align:left;
}

.formTop td,th
{	
    padding-top: 5px;  
    padding-bottom: 5px;
    padding-right: 10px; 
    padding-left: 10px; 
   
}

.formTb
{
	font-size:12px;
	border: 1px solid;	
	border-color: #EEEEEE;
padding: 10px;  
	background-color:White;
	text-align:left;
	border-collapse : collapse;  
}
.formTb  td,th
{	
	padding: 10px;  
}

.formBottom
{
    border-collapse : collapse;  
	font-size:12px;
	border: 1px solid;
	border-top:0px;
	border-color: #EEEEEE;
	padding-top: 8px; 
    padding-right: 10px; 
    padding-left: 10px; 
    padding-bottom: 8px;
	background-color:White;
	text-align:left;
	 margin-bottom:20px;
}
.formBottom td,th
{
    padding-right: 10px; 
    padding-left: 10px; 
    padding-top: 5px;
    padding-bottom: 5px;
   
}

.outbox{
	font-size:			12px;
	background-color: #FFFF85;
	border: 1px solid #000000;
	
}.tdTitle
{ 
    padding-bottom: 5px;   
    padding-right: 10px; 
    padding-left: 10px; 
    text-align:left;
	font-weight: bold;
	font-size: 12px;
	color: black;
	height: 25px;
	line-height: 25px;
}
.Grid_Line
{
border-collapse: collapse;
border :solid  1px #7F9DB9;
padding-top: 2px; 
    padding-right: 5px; 
    padding-left: 5px; 
    padding-bottom: 2px;

}
.Grid_Line td,th
{
    padding: 2px;  
    border-collapse : collapse;
  border :solid  1px #7F9DB9;	
  height:22px;
}

.Grid_Page td
{
   padding-top: 2px; 
   padding-right: 5px; 
   padding-left: 5px; 
   padding-bottom: 2px;
  text-align:left;
  border-collapse : collapse;
  border :solid  1px #7F9DB9;	
}

.Grid_Page td table td
{
  border-collapse : collapse;
  border :solid  0px;	
  padding-top: 2px; 
  padding-right: 2px; 
  padding-left: 2px; 
   padding-bottom: 2px;
  text-align:left;
}

td.Grid_NoBorder table td
{ 
  border-collapse : collapse;
  border :solid  0px;	
}


.Cssbutton
{   
    padding:0px; 
    margin:0px;
    text-align:center;  
	font-family: "Tahoma", "宋体";
    font-size: 12px;
    border: 0px;
    color:black; 
    background-image:url(../../Images/buttonbk.gif);
    cursor:pointer; 
    width:60px; 
    height:22px; 
    line-height:22px;
    vertical-align:middle;
    
}
.Cssbutton1
{
    padding:0px; 
   margin:0px;
  text-align:center; 
	font-family: "Tahoma", "宋体";
    font-size: 12px;
    border: 0px;
    color:White; 
    background-image:url(../../Images/buttonbk1.gif);
    cursor:pointer;
    width:60px; 
    height:22px; 
    line-height:22px;
    vertical-align:middle;
}

.Cssbutton2
{
    padding:0px; 
 margin:0px;
   text-align:center;
    border: 0px;
    font-family: "Tahoma", "宋体";
    font-size: 12px;
    color:black;
    background-image:url('../../Images/buttonbk2.gif');
    cursor:pointer;  
    width:36px; 
    height:22px; 
    line-height:22px;
    vertical-align:middle;
}
.Cssbutton21
{
    padding:0px; 
    margin:0px;
   text-align:center;  
	font-family: "Tahoma", "宋体";
    font-size: 12px;
    border: 0px;
    color:White;  
    background-image:url(../../Images/buttonbk21.gif);
    cursor:pointer; 
    width:36px; 
    height:22px; 
    line-height:22px;
    vertical-align:middle;
}
.Csstextbox
{     
    height:18px;
    vertical-align:middle; 
    padding-left:4px;   
    padding-bottom:1px; 
	font-family: Verdana, Arial, 宋体;
	font-size:12px;		
	border: #7F9DB9 1px solid;	
}.Csstextbox1
{  
    padding-left:4px;   
    height:18px;
    vertical-align:middle;    
    padding-bottom:1px; 
  	font-family: Verdana, Arial, 宋体;
  	font-size: 12px;
	border: #ffb200 1px solid;	
}

</style>
<script language=javascript>
function doCheck(){
	
	var loginForm = document.loginform;
	var username = loginForm.userName.value;
	var password = loginForm.userpassWord.value;
	//var checknum = loginform.checknum.value;
	//var check = loginform.check.value;
	//window.alert(username_hash);
	if(loginForm.userName.value!="" && loginForm.userpassWord.value!=""){
		//window.alert(loginForm.user_name.value + "  " + loginForm.password.value);
		//url="dologin.jsp?username="+username+"&userpassword="+password+"&checknum="+checknum+"&check="+check;
		url="dologin.jsp?username="+username+"&userpassword="+password;
		window.location.href = url;

	}else{
		alert("用户名或者密码不能为空");
	}
	//request.setCharacterEncoding("utf-8");
	//String username = request.getParameter("userName");
	//String userpassword = request.getParameter("userpassWord");
	//String checknum = request.getParameter("checknum");
	//System.out.println("username:"+username);
	//response.sendRedirect("dologin.jsp");	
}
function doRegister(){
	var url;
	url = "register.jsp";
	window.location.href = url;
}
</script>
<body>
<%
	mychecknum.makenum();
	String check = mychecknum.getChecknum();
	System.out.println("check:"+check);
	session.setAttribute("chenknum",check);
%>
<form method="post" action="dologin.jsp" name="loginform" id="Form1" method="post">
    <div style="margin: 20px">
        <div id="parent" style="width: 468px; height: 223px; margin-top: 79.83800000000001px; background-image: url(Images/Login.jpg);">
            <div style="width: 300px; padding-top: 40px; padding-left: 60px">
                <table style="width: 100%">
                    <tbody><tr>
                        <td style="width: 120px; text-align: right">
                           	 用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户：
                        </td>
                        <td style="height: 25px; text-align: left;">
                            <input name="userName" type="text" size="30" onfocus="oldTextClass=this.className;this.className=this.className+'1'" onblur="this.className=oldTextClass" style="height:18px;width:120px;background-color: transparent">
                            <span id="RequiredFieldValidator1" style="visibility: hidden;">*</span>
                        </td>
                    </tr>
                   <tr>
                        <td style="width: 120px; text-align: right">
                          	  密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：
                        </td>
                        <td style="height: 25px; text-align: left">
                            <input name="userpassWord" type="password" maxlength="30"  onfocus="oldTextClass=this.className;this.className=this.className+'1'" onblur="this.className=oldTextClass" style="height:18px;width:120px;background-color: transparent">&nbsp;<span id="RequiredFieldValidator2" style="visibility: hidden;">*</span>
                        </td>
                    </tr>
					 <!-- 
                    <tr>
                        <td style="width: 120px; text-align: right">
                            	验&nbsp;&nbsp;证&nbsp;&nbsp;码：
                        </td>
                        <td style="height: 25px; text-align: left">
                            <input name="checknum" type="text" maxlength="4" onfocus="oldTextClass=this.className;this.className=this.className+'1'" onblur="this.className=oldTextClass" style="height:18px;width:60px;background-color: transparent"/>
							<font color="red"><%=check%></font>
                        </td>
                    </tr>
                     -->
                    <tr>
                        <td style="width: 120px; text-align: right">

                        </td>
                        <td style="height: 25px; text-align: left">

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 30px; text-align: center">
                        	<input type="button" name="login" value="登录" onClick = "doCheck()"/>
                           <!--  <input type="button" name="register" value="注册" onClick = "doRegister()"/>
                         -->
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 30px; text-align: center;">
                         	<input name="check" type="text" value=<%=check%> readonly="true" style="display:none;"/>
                        </td>
                    </tr>
                </tbody></table>
            </div>
        </div>
    </div>
</form>
</body>
</html>