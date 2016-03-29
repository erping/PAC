<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean class="PAC.ConnDB" scope="page" id="conn"></jsp:useBean>
<%
String num=request.getParameter("num");
ResultSet rs=conn.executeQuery("select * from patient_info where num='"+num+"'");
if (rs.next()){
	out.println("该病历号已经被注册!");
}
%>
