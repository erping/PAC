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
		var url = "setting4.jsp?shuming=<%=shuming%>";
		window.location.href = url;
}
</script>
  <body>
  <%
  request.setCharacterEncoding("utf-8");
  String name = request.getParameter("name"); 
  //name = new String(name.getBytes("iso-8859-1"),"utf-8");
  System.out.println("name:"+name);
  %>
  	<script language=javascript>
    <%
		String sql2 = "insert doctor_list (name) value('"+name+"')";
		Connection conn=null;
		System.out.println(sql2);
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hospital?user=admin&password=123456&useUnicode=true&characterEncoding=UTF-8");
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql2);
     %>
     	alert("<%=name%>"+"添加成功");
		jump();
		</script>
  </body>
</html>