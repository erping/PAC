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
	<%String shuming = request.getParameter("shuming"); %>
</head>
<script language=javascript>
//验证用户名
function do_delete(name){
	if(window.confirm("确定删除咨询员:"+name+"?")){
        //alert("确定");
        var url = "delete.jsp?name="+name+"&shuming=<%=shuming%>";
        window.location.href = url;
     }else{
        //alert("取消");
        return false;
    }	
	
}
function do_reset(name){
	
	if(window.confirm("确定重置"+name+"的密码吗?")){
        //alert("确定");
        var url = "reset.jsp?name="+name+"&shuming=<%=shuming%>";
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
	String sql = "select * from doctor";
	ResultSet Rs = dao.executeQuery(sql);
%>
  <form name="setting5" method="post" action="setting5.jsp" method="post" accept-charset="utf-8">
  <table class="b-content">
    	<tr  id="r_table">
			<td  colspan="2">
    			<img width="725" height="40" src="Images/zixunyuanguanli.jpg"/>
			</td>
		</tr>
  </table>
  <br/>
  <table class="b-content" width="700" id="mytab"  border="1">
		<tr></tr>
  		<tr height="35">
  			<th width="10%">咨询员账号</th>
  			<th width="10%">咨询员署名</th>
    		<th width="10%">重置密码</th>
    		<th width="10%">删除</th>
  		</tr>
	<%
	while(Rs.next()){ 
		if(!Rs.getString("name").equals("admin2")){%>
		<tr class="a1" height="35">
			<td nowrap align="center"><%=Rs.getString("name")%></td>
			<td nowrap align="center"><%=Rs.getString("shuming")%></td>
			<td nowrap align="center">
			<input type="button" name="register" value="" style=" width:80px; height:30px; border:0;border-top:10px; background:url(Images/chongzhi.jpg) no-repeat " onClick = "do_reset('<%=Rs.getString("name")%>')"/>
			</td>
			<%if(!Rs.getString("name").equals("admin")){ %>
			<td nowrap align="center">
			<input type="button" name="register" value="" style=" width:60px; height:30px; border:0;border-top:10px; background:url(Images/delete.jpg) no-repeat " onClick = "do_delete('<%=Rs.getString("name")%>')"/>
			</td>
			<%}else{ %>
			<td nowrap align="center">
			</td>
			<%} %>
	</tr>
	<% } }%>
 	</table>
 	<table class="b-content" width="700" >
	<tr height="35">
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="register.jsp?shuming=<%=shuming%>"  target="right"><img width="100" height="30" src="Images/addzixun.jpg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="test2.jsp?shuming=<%=shuming%>"  target=_parent><img width="60" height="30" src="Images/back.jpg"/></a>
		</td>
	</tr>
</table>
 </form>
</body>
</HTML>