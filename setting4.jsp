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
	<title>医生管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<% String shuming=request.getParameter("shuming");%>
</head>
<script language=javascript>
//验证用户名
function do_delete(name){
	if(window.confirm("确定删除医生:"+name+"?")){
        //alert("确定");
        var url = "delete_doctor.jsp?name="+name+"&shuming=<%=shuming%>"+"&useUnicode=true&characterEncoding=UTF-8";
        window.location.href = url;
     }else{
        //alert("取消");
        return false;
    }	
	
}
function do_add(){
	var setting4= document.setting4;
	var doctor = setting4.doctor.value;
	if(window.confirm("确定添加医生:"+doctor+"?")){
        //alert("确定");
        var url = "add_doctor.jsp?name="+doctor+"&shuming=<%=shuming%>"+"&useUnicode=true&characterEncoding=UTF-8";
        window.location.href = url;
     }else{
        //alert("取消");
        return false;
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
  <% 
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	java.util.Date currTime = new java.util.Date();
	String curTime = formatter.format(currTime);
	String sql = "select * from doctor_list";
	ResultSet Rs = dao.executeQuery(sql);
%>
  <form name="setting4" method="post" action="patient_info.jsp">
  <table class="b-content">
    	<tr >
			<td  colspan="2">
    			<img width="725" height="36" src="Images/yishengguanli.jpg"/>
			</td>
		</tr>
  </table>
  <br/>
  <table class="b-content" width="700" id="mytab"  >
		<tr></tr>
  		<tr height="35">
  			<th height="35" width="50%">医生署名</th>
    		<th height="35" width="50%">删除</th>
  		</tr>
	<%
	while(Rs.next()){ %>
		<tr class="a1" height="35">
			<td height="35" nowrap align="center"><%=Rs.getString("name")%></td>
			<td height="35" nowrap align="center">
			<input type="button" name="register" value=""  style=" width:60px; height:30px; border:0;border-top:10px; background:url(Images/delete.jpg) no-repeat " onClick = "do_delete('<%=Rs.getString("name")%>')"/>
			</td>
	</tr>
	<% } %>
	
	<tr class="a1" height="35">
		<td class="a1"  height="35" align="center">
			<input type="text" name="doctor" style=" width:160px; height:30px;padding:0px 2px 0px 2px;"/>
			<input type="button" name="add"  style=" width:60px; height:30px; padding:10px 2px 10px 2px; border:0; background:url(Images/add.jpg) no-repeat " onClick = "do_add()"/>
		</td>
		<td align="right" height="35">
		<a href="test2.jsp?shuming=<%=shuming%>"  target=_parent><img width="60" height="30" src="Images/back.jpg"/></a>
		</td>
	</tr>
 	</table>
 	
	
</table>
 </form>
</body>
</HTML>