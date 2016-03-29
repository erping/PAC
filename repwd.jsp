<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<style type="text/css">

.style1 {
	color: #6633CC;
	font-weight: bold;
	font-size: 13px;
}

.style3 {
	font-size: 12
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-left: 0px;
	margin-bottom: 0px;
}
form {width:1000px; margin: auto;}
a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}
.STYLE4 {font-size: 18px}
table{border-collapse: collapse;}
tr{border: 1px solid #666666;}
td {border: 1px solid #666666;}
td.star{color:red}
td.input{
	padding: 10px;
}
td.input:focus
{
	border: yellow;
}

#r_table td {
vertical-align: middle;
padding-top: 10px;
padding-bottom: 3px;
border-bottom: 1px solid #c9d7f1;
}

#r_table div {
display: block;
font-size: 14px;
font-weight: bold;
color: #666;
padding-bottom: 3px;
}
.r_cell_1 {
width: 350px;
padding-left: 10px;
font-size: 8px;
}

.b-content {
border: 1px solid #d9e7ff;
background: #FFF;
padding: 10px;
border-top: 0 none;
overflow: hidden;
-moz-border-radius: 0 0 4px 4px;
-webkit-border-radius: 0 0 4px 4px;
border-radius: 0 0 4px 4px;
clear: both;
width：80%;
margin: auto;

}
.corner {
-moz-border-radius: 4px;
-webkit-border-radius: 4px;
border-radius: 4px;
}

.input-text, select, textarea {
border: 1px solid #7F9DB9;
background: -moz-linear-gradient(top,#eee,#fff 8px);
background: -webkit-gradient(linear,0% 0%,0% 30%,from(#eee),to(#fff));
}

#r_table input, select, radio {
font-size: 18px;
margin-right: 10px;
}

</style>
	<title>患者问诊信息录入</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script language=javascript>
function do_repwd(){
	alert("重置成功，初始密码为123456");
	
}

var doctor_array = new Array();
var count=0;
<%
String sql = "select * from doctor";
ResultSet rs = dao.executeQuery(sql);
while(rs.next()){
	if(!rs.getString("name").equals("admin")){
	//System.out.println("doctor name:"+rs.getString("name"));
	%>
	doctor_array[count] = "<%=rs.getString("name") %>";
	//alert(doctor_array[i]);
	count++;
	<%}
}
%>

function doctorChange(){
	var yisheng = document.getElementById("yisheng");
	yisheng.length=0;
	//alert(doctor_array.length);
	for(var i=0;i<doctor_array.length;i++){
		var option = new Option(doctor_array[i],i); 
		//alert(doctor_array[i]);
		yisheng.options[i]=option;
	}
}

</script>
<script language="javascript" src="JS/AjaxRequest.js"></script>
<style type="text/css">    
 body{    
      background-image: url(back.jpg);    
      background-repeat: repeat-x;    
 }    
 </style> 
<body>
<br/>
<br/>
<form name="repwd" method="post" action="patient_info.jsp">
  <table class="b-content">
    	<tr  id="r_table">
			<td height="34" colspan="2" bgcolor="#97CBFF">
				<div align="center" class="STYLE4">
					密码设置								
				</div>								
			</td>
		</tr>

    	
    <tr>
      <td>&nbsp;&nbsp;选择咨询员</div></td>
      <td>&nbsp;&nbsp;
		<select  id="yisheng" name="yisheng"  style="width:200px" onfocus="doctorChange()" onChange="doctor_display()">
        </select>
       </td>
    </tr>
    <tr  id="r_table">
	  <td class="r_cell_1"></td>
	  <td  class="r_cell_1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" name="advise" value="重置密码" onClick = "do_repwd()"/>
                </td>
    </tr>
    <tr >
		<td colspan=2 align="right"><a href="test2.jsp" target=_parent><img width="60" height="30" src="Images/back.jpg"/></a></td>
	</tr>
  </table>
</form>
</body>
</HTML>