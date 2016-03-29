<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%	String shuming=request.getParameter("shuming"); %>
<title>Insert title here</title>
</head>
<script language="javascript">   
function init(){
	window.setInterval("jump()",200);   
} 
function jump(){
	window.location.replace("setting4.jsp?shuming=<%=shuming%>");   
}
</script>
<body>
	<%request.setCharacterEncoding("utf-8");
  	String doctor=request.getParameter("doctor");
  	dao.doctor = doctor;
  	%>
	<table style="margin-top:200" width="250" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
         <tr bgcolor="lightgrey" height="30">
            <td align="center">设置状况</td>
         </tr>
         <tr height="50">
            <td align="center">'正在修改，请稍等……'
            </td>
         </tr>
       </table>
           
              <script type="text/javascript">
              var mark = <%=dao.set_doctor()%>;
              if(mark){
              alert("设置成功！");
              init();
              }else{
            	  alert("修改失败！");
            	  jump();
              }
              </script> 
       <a href="setting4.jsp?shuming=<%=shuming%>">[返回]</a>
</body>
</html>