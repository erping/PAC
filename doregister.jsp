<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>Register Page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%String shuming = request.getParameter("shuming"); %>
  </head>
  
  <body>
    <%
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	String num = request.getParameter("num");
    	//num = new String(num.getBytes("iso-8859-1"),"utf-8");
    	String res = dao.doRegister(username, password, num);
    	out.println(res);
     %>
  </body>
</html>
