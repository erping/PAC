<%@ page contentType="text/html" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="selectall" scope="page" class="PAC.ConnDB"></jsp:useBean>
<%!int CountPage2 = 0;
	int CurrPage2 = 1;
	int PageSize2 = 10;
	int CountRow2 = 0;%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>十二个月待随访列表</title>

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
<% 
	String StrPage2 = request.getParameter("Page");
	if(StrPage2==null){
		CurrPage2 = 1;
	}else{
		CurrPage2 = Integer.parseInt(StrPage2);
	}
	String shuming = request.getParameter("shuming");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	java.util.Date currTime = new java.util.Date();
	String curTime = formatter.format(currTime);
	String SQL2 = "select * from "
			+"(select * from (select* from daisuifang where time='12' and (complete='0' or complete='1') and shuming='"+shuming+"' and begin<='"+curTime.toString()+"' and end >='"+curTime.toString()+"'  order by gaowei asc,luoshi desc) as a "
			+" union all " 
			+"select * from (select * from daisuifang where time='12' and (complete='0' or complete='1') and shuming!='"+shuming+"' and begin<='"+curTime.toString()+"' and end >='"+curTime.toString()+"' order by gaowei asc,luoshi desc) as b)as c";
	ResultSet Rs2 = selectall.executeQuery(SQL2);
	Rs2.last();
	int i2=0;
	CountRow2 = Rs2.getRow();
	CountPage2 = (CountRow2/PageSize2);
	//System.out.println("date:"+currTime.toString());
	if(CountRow2%PageSize2>0)
		CountPage2++;
	Integer n2 = (CurrPage2-1)*5+1;
%>

<table border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr>
    	<td align="center" valign="top">    
			<div class="title">
    			<img width="900" height="42" src="Images/shiergeyuedaisuifang.jpg"/>
			</div>
	<table width="1000" id="mytab"  border="1" class="t1">
		<tr></tr>
  		<tr>
    		<th width="100px">流产日期</th>
  			<th width="50px">高危</th>
    		<th width="50px">重点</th>
    		<th width="100px">病历号</th>
    		<th width="100px">患者姓名</th>
    		<th width="100px">电话</th>
    		<th width="100px">六个月随访咨询员</th>
    		<th width="100px">未联系上</th>
    		<th width="200px">随访</th>
  		</tr>
	<%
	String SQL="";
	//System.out.println(curTime.toString());
	if(CurrPage2==CountPage2){
		SQL = "select * from "
				+"(select * from (select* from daisuifang where time='12' and (complete='0' or complete='1') and shuming='"+shuming+"' and begin<='"+curTime.toString()+"' and end >='"+curTime.toString()+"'  order by liudate asc,gaowei desc) as a "
				+" union all " 
				+"select * from (select * from daisuifang where time='12' and (complete='0' or complete='1') and shuming!='"+shuming+"' and begin<='"+curTime.toString()+"' and end >='"+curTime.toString()+"' order by liudate asc,gaowei desc) as b)as c" 
				+" limit "+PageSize2*(CurrPage2-1)+","+CountRow2;
	}
	else{
		SQL = "select * from "
				+"(select * from (select* from daisuifang where time='12' and (complete='0' or complete='1') and shuming='"+shuming+"' and begin<='"+curTime.toString()+"' and end >='"+curTime.toString()+"'  order by liudate asc,gaowei desc) as a "
				+" union all " 
				+"select * from (select * from daisuifang where time='12' and (complete='0' or complete='1') and shuming!='"+shuming+"' and begin<='"+curTime.toString()+"' and end >='"+curTime.toString()+"' order by liudate asc,gaowei desc) as b)as c"
				+" limit "+PageSize2*(CurrPage2-1)+","+CurrPage2*PageSize2;
	}
	System.out.println(SQL);
	//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
	ResultSet Rs = selectall.executeQuery(SQL);
	while(Rs.next()){ %>
		<tr class="a1" height="25px">
			<td nowrap align="center"><%=Rs.getString("liudate")%></td>
			<td nowrap align="center">  
			<%if(Rs.getString("gaowei").equals("2")){ %>
			<img width="14" height="19" src="Images/smalll.jpg"/>
			<%}
				else if(Rs.getString("gaowei").equals("3")){ %>
			<img width="14" height="19" src="Images/smalll.jpg"/><img width="14" height="19" src="Images/smalll.jpg"/>
			<%} 
				else if(Integer.valueOf(Rs.getString("gaowei").toString()).intValue()>=4){ %>
			<img width="14" height="19" src="Images/smalll.jpg"/><img width="14" height="19" src="Images/smalll.jpg"/><img width="14" height="19" src="Images/smalll.jpg"/>
			<%} %>
			</td>
			<td nowrap align="center">  
			<%if(Rs.getString("gaowei").equals("1")){ %>
			<img width="14" height="19" src="Images/smalll.jpg"/>
			<%} %>
			</td>
			<td nowrap align="center"><a href="single_patient.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=suifang"  target=_parent><%=Rs.getString("num")%></a></td>
			<td nowrap align="center"><%=Rs.getString("name")%></td>
			
			<td nowrap align="center"><%=Rs.getString("tel")%></td>
			
			<td nowrap align="center"><%=Rs.getString("shuming")%></td>
			<td nowrap align="center">
				<% 
				String sql = "select * from zhongyuan6 where num='"+Rs.getString("num")+"'";
				ResultSet rs_c6 = selectall.executeQuery(sql);
				if(rs_c6.next()){%>
					<%=rs_c6.getString("person")%>
				<%} %>
			</td>
			<td nowrap align="center">
			<%if(Rs.getString("complete").equals("1")){ %>
			  	未联系上
			<%} %>
			</td>
			<td nowrap><a href="zhongyuan12.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=suifang" target=_parent><img width="55" height="20" src="Images/suifang.jpg"/></a></td>
			
	</tr>
	<% } %>
		<tr class="a1">
			<td colspan="9" align="center">
				<div>
					[<%=CurrPage2%>/<%=CountPage2%>] 每页<%=PageSize2 %>条 共<%=CountRow2%>条记录
				</div>
			</td>
		</tr>
		<tr class="a1">
			<td colspan="9" align="center">
				<div align="center">
				<a href="daisuifang12.jsp?shuming=<%=shuming%>"><img width="100" height="20" src="Images/top.jpg"/></a>
				<% if (CurrPage2 > 1) { %>
				<a href="daisuifang12.jsp?Page=<%=CurrPage2 - 1%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/front.jpg"/></a>
				<% } %>
				<% if (CurrPage2 < CountPage2) { %>
				<a href="daisuifang12.jsp?Page=<%=CurrPage2 + 1%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/next.jpg"/></a>
				<% } %>
				<a href="daisuifang12.jsp?Page=<%=CountPage2%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/last.jpg"/></a>
				</div>
			</td>
		</tr>
 	</table>
 		</td>
	</tr>
</table>
<br/>
<table width="1000">
	<tr >
		<td align="right"><a href="test2.jsp?shuming=<%=shuming%>"  target=_parent><img width="60" height="30" src="Images/back.jpg"/></a></td>
	</tr>
</table>
</body>
</html>
