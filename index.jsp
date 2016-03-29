<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html >
	<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>PAC</title>
 <% String name=request.getParameter("name");%>
	</head>
		<frameset rows="25%,*"  frameborder="no" marginWidth=0 marginHeight=0 scrolling=“no” border="0">
                <frame name="top" src="Images/bannerF.jpg" noresize="noresize" scrolling="no"/>
                <frame name="bottum" src="test2.jsp?shuming=<%=name%>" noresize="noresize"/>
		</frameset>
</html>