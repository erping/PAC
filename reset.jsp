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
  <script language=javascript>
//验证用户名
function jump(){
		var url = "setting5.jsp?shuming=<%=shuming%>";
		window.location.href = url;
}
</script>
  <body>
  <%String name = request.getParameter("name"); %>
  	<script language=javascript>
    <%
		String sql2 = "delete from doctor where name='"+name+"'";
		String sql = "update doctor set password='123456'where name='"+name+"'";
		Connection conn=null;
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hospital?user=admin&password=123456&useUnicode=true&characterEncoding=UTF-8");
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
     %>
     	alert("<%=name%>"+"密码重置成功");
		jump();
		</script>
  </body>
</html>
