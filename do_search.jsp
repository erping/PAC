<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
  	String dateBegin=request.getParameter("dateBegin");
  	String dateEnd=request.getParameter("dateEnd");
  	String gaowei=request.getParameter("gaowei");
  	String search=request.getParameter("search");
  	String SQL= "";
    
    if(dateBegin!="")
    {
      SQL+=" liudate>='"+dateBegin+"' and ";
      SQL+=" liudate<='"+dateEnd+"' and ";
      if(gaowei.equals("1")||gaowei.equals("2"))
      {
        SQL+=" gaowei='"+gaowei+"' and ";
      }

      else SQL+=" gaowei='0'  ";
      if(search!="")
        SQL+=" and name like '%"+search+"'% ";

    }
  	
%>
		<script type="text/javascript">
		function init(){
			window.setInterval("jump()",200);   
		} 
		function jump(){
			window.location.replace("patient_page.jsp?SQL=<%=SQL%>");   
		}
		
              	init();
              </script> 
</body>
</html>