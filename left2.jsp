<%@ page contentType="text/html" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>navigation</title>
</head>

<body>
<style type="text/css">

#vertmenu {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 100%;
width: 160px;
padding: 0px;
margin: 0px;
}

#vertmenu h1 {
vertical-align: middle;
padding-top: 10px;
padding-bottom: 3px;
display: block; 
background-color:#FF9900;
font-size: 90%; 
border: 1px solid #000000;
color: #333333;
margin: 0px;
width:159px;
}

#vertmenu ul {
list-style: none;
margin: 0px;
padding: 0px;
border: none;
}

#vertmenu ul li a {
font-size: 80%;
display: block;
border-bottom: 1px dashed #C39C4E;
padding: 5px 0px 2px 4px;
text-decoration: none;
color: #666666;
width:160px;
}

#vertmenu ul li a:hover, #vertmenu ul li a:focus {
color: #000000;
background-color: #eeeeee;
}

#r_table li {
vertical-align: middle;
padding-top: 10px;
padding-bottom: 3px;
border-bottom: 1px solid #c9d7f1;
}

#r_table span {
display: block;
font-size: 14px;
font-weight: bold;
color: #666;
padding-bottom: 3px;
}

</style>
<div id="vertmenu"> 
<% String shuming=request.getParameter("shuming");%> 
<h1  align="center">数据统计</h1>
<ul id="r_table">
<li><a href="daochu1.jsp?shuming=<%=shuming%>" target="right" tabindex="1">PAC数据统计</a></li>
<li><a href="statistics8.jsp?shuming=<%=shuming%>" target="right" tabindex="8">工作量统计</a></li>
<li><a href="statistics9.jsp?shuming=<%=shuming%>" target="right" tabindex="9">原始数据导出</a></li>
</ul>
</div>

</body>
</html>