<%@ page contentType="text/html" autoFlush="false" buffer="3000kb" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="selectall" scope="page" class="PAC.ConnDB"></jsp:useBean>
<%!int CountPage = 0;
	int CurrPage = 1;
	int PageSize = 5;
	int CountRow = 0;%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>患者信息列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
<!--
body,table{
    font-size:12px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
}
td{
    height:20px;
}
h1,h2,h3{
    font-size:12px;
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
    color:#fff;
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

-->
</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
<script src="funtion.js"></script>
<script type="text/javascript">
    function ApplyStyle(s){
        document.getElementById("mytab").className=s.innerText;
    }
</script>

<body onload="reWin()">


	    <table border="0" align="center" cellpadding="0" cellspacing="0" >
          <tr>
            <td align="center" valign="top">
		
			  <table  border="0" cellpadding="0" cellspacing="0"
				bordercolor="#FFFFFF" bordercolordark="#999999"
				bordercolorlight="#FFFFFF">
				<tr>
					<td colspan="2">

					
        


<div class="title">
    <h1>随访列表</h1>
    <table><tr><td>
        	切换格式
        <a href="javascript:;" onclick="ApplyStyle(this)">t1</a>
        <a href="javascript:;" onclick="ApplyStyle(this)">t2</a>
        <a href="javascript:;" onclick="ApplyStyle(this)">t3</a>
    </td></tr></table>
</div>
<table width="90%" id="mytab"  border="1" class="t1">
	<thead><th colspan="5">首次随访</th></thead>
  <thead>
    <th width="20%">病历号</th>
    <th width="20%">患者姓名</th>
    <th width="20%">随访日期</th>
    <th width="20%">出血</th>
    <th width="20%">咨询</th>
  </thead>
  
<%
	String SQL2;
	String num = request.getParameter("num");
	SQL2 = "select * from first_suifang where num="+num.toString();
	//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
	ResultSet Rs2 = selectall.executeQuery(SQL2);
	if(Rs2.next()){
%>
<tr class="a1">
	<td nowrap><a href="single_patient.jsp?num=<%=Rs2.getString("num")%>" target="right"><%=Rs2.getString("num")%></a></td>
	<td nowrap><%=Rs2.getString("name")%></td>
	<td nowrap><%=Rs2.getString("date")%></td>
	<td nowrap><%=Rs2.getString("chuxue")%></td>
	<td nowrap><%=Rs2.getString("zixun")%></td>
</tr>
<%} %>
	<thead><th  colspan="5">中远期随访</th></thead>
  <thead>
    <th width="20%">病历号</th>
    <th width="20%">患者姓名</th>
    <th width="20%">随访日期</th>
    <th width="20%">时间</th>
    <th width="20%">方法</th>
  </thead>
  
  
  
<%
	String StrPage = request.getParameter("Page");
	if(StrPage==null){
		CurrPage = 1;
	}else{
		CurrPage = Integer.parseInt(StrPage);
	}
	String SQL = "Select * from zhongyuan";
	ResultSet Rs = selectall.executeQuery(SQL);
	Rs.last();
	int i=0;
	CountRow = Rs.getRow();
	CountPage = (CountRow/PageSize);
	if(CountRow%PageSize>0)
		CountPage++;
	Integer n = (CurrPage-1)*5+1;
	//String num = request.getParameter("num");
	SQL = "select * from zhongyuan where num="+num.toString()+" order by num asc limit 5";
	//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
	Rs = selectall.executeQuery(SQL);
	while(Rs.next()){ 	
%>
<tr class="a1">
	<td nowrap><a href="single_patient.jsp?num=<%=Rs.getString("num")%>" target="right"><%=Rs.getString("num")%></a></td>
	<td nowrap><%=Rs.getString("name")%></td>
	<td nowrap><%=Rs.getString("date")%></td>
	<td nowrap><%=Rs.getString("shijian")%></td>
	<td nowrap><%=Rs.getString("method")%></td>
</tr>
<%
	}
	selectall.closeConnection();
%>
<tr class="a1">
	<td colspan="5" align="center">
	<div>
		[<%=CurrPage%>/<%=CountPage%>] 每页5条 共<%=CountRow%>条记录
	</div>
	</td>
	</tr>
	<tr class="a1">
		<td colspan="5" align="center">
		<div align="middel">
			<%
								if (CurrPage > 1) {
							%>
							<a href="patient_page.jsp?Page=<%=CurrPage - 1%>">上一页</a>
							<%
								}
							%>
							<%
								if (CurrPage < CountPage) {
							%>
							<a href="patient_page.jsp?Page=<%=CurrPage + 1%>">下一页</a>
							<%
								}
							%>
							<a href="patient_page.jsp?Page=<%=CountPage%>">最后一页</a>
		</div>
		</td>
	</tr>
 </table>
 
 </td>
	</tr>
</table>
		</td>
</table>
 
</body>
</html>
