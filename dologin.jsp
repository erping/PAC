<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="mylogin" class="PAC.login"></jsp:useBean>
<jsp:useBean id="mychecknum" class="PAC.makechecknum" scope="session"></jsp:useBean>
           <%
  String username=request.getParameter("username");
  System.out.println(username);
  if(username==null)
	  username="";
      username=new String(username.getBytes("utf-8"));
  String userpassword=request.getParameter("userpassword");
  if(userpassword==null)
	  userpassword="";
      userpassword=new String(userpassword.getBytes("utf-8"));
  //String userinputnum=request.getParameter("checknum");
  //if(userinputnum==null)
	//  userinputnum="";
    //  userinputnum=new String(userinputnum.getBytes("utf-8"));      
  mylogin.setUsername(username);
  mylogin.setUserpassword(userpassword);
  //mylogin.setUserchecknum(userinputnum);
  mylogin.checklogin();
  //String check = request.getParameter("check");
  //System.out.println("getchecknum:"+check);
  //mylogin.setMakechecknum(check);
%>

<html>
  <head>
    <title>带验证码的用户登录模块</title>
  </head>
  <body>
   <center>
       <table style="margin-top:200" width="250" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
         <tr bgcolor="lightgrey" height="30">
            <td align="center">登录状况</td>
         </tr>
         <tr height="50">
            <td align="center">
              <%=mylogin.checklogin()%>
			  <% //System.out.println("mark:"+mylogin.getMark());%>
            </td>
         </tr>
       </table>

              <script type="text/javascript">
              var mark = <%=mylogin.getMark()%>;
              function init(){
            		window.setInterval("jump()",500);   
            	} 
            	function jump(){
            		window.location.replace("index.jsp?name=<%=username%>");   
            	}
              if(mark){
              	init();
              }else{
            	 alert("登录失败！");
            	 window.location.replace("/hospital/");
              }
              </script> 
       <a href="login.jsp">[返回]</a>
   </center>
  </body>
</html>