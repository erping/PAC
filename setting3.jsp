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

function do_setting3(){
	var setting3 = document.setting3;
	var time = setting3.time.value;
	var shuming = "<%=shuming%>";
	if(time!=""){
		var url = "do_setting3.jsp?time="+time+"&shuming="+shuming;
		window.location.href = url;
	}
	else alert("请设置系统时间！");
	
}
</script>
<link rel="stylesheet" href="public/css/reset.css" type="text/css">
        <link rel="stylesheet" href="public/css/default.css" type="text/css">
        <link rel="stylesheet" href="public/css/style.css" type="text/css">

        <link type="text/css" rel="stylesheet" href="libraries/syntaxhighlighter/public/css/shCoreDefault.css">

        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/XRegExp.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shCore.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shLegacy.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shBrushJScript.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shBrushXML.js"></script>

        <script type="text/javascript">
            SyntaxHighlighter.defaults['toolbar'] = false;
            SyntaxHighlighter.all();
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
<br/>
<br/>
  <form name="setting3" method="post" action="setting3.jsp" method="post" accept-charset="utf-8">
  <table class="b-content">
    	<tr  id="r_table">
			<td  colspan="2">
    			<img width="725" height="36" src="Images/riqishezhi.jpg"/>
			</td>
		</tr>
    <tr  id="r_table">
      <td class="r_cell_1" align="center"><div>设置系统日期</div></td>
      <td><div><input name="time" type="text" size="30" id="datepicker-example1"></div>
      </td>
    </tr>
	<tr id="r_table">
	<td class="r_cell_1"></td>
	  <td><input type="image" name="advise" src="Images/save.jpg" onClick = "do_setting3()"/>
              </td>
              </tr>
     <tr >
		<td colspan=2 align="right"><a href="test2.jsp?shuming=<%=shuming%>" target=_parent><img width="60" height="30" src="Images/back.jpg"/></a></td>
	</tr>
  </table>
 </form>
 <script type="text/javascript" src="public/javascript/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="public/javascript/zebra_datepicker.src.js"></script>
        <script type="text/javascript" src="public/javascript/core.js"></script>
</body>
</HTML>