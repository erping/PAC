<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="mylogin" class="PAC.login"></jsp:useBean>
<jsp:useBean id="mychecknum" class="PAC.makechecknum" scope="session"></jsp:useBean>
         

<html>
  <head>
    <title>带验证码的用户登录模块</title>
  </head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
      <%String shuming = request.getParameter("shuming"); %>
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
		stmt.executeUpdate(sql2);
     %>
     	alert("<%=name%>"+"删除成功");
		jump();
		</script>
  </body>
</html>