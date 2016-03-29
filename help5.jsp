<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


	<title>帮助页面1</title>
	<meta http-equiv="Content-Type" content="text/html;8">
</head>

<body>
<form method="post" action="do_first.jsp" name="adviseform" id="Form1" method="post" accept-charset="utf-8">
  	<br/>
  	<table class="b-content">
    	<tr  id="r_table" height="40">
			<td align="center"  bgcolor="#97CBFF">
				项目联系方式						
			</td>
		</tr>
		<tr  id="r_table" height="40">
			<td align="center"  >
				联系人：张彦明 联系电话：010-84898617 						
			</td>
		</tr>
		<tr  id="r_table" height="40">
			<td align="center"  >
				联系人：胡金霞 联系电话：010-87167531 					
			</td>
		</tr>
		<tr  id="r_table" height="40">
			<td align="center"  >
				 官方网站：www.yiaijijin.org.cn 				
			</td>
		</tr>
		<tr  id="r_table" height="40">
			<td align="center"  >
				邮箱：yiaijijin@163.com 				
			</td>
		</tr>
		<tr  id="r_table" height="40">
			<td align="center"  >
				地 址：北京市建国门内大街15号1119室（100730）				
			</td>
		</tr>
		 <% String shuming=request.getParameter("shuming");%> 
  <tr><td>
  
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
    	
 </form>

</body>
</HTML>