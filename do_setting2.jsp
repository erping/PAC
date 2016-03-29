<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
<%	String shuming=request.getParameter("shuming"); %>
</head>
<script language="javascript">   
function init(){
	window.setInterval("jump1()",100);   
} 
function jump1(){
	top.location.href="";   
}
function jump(){
	window.top.location.replace("login.jsp");   
}
</script>
<body>
	<%request.setCharacterEncoding("utf-8");
  	String old_password=request.getParameter("old_password");
  	String new_password=request.getParameter("new_password");
  	String again_password=request.getParameter("again_password");
  	dao.shuming = shuming;
  	dao.password = old_password;
  	dao.newpassword = new_password;
  	dao.newpassword2 = again_password;
  	%>
	<table style="margin-top:200" width="250" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
         <tr bgcolor="lightgrey" height="30">
            <td align="center">更改配置中……</td>
         </tr>
         <tr height="50">
            <td align="center">更改配置，请稍等……
            </td>
         </tr>
       </table>
           
              
              <%String result = dao.changePassword();
              if(result.equals("success")){%>
              <script language="javascript">   
              alert("修改成功！请重新登录");
              init();
              </script>
              <%}else {%>
              <script type="text/javascript">
            	  alert("更改失败！");
            	  jump();
            	  </script> 
              <%} %>

              
       <a href="setting2.jsp?shuming=<%=shuming%>">[返回]</a>
</body>
</html>