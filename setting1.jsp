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
 
<body>
<br/>
<br/>
<script language=javascript>
function do_setting1(){
	var settingform = document.settingform;
	var firstbegin = settingform.firstbegin.value;
	var firstend = settingform.firstend.value;
	var threebegin = settingform.threebegin.value;
	var threeend = settingform.threeend.value;
	var sixbegin = settingform.sixbegin.value*30;
	var sixend = settingform.sixend.value*30;
	var twelvebegin = settingform.twelvebegin.value*30;
	var twelveend = settingform.twelveend.value*30;
	var shuming = "<%=shuming%>";
	if(firstbegin!=""&&firstend!=""&&threebegin!=""&&threeend!=""&&sixbegin!=""&&sixend!=""&&twelvebegin!=""&&twelveend!="")
	{	
		if((firstend-firstbegin)>=0&&(threeend-threebegin)>=0&&(sixend-sixbegin)>=0&&(twelveend-twelvebegin)>=0){
			url = "do_setting1.jsp?firstbegin="+firstbegin+"&firstend="+firstend+"&threebegin="+threebegin+"&shuming="+shuming
				+"&threeend="+threeend+"&sixbegin="+sixbegin+"&sixend="+sixend+"&twelvebegin="+twelvebegin+"&twelveend="+twelveend;
			window.location.href = url;
			window.event.returnValue = false;
		}
		else{
			alert("请输入正确的时间范围！");
		}
	}
	else{
		alert("请输入全部随访范围！");
	}
	
}
</script>
<form name="settingform" id="settingform" action="setting1.jsp?shuming=<%=shuming%>" method="post" accept-charset="utf-8"> 
  <table class="b-content">
    	<tr  id="r_table">
			<td  colspan="2">
    		<img width="725" height="36" src="Images/suifangtixing.jpg"/>
			</td>
		</tr>

    	
    <tr  id="r_table">
      <td class="r_cell_1"><div>首次随访提醒时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;术后
		<input name="firstbegin" type="text" size="5">天</div>
      </td>
	  <td class="r_cell_1"><div>至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="firstend" type="text" size="5">天</div>
      </td>
    </tr>
	<tr  id="r_table">
      <td class="r_cell_1"><div>三个月随访提醒时间&nbsp;&nbsp;&nbsp;&nbsp;术后
		<input name="threebegin" type="text" size="5">天</div>
      </td>
	  <td class="r_cell_1"><div>至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="threeend" type="text" size="5">天</div>
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>六个月随访提醒时间&nbsp;&nbsp;&nbsp;&nbsp;术后
		<input name="sixbegin" type="text" size="5">月</div>
      </td>
	  <td class="r_cell_1"><div>至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="sixend" type="text" size="5">月</div>
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>十二个月随访提醒时间&nbsp;&nbsp;术后
		<input name="twelvebegin" type="text" size="5">月</div>
      </td>
	  <td class="r_cell_1"><div>至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="twelveend" type="text" size="5">月</div>
      </td>
    </tr>
    <tr  id="r_table">

	  <td class="r_cell_1"></td>
	  <td><input type="image" name="advise" src="Images/save.jpg" onClick="do_setting1()"/>
              </td>
    </tr>
    
    <tr >
		<td colspan=2 align="right"><a href="test2.jsp?shuming=<%=shuming%>" target=_parent><img width="60" height="30" src="Images/back.jpg"/></a></td>
	</tr>
  </table>
 </form>
</body>
</HTML>