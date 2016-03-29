<%@ page contentType="text/html" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="selectall" scope="page" class="PAC.ConnDB"></jsp:useBean>
<%	int CountPage = 0;
	int CurrPage = 1;
	int PageSize = 5;
	int CountRow = 0;%>
<%!int CountPage2 = 0;
	int CurrPage2 = 1;
	int PageSize2 = 5;
	int CountRow2 = 0;%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>今日待随访列表</title>

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
    font-size:14px;
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
    font-size:14px;
    margin:0;
    padding:0;
}

.title { background: #FFF; border: 1px solid #9DB3C5; padding: 1px; width:90%;margin:20px auto; }
    .title h1 { line-height: 31px; text-align:center;  background: #2F589C ; background-repeat: repeat-x; background-position: 0 0; color: #FFF; }
        .title th, .title td { border: 1px solid #CAD9EA; padding: 5px; }


table.t1{
    border:1px solid #cad9ea;
    color:#666;
}
table.t1 th {
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
-->
</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
<script type="text/javascript">
    function ApplyStyle(s){
        document.getElementById("mytab").className=s.innerText;
    }
</script>

<body>
<table border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr>
    	<td align="center" valign="top">    
			<div class="title">
    			<img width="1210" height="34" src="Images/jinrigaowei.jpg"/>
			</div>
	<table width="90%" id="mytab"  border="1" class="t1">
		<tr></tr>
  		<tr>
    		<th width="10%">病历号</th>
    		<th width="10%">患者姓名</th>
    		<th width="15%">咨询时间</th>
    		<th width="15%">电话</th>
    		<th width="20%">随访</th>
    		<th width="10%">高危</th>
    		<th width="10%">重点</th>
  		</tr>
	<%
	String StrPage = request.getParameter("Page");
	if(StrPage==null){
		CurrPage = 1;
	}else{
		CurrPage = Integer.parseInt(StrPage);
	}
	String shuming = request.getParameter("shuming");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-M-dd");
	java.util.Date currTime = new java.util.Date();
	String curTime = formatter.format(currTime);
	String SQL = "select * from daisuifang where begin<'"+curTime.toString()+"' and end> '"+curTime.toString()+"' and (gaowei='1' or gaowei='2')";
	ResultSet Rs = selectall.executeQuery(SQL);
	Rs.last();
	int i=0;
	CountRow = Rs.getRow();
	CountPage = (CountRow/PageSize);
	System.out.println("date:"+currTime.toString());
	if(CountRow%PageSize>0)
		CountPage++;
	Integer n = (CurrPage-1)*5+1;
	//System.out.println(curTime.toString());
	SQL = "select * from daisuifang where begin<'"+curTime.toString()+"' and end> '"+curTime.toString()+"' and (gaowei='1' or gaowei='2') order by num asc limit 5";
	//System.out.println(SQL);
	//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
	Rs = selectall.executeQuery(SQL);
	while(Rs.next()){ %>
		<tr class="a1">
			<td nowrap><a href="single_patient.jsp?num=<%=Rs.getString("num")%>" target="right"><%=Rs.getString("num")%></a></td>
			<td nowrap><%=Rs.getString("name")%></td>
			<td nowrap><%=Rs.getString("time")%></td>
			<td nowrap><%=Rs.getString("tel")%></td>
	<%
	String time = Rs.getString("time");
	System.out.println("time:"+time);
	if(time.equals("1")){ %>
	<td nowrap><a href="first_suifang.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/first.jpg"/></a></td>
	<% }
	else if(time.equals("3")){ %>
	<td nowrap><a href="zhongyuan.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/three.jpg"/></a></td>
	<% }
	else if(time.equals("6")){ %>
	<td nowrap><a href="zhongyuan6.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/six.jpg"/></a></td>
	<% }else if(time.equals("12")){ %>
	<td nowrap><a href="zhongyuan12.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/twelve.jpg"/></a></td>
	<% } %>
	<td nowrap align="center">
	<%if(Rs.getString("gaowei").equals("1")){ %>
	<img width="14" height="19" src="Images/smalll.jpg"/>
	<%} %></td>
	<td nowrap align="center">
	<%if(Rs.getString("gaowei").equals("2")){ %>
	<img width="14" height="19" src="Images/smalll.jpg"/>
	<%} %></td>
	</tr>
	<% } %>
		<tr class="a1">
			<td colspan="7" align="center">
				<div>
					[<%=CurrPage%>/<%=CountPage%>] 每页5条 共<%=CountRow%>条记录
				</div>
			</td>
		</tr>
		<tr class="a1">
			<td colspan="7" align="center">
				<div align="center">
				<a href="daisuifang.jsp"><img width="100" height="20" src="Images/first.jpg"/></a>
				<% if (CurrPage > 1) { %>
				<a href="daisuifang.jsp?Page=<%=CurrPage - 1%>"><img width="100" height="20" src="Images/front.jpg"/></a>
				<% } %>
				<% if (CurrPage < CountPage) { %>
				<a href="daisuifang.jsp?Page=<%=CurrPage + 1%>"><img width="100" height="20" src="Images/next.jpg"/></a>
				<% } %>
				<a href="daisuifang.jsp?Page=<%=CountPage%>"><img width="100" height="20" src="Images/last.jpg"/></a>
				</div>
			</td>
		</tr>
 	</table>
 		</td>
	</tr>
</table>

 
<table border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr>
    	<td align="center" valign="top">
			<div class="title">
    			<img width="1210" height="34" src="Images/jinriputong.jpg"/>
			</div>
<table width="90%" id="mytab"  border="1" class="t1">
<tr></tr>
  <tr>
    <th width="30%">病历号</th>
    <th width="20%">患者姓名</th>
    <th width="20%">咨询时间</th>
    <th width="20%">电话</th>
    <th width="20%">随访</th>
  </tr>
<%
	String StrPage2 = request.getParameter("Page");
	if(StrPage2==null){
		CurrPage2 = 1;
	}else{
		CurrPage2 = Integer.parseInt(StrPage2);
	}
	java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("yyyy-M-dd");
	java.util.Date currTime2 = new java.util.Date();
	String curTime2 = formatter.format(currTime2);
	String SQL2 = "select * from daisuifang where begin<'"+curTime2.toString()+"' and end> '"+curTime2.toString()+"' and gaowei='2' ";
	ResultSet Rs2 = selectall.executeQuery(SQL2);
	Rs2.last();
	int i2=0;
	CountRow2 = Rs2.getRow();
	CountPage2 = (CountRow2/PageSize2);
	System.out.println("date:"+currTime2.toString());
	if(CountRow2%PageSize2>0)
		CountPage2++;
	Integer n2 = (CurrPage2-1)*5+1;
	//System.out.println(curTime.toString());
	SQL2 = "select * from daisuifang where begin<'"+curTime.toString()+"' and end> '"+curTime.toString()+"' and gaowei='2' order by num asc limit 5";
	//System.out.println(SQL);
	//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
	Rs2 = selectall.executeQuery(SQL2);
	while(Rs2.next()){ 	
%>
<tr class="a1">
	<td nowrap><a href="single_patient.jsp?num=<%=Rs2.getString("num")%>" target="right"><%=Rs2.getString("num")%></a></td>
	<td nowrap><%=Rs2.getString("name")%></td>
	<td nowrap><%=Rs2.getString("time")%></td>
	<td nowrap><%=Rs2.getString("tel")%></td>
	<%
	String time = Rs2.getString("time");
	System.out.println("time:"+time);
	if(time.equals("1")){%>
	<td nowrap><a href="first_suifang.jsp?num=<%=Rs2.getString("num")%>"><img width="100" height="20" src="Images/first.jpg"/></a></td>
	<%}
	else if(time.equals("3")){%>
	<td nowrap><a href="zhongyuan.jsp?num=<%=Rs2.getString("num")%>"><img width="100" height="20" src="Images/three.jpg"/></a></td>
	<%}
	else if(time.equals("6")){%>
	<td nowrap><a href="zhongyuan6.jsp?num=<%=Rs2.getString("num")%>"><img width="100" height="20" src="Images/six.jpg"/></a></td>
	<%}else if(time.equals("12")){ %>
	<td nowrap><a href="zhongyuan12.jsp?num=<%=Rs2.getString("num")%>"><img width="100" height="20" src="Images/twelve.jpg"/></a></td>
	<%} %>
</tr>
<%
	}
%>
<tr class="a1">
	<td colspan="5" align="center">
	<div>
		[<%=CurrPage2%>/<%=CountPage2%>] 每页5条 共<%=CountRow2%>条记录
	</div>
	</td>
	</tr>
	<tr class="a1">
		<td colspan="5" align="center">
		<div align="center">
			<a href="daisuifang.jsp"><img width="100" height="20" src="Images/first.jpg"/></a>
			<%	
								if (CurrPage2 > 1) {
							%>
							<a href="daisuifang.jsp?Page=<%=CurrPage2 - 1%>"><img width="100" height="20" src="Images/front.jpg"/></a>
							<%
								}
							%>
							<%
								if (CurrPage2 < CountPage2) {
							%>
							<a href="daisuifang.jsp?Page=<%=CurrPage2 + 1%>"><img width="100" height="20" src="Images/next.jpg"/></a>
							<%
								}
							%>
							<a href="daisuifang.jsp?Page=<%=CountPage2%>"><img width="100" height="20" src="Images/last.jpg"/></a>
		</div>
		</td>
	</tr>
 </table>
 
 </td>
	</tr>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr>
    	<td align="center" valign="top">    
			<div class="title">
    			<img width="1210" height="34" src="Images/jinriwancheng.jpg"/>
			</div>
	<table width="90%" id="mytab"  border="1" class="t1">
		<tr></tr>
  		<tr>
    		<th width="30%">病历号</th>
    		<th width="20%">患者姓名</th>
    		<th width="20%">电话</th>
    		<th width="20%">高危或重点</th>
    		<th width="20%">随访</th>
  		</tr>
	<%
	//System.out.println(curTime.toString());
	SQL = "select * from daisuifang where complete='"+curTime.toString()+"' order by num asc limit 5";
	//System.out.println(SQL);
	//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
	Rs = selectall.executeQuery(SQL);
	while(Rs.next()){ %>
		<tr class="a1">
			<td nowrap align="center"><a href="single_patient.jsp?num=<%=Rs.getString("num")%>" target="right"><%=Rs.getString("num")%></a></td>
			<td nowrap align="center"><%=Rs.getString("name")%></td>
			<td nowrap align="center"><%=Rs.getString("tel")%></td>
			<td nowrap align="center">
			<%if(Rs.getString("gaowei").equals("1")||Rs.getString("gaowei").equals("2")){ %>
			<img width="14" height="19" src="Images/smalll.jpg"/>
			<%} %>
			</td>
	<%
	String time = Rs.getString("time");
	System.out.println("time:"+time);
	if(time.equals("1")){ %>
	<td nowrap align="center">完成[首次随访]</td>
	<% }
	else if(time.equals("3")){ %>
	<td nowrap align="center">完成[三个月随访]</td>
	<% }
	else if(time.equals("6")){ %>
	<td nowrap align="center">完成[六个月随访]</td>
	<% }else if(time.equals("12")){ %>
	<td nowrap align="center">完成[十二个月随访]</td>
	<% } %>
	</tr>
	<% } %>
		<tr class="a1">
			<td colspan="5" align="center">
				<div>
					[<%=CurrPage%>/<%=CountPage%>] 每页5条 共<%=CountRow%>条记录
				</div>
			</td>
		</tr>
		<tr class="a1">
			<td colspan="5" align="center">
				<div align="center">
				<a href="daisuifang.jsp"><img width="100" height="20" src="Images/first.jpg"/></a>
				<% if (CurrPage > 1) { %>
				<a href="daisuifang.jsp?Page=<%=CurrPage - 1%>"><img width="100" height="20" src="Images/front.jpg"/></a>
				<% } %>
				<% if (CurrPage < CountPage) { %>
				<a href="daisuifang.jsp?Page=<%=CurrPage + 1%>"><img width="100" height="20" src="Images/next.jpg"/></a>
				<% } %>
				<a href="daisuifang.jsp?Page=<%=CountPage%>"><img width="100" height="20" src="Images/last.jpg"/></a>
				</div>
			</td>
		</tr>
 	</table>
 		</td>
	</tr>
</table>
<br/>
<table width="1200">
	<tr >
		<td align="right"><a href="test2.jsp"><img width="60" height="30" src="Images/back.jpg"/></a></td>
	</tr>
</table>
</body>
</html>
