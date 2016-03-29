<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<link rel="stylesheet" href="public/css/reset.css" type="text/css">
        <link rel="stylesheet" href="public/css/default.css" type="text/css">
        <link rel="stylesheet" href="public/css/style.css" type="text/css">

        <link type="text/css" rel="stylesheet" href="libraries/syntaxhighlighter/public/css/shCoreDefault.css">

        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/XRegExp.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shCore.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shLegacy.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shBrushJScript.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shBrushXml.js"></script>

        <script type="text/javascript">
            SyntaxHighlighter.defaults['toolbar'] = false;
            SyntaxHighlighter.all();
        </script>
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
function do_output(){
	
	var searchform = document.search;
	var dateBegin = searchform.dateBegin.value;
	var dateEnd = searchform.dateEnd.value;
	var shuming = "<%=shuming%>";
	var item = searchform.tongji.value;
	if(dateBegin!=""&&dateEnd!=""&&item!="0")
	{
		var date1= new Date(Date.parse(dateBegin.replace(/-/g,   "/")));
		var date2= new Date(Date.parse(dateEnd.replace(/-/g,   "/")));
		var date3 = date2.getTime()-date1.getTime();
		var days=Math.floor(date3/(24*3600*1000));
		if(days<366){
		var url = "export.jsp?shuming="+shuming+"&dateBegin="+dateBegin+"&dateEnd="+dateEnd+"&item="+item;
		window.location.href=url;
		}else{
			alert("统计最长时间间隔为365天！");
		}
	}
	else{
		alert("请输入统计条件");
	}
}
</script>
<script language="javascript" src="JS/AjaxRequest.js"></script>
<body>
  <br/>
  <br/>
  <% 
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	java.util.Date currTime = new java.util.Date();
	String curTime = formatter.format(currTime);
%>

  <form name="search"  method="post" accept-charset="utf-8">
  <table class="b-content">
    	<tr  id="r_table" height="40">
			<td align="center"  colspan="2" bgcolor="#97CBFF">
				PAC数据统计						
			</td>
		</tr>
		<tr id="r_table" height="40" >
	<td><div>&nbsp;&nbsp;&nbsp;&nbsp;选择统计类别&nbsp;&nbsp;</div></td>
	<td >&nbsp;
        <select id="tongji" name="tongji" style="width:180px">
			<option value="0"></option>
        	<option value="single">个人统计情况</option>
          	<option value="renshenyuanyin">本次妊娠原因统计</option>
          	<option value="liukind">流产类别统计</option>
          	<option value="lijiluoshi">立即落实情况统计</option>
          	<option value="bannian">流产后半年内避孕使用情况(所有患者)</option>
          	<option value="banniangaowei">流产后半年内避孕使用情况(高危患者)</option>
          	<option value="suifang">随访情况统计</option>
        </select></td>
    </tr>
    <tr  id="r_table" height="40">
      <td  width="300"><div>&nbsp;&nbsp;&nbsp;&nbsp;时间范围&nbsp;&nbsp;<input name="dateBegin" type="text" size="15" id="datepicker-example1">&nbsp;&nbsp;</div>
      </td>
      <td  width="300"><div>&nbsp;至&nbsp;<input name="dateEnd" type="text" size="15" id="datepicker-example14">&nbsp;&nbsp;&nbsp;</div>
      </td>
      
    </tr>
	<tr >
	<td  colspan="2"  align="right"><div>&nbsp;&nbsp;
      <a href="javascript:do_output()"  target="right"><img width="60" height="30" src="Images/export.jpg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="test2.jsp?shuming=<%=shuming%>"  target=_parent><img width="60" height="30" src="Images/back.jpg"/></a>
		</div></td>
	</tr>
  </table>
 </form>
  
 <script type="text/javascript" src="public/javascript/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="public/javascript/zebra_datepicker.src.js"></script>
        <script type="text/javascript" src="public/javascript/core.js"></script>
</body>
</HTML>