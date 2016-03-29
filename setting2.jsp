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
	<% String shuming=request.getParameter("shuming");%>
</head>
<script language=javascript>
function do_setting2(){
	var setting2 = document.setting2;
	var old_password = setting2.old_password.value;
	var new_password = setting2.new_password.value;
	var again_password = setting2.again_password.value;
	var shuming = "<%=shuming%>";
	if(old_password!=""&&new_password!=""){
		if(new_password.value==again_password.value){
		var url = "do_setting2.jsp?old_password="+old_password+"&new_password="+new_password+"&again_password="+again_password+"&shuming="+shuming;
		//alert("test");
		//self.location==url;
		//window.location.replace(url);
		window.location.href = url;
		}
		else alert("请保证两次新密码输入相同！");
	}
	else alert("请输入原密码及新密码！");
	
}
</script>
<script language="javascript" src="JS/AjaxRequest.js"></script>
<body>
<br/>
<br/>
<form name="setting2"  action="javascript:void(0)" method="post" accept-charset="utf-8">
  <table class="b-content">
    	<tr  id="r_table">
			<td  colspan="2">
    		<img width="725" height="36" src="Images/xiugaimima.jpg"/>
			</td>
		</tr>

    	
    <tr  id="r_table">
      <td class="r_cell_1"><div>输入原密码</div></td>
      <td><div><input name="old_password" type="password" size="30"></div>
      </td>
    </tr>
	<tr  id="r_table">
      <td class="r_cell_1"><div>输入新密码</div></td>
      <td><div><input name="new_password" type="password" size="30"></div>
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>再次输入</div></td>
      <td><div><input name="again_password" type="password" size="30"></div>
      </td>
    </tr>
    <tr  id="r_table">
	  <td class="r_cell_1"></td>
	  <td><input type="image" name="advise" src="Images/save.jpg" onClick="do_setting2()"/>
                </td>
    </tr>
    <tr>
		<td colspan=2 align="right"><a href="test2.jsp?shuming=<%=shuming%>" target=_parent><img width="60" height="30" src="Images/back.jpg"/></a></td>
	</tr>
  </table>
</form>
</body>
</HTML>