<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*,java.io.*,jxl.*" pageEncoding="UTF-8"%> 
<jsp:useBean id="selectall" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>患者统计信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
<style type="text/css">
<!--
body,table{
font-family:"微软雅黑";
	font-size: 16px;
	font-weight: bold;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
}
td{
    height:20px;
    border: 1px solid #666666;
}
h1,h2,h3{
    font-size:16px;
    margin:0;
    padding:0;
}

.title { background: #FFF; border: 1px solid #9DB3C5; padding: 1px; width:90%;margin:20px auto; }
    .title h1 { line-height: 31px; text-align:center;  background: #2F589C url(th_bg2.gif); background-repeat: repeat-x; background-position: 0 0; color: #FFF; }
        .title th, .title td { border: 1px solid #CAD9EA; padding: 5px; }


table.t1{
    border:1px solid #cad9ea;
    color:#666;
}
table.t1 th {
    background-image: url(th_bg1.gif);
    background-repeat::repeat-x;
    height:30px;
}
table.t1 td,table.t1 th{
    border:1px solid #cad9ea;
    padding:0 1em 0;
}
table.t1 tr.a1{
    background-color:#f5fafe;
}



table.t2{
    border:1px solid #9db3c5;
    color:#666;
}
table.t2 th {
    background-image: url(th_bg2.gif);
    background-repeat::repeat-x;
    height:30px;
    color:#aaaaaa;
}
table.t2 td{
    border:1px dotted #cad9ea;
    padding:0 2px 0;
}
table.t2 th{
    border:1px solid #a7d1fd;
    padding:0 2px 0;
}
table.t2 tr.a1{
    background-color:#e8f3fd;
}



table.t3{
    border:1px solid #fc58a6;
    color:#720337;
}
table.t3 th {
    background-image: url(th_bg3.gif);
    background-repeat::repeat-x;
    height:30px;
    color:#35031b;
}
table.t3 td{
    border:1px dashed #feb8d9;
    padding:0 1.5em 0;
}
table.t3 th{
    border:1px solid #b9f9dc;
    padding:0 2px 0;
}
table.t3 tr.a1{
    background-color:#fbd8e8;
}
.input_on{ 
padding:2px 8px 0pt 3px; 
height:18px; 
border:1px solid #999; 
background-color:#FFFFCC; 
} 
.input_off{ 
padding:2px 8px 0pt 3px; 
height:18px; 
border:1px solid #CCC; 
background-color:#FFF; 
} 
.input_move{ 
padding:2px 8px 0pt 3px; 
height:18px; 
border:1px solid #999; 
background-color:#FFFFCC; 
} 
.input_out{ 
/*height:16px;默认高度*/ 
padding:2px 8px 0pt 3px; 
height:18px; 
border:1px solid #CCC; 
background-color:#FFF; 
} 
-->
</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
<script src="funtion.js"></script>
<script type="text/javascript">
    function ApplyStyle(s){
        document.getElementById("mytab").className=s.innerText;
    }
</script>
<%String shuming = request.getParameter("shuming"); %>
<script language=javascript>
function do_output(){
	
	var searchform = document.search;
	var dateBegin = searchform.dateBegin.value;
	var dateEnd = searchform.dateEnd.value;
	var shuming = "<%=shuming%>";
	var item = "banniangaowei";
	alert(dateBegin);
	if(dateBegin!=""&&dateEnd!="")
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
			<td align="center"  colspan="3" bgcolor="#97CBFF">
				选择统计范围							
			</td>
		</tr>

    	
    <tr  id="r_table" height="40">
      <td  width="240"><div>&nbsp;&nbsp;<input name="dateBegin" type="text" size="15" id="datepicker-example1">&nbsp;&nbsp;&nbsp;至</div>
      </td>
      <td  width="240"><div>&nbsp;&nbsp;<input name="dateEnd" type="text" size="15" id="datepicker-example14">&nbsp;&nbsp;&nbsp;</div>
      </td>
      <td  width="80"><div>&nbsp;&nbsp;
      <a href="javascript:do_output()"  target="right">导出</a>&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
	<tr >
		<td colspan="3"  align="right">
		<a href="test2.jsp?shuming=<%=shuming%>"  target=_parent><img width="60" height="30" src="Images/back.jpg"/></a>
		</td>
	</tr>
  </table>
 </form>
  
 <script type="text/javascript" src="public/javascript/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="public/javascript/zebra_datepicker.src.js"></script>
        <script type="text/javascript" src="public/javascript/core.js"></script>
</body>
</html>
