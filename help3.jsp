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
				系统使用说明							
			</td>
		</tr>
		 <% String shuming=request.getParameter("shuming");%> 
  <tr><td>
   <a   href="output/shiyong.pdf" target="right"  id=pic1   onclick="saveit('output/shiyong.pdf')"   style="cursor:hand">点击下载</a>    
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