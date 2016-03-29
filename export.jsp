<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
 
  <body>
  <%
	String shuming = request.getParameter("shuming");
	String dateBegin = request.getParameter("dateBegin");
	String dateEnd = request.getParameter("dateEnd");
	String item = request.getParameter("item");
	System.out.println(dateBegin+","+dateEnd);
	dao.dateBegin = dateBegin;
	dao.dateEnd = dateEnd;
	if(item.equals("single")){
		dao.singleExcel();
	}else if(item.equals("renshenyuanyin")){
		dao.renshenyuanyinExcel();
	}
	else if(item.equals("gongzuoliang")){
		dao.gongzuoliangExcel();
	}
	else if(item.equals("liukind")){
		dao.liukindExcel();
	}
	else if(item.equals("lijiluoshi")){
		dao.lijiluoshiExcel();
	}
	else if(item.equals("bannian")){
		dao.bannianExcel();
	}
	else if(item.equals("banniangaowei")){
		dao.banniangaoweiExcel();
	}
	else if(item.equals("suifang")){
		dao.suifangExcel();
	}
	else if(item.equals("output")){
		dao.OutputExcel();
	}
	%>
	<table class="b-content">
    	<tr  id="r_table" height="40">
			<td align="center"  bgcolor="#97CBFF">
				数据统计导出完成							
			</td>
		</tr>
		
  <tr><td>
   <a   href="output/<%=item%>1.xls"   id=pic1   onclick="saveit('output/<%=item%>1.xls')"   style="cursor:hand">点击下载</a>    
  	</td></tr>
  	<tr >
		<td  align="right">
		<a href="test2.jsp?shuming=<%=shuming%>"  target=_parent><img width="60" height="30" src="Images/back.jpg"/></a>
		</td>
	</tr>
	</table>
  	<script language=javascript>
		function saveit(src) { 
      	  I1.document.location = src; 
      	  savexls(); 
      	  } 
      	  function savexls() { 
      	  if (I1.document.readyState == "complete") { 
      	  I1.document.execCommand("saveas"); 
      	  } else { 
      	  window.setTimeout("savexls()", 10); 
      	  } 
      	  } 
</script>
  </body>
</html>
