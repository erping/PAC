<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="selectall" scope="page" class="PAC.ConnDB"></jsp:useBean>
<%!int CountPage2 = 0;
	int CurrPage2 = 1;
	int PageSize2 = 10;
	int CountRow2 = 0;
	%>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>待落实列表</title>

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
  request.setCharacterEncoding("utf-8");
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
			+"(select * from (select* from patient_info where luoshi='0' and yisheng='"+shuming+"' order by liudate asc) as a "
			+" union all " 
			+"select * from (select * from patient_info where luoshi='0' and yisheng!='"+shuming+"' order by liudate asc) as b)as c";
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
	 <form name="search"  method="post" accept-charset="utf-8">
	  <table class="b-content">
	    	<tr  id="r_table">
				<td height="34" colspan="5" bgcolor="#97CBFF">
					<img width="601" height="29" src="Images/search2.jpg"/>								
				</td>
			</tr>
	
	    	
	    <tr  id="r_table" height="40">
	     <!--  <td><div><input name="dateBegin" type="text" size="15" id="datepicker-example1">至</div>
	      </td>
	      <td><div><input name="dateEnd" type="text" size="15" id="datepicker-example14">&nbsp;&nbsp;&nbsp;</div>
	      </td>
	      <td><div><select name="gaowei" >
	      		<option value="3"></option>
	          	<option value="1">高危</option>
	          	<option value="2">重点</option>
	          	<option value="0">普通</option>
	        </select></div>
	      </td>-->
	      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<span style="width:17px"><input name="search" type="text" size="15">   输入病历号，姓名，或者电话</span>
	      </td>
	      <td>
	      	<input type="image" name="advise" width="55" height="30" src="Images/search.jpg" onClick="do_search()"/>
	       </td>
	    </tr>
	
	  </table>
	 </form>
<table border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr>
    	<td  align="center" >    
			<div >
    			<img width="1000" height="35" src="Images/dailuoshiliebiao.jpg"/>
			</div>
		</td>
	</tr>
	
	<table width="1000" id="mytab"  border="1" class="t1">
		<tr><br/></tr>
		<tr><br/></tr>
		<tr></tr>
  		<tr>
  			<th width="10%">咨询日期</th>
  			<th width="10%">咨询员</th>
    		<th width="10%">病历号</th>
    		<th width="10%">患者姓名</th>
    		<th width="10%">流产日期</th>
    		<th width="15%">拟选择避孕方式</th>
    		<th width="15%">建议落实/放置时间</th>
    		<th width="5%">高危</th>
    		<th width="5%">重点</th>
    		<th width="5%">落实</th>
  		</tr>
	<%
	request.setCharacterEncoding("utf-8");
	String SQL="";
	  String search="";
	//System.out.println(curTime.toString());
		if(request.getParameter("search")!=null){
			search=request.getParameter("search");
		}
		String SQLs="";
		if(search!=""){
  			SQLs+=" and ( name like '%"+search+"%' or num like '%"+search+"%' or tel like '%"+search+"%' ) ";
  	}
  	
	if(CurrPage2==CountPage2){
		SQL = "select * from "
				+"(select * from (select* from patient_info where luoshi='0' and yisheng='"+shuming+"'"+SQLs+" order by liudate asc,date asc) as a "
				+" union all " 
				+" select * from (select * from patient_info where luoshi='0' and yisheng!='"+shuming+"'"+SQLs+" order by liudate asc,date asc) as b)as c"
				+" limit "+PageSize2*(CurrPage2-1)+","+CountRow2;
	}
	else{
		SQL = "select * from "
				+"(select * from (select* from patient_info where luoshi='0' and yisheng='"+shuming+"'"+SQLs+" order by liudate asc,date asc) as a "
				+" union all " 
				+" select * from (select * from patient_info where luoshi='0' and yisheng!='"+shuming+"'"+SQLs+" order by liudate asc,date asc) as b)as c"
				+" limit "+PageSize2*(CurrPage2-1)+","+CurrPage2*PageSize2;
	}//System.out.println(SQL);
	//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
	System.out.println(SQL);
	ResultSet Rs = selectall.executeQuery(SQL);
	while(Rs.next()){ %>
		<tr class="a1">
		<td nowrap align="center"><%=Rs.getString("date")%></td>
			<td nowrap align="center"><%=Rs.getString("person")%></td>
			<td nowrap align="center"><a href="single_patient.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>" target="right"><%=Rs.getString("num")%></a></td>
			<td nowrap align="center"><%=Rs.getString("name")%></td>
			<td nowrap align="center"><%=Rs.getString("liudate")%></td>
			<% String nibiyun;
			if(Rs.getString("nibiyun").equals("1"))
				nibiyun="COC";
			else if(Rs.getString("nibiyun").equals("2"))
				nibiyun="IUD";
			else if(Rs.getString("nibiyun").equals("3"))
				nibiyun="IUS";
			else if(Rs.getString("nibiyun").equals("4"))
				nibiyun="避孕套";
			else if(Rs.getString("nibiyun").equals("5"))
				nibiyun="皮埋";
			else if(Rs.getString("nibiyun").equals("6"))
				nibiyun="绝育";
			else if(Rs.getString("nibiyun").equals("7"))
				nibiyun=Rs.getString("othernibiyun");
			else{
				nibiyun="未决定";
			 }%>
			<td nowrap align="center"><%=nibiyun%></td>
			<%
			String shijian="";
			if(Rs.getString("nibiyun").equals("1")) {
				if(Rs.getString("COCshijian").equals("1"))
					shijian="流产当日";
				else if(Rs.getString("COCshijian").equals("2"))
					shijian="流产后2周";
				else if(Rs.getString("COCshijian").equals("3"))
					shijian="首次恢复月经";
				else if(Rs.getString("COCshijian").equals("4"))
					shijian="流产后1个月";
				else{
					shijian="流产后2-3月";
				 }
			}
			if(Rs.getString("nibiyun").equals("2")||Rs.getString("nibiyun").equals("3")||Rs.getString("nibiyun").equals("5")) {
				if(Rs.getString("IUDfangzhi").equals("1"))
					shijian="流产当日";
				else if(Rs.getString("IUDfangzhi").equals("2"))
					shijian="流产后2周";
				else if(Rs.getString("IUDfangzhi").equals("3"))
					shijian="首次恢复月经";
				else if(Rs.getString("IUDfangzhi").equals("4"))
					shijian="流产后1个月";
				else{
					shijian="流产后2-3月";
				 }
			}
			%>
			<td nowrap align="center"><%=shijian%></td>
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
			<td nowrap align="center"><a href="edit.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="55" height="20" src="Images/luoshi.jpg"/></a></td>
	</tr>
	<% } %>
		<tr class="a1">
			<td colspan="10" align="center">
				<div>
					[<%=CurrPage2%>/<%=CountPage2%>] 每页<%=PageSize2 %>条 共<%=CountRow2%>条记录
				</div>
			</td>
		</tr>
		<tr class="a1">
			<td colspan="10" align="center">
				<div align="center">
				<a href="dailuoshi.jsp?shuming=<%=shuming%>"><img width="100" height="20" src="Images/top.jpg"/></a>
				<% if (CurrPage2 > 1) { %>
				<a href="dailuoshi.jsp?Page=<%=CurrPage2 - 1%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/front.jpg"/></a>
				<% } %>
				<% if (CurrPage2 < CountPage2) { %>
				<a href="dailuoshi.jsp?Page=<%=CurrPage2 + 1%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/next.jpg"/></a>
				<% } %>
				<a href="dailuoshi.jsp?Page=<%=CountPage2%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/last.jpg"/></a>
				</div>
			</td>
		</tr>
 	</table>
 		
</table>
<br/>
<table width="1000">
	<tr >
		<td align="right"><a href="test2.jsp?shuming=<%=shuming%>"><img width="60" height="30" src="Images/back.jpg"/></a></td>
	</tr>
</table>
<script style="text/javascript">
			function do_search(){
			
			var searchform = document.search;
			//var dateBegin = searchform.dateBegin.value;
			//var dateEnd = searchform.dateEnd.value;
			//var gaowei = searchform.gaowei.value;
			var search = searchform.search.value;
			var shuming  = "<%=shuming%>";
				var url = "dailuoshi.jsp?shuming="+shuming+"&search="+search;
				window.location.href = url;

		 }
</script>
</body>
</html>
