<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="mylogin" class="PAC.login"></jsp:useBean>
<jsp:useBean id="mychecknum" class="PAC.makechecknum" scope="session"></jsp:useBean>
         

<html>
  <head>
    <title>带验证码的用户登录模块</title>
  </head>
      <%String shuming = request.getParameter("shuming"); %>
<script language=javascript>
//验证用户名
function jump(){
		var url = "setting4.jsp?shuming=<%=shuming%>";
		window.location.href = url;
}
</script>
  <body>
   <a   href="output/bannian.xls"   id=pic1   onclick="savepic();return false;"   style="cursor:hand">点击下载</a>  
   <a   href="output/bannian.xls"   id=pic1   onclick="saveit('output/bannian.xls')"   style="cursor:hand">点击下载</a>    
          <script>   
                 function   savepic()
                {   
                  if(document.all.a1==null)
                        {   
                                  objIframe=document.createElement("IFRAME");   
                                  document.body.insertBefore(objIframe);   
                                  objIframe.outerHTML=   "<iframe   name=a1   style='width:0;hieght:0'   src="+pic1.href+"></iframe>";   
                                  re=setTimeout("savepic()",1)   
                          }   
                 else
                        {   
                                  clearTimeout(re)   
                                  pic   =   window.open(pic1.href,"a1")   
                                  pic.document.execCommand("SaveAs")   
                                  document.all.a1.removeNode(true)   
                          }
                }   
                  
                  
                  function saveit(src) { 
                	  I1.document.location = src; 
                	  savexls(); 
                	  } 
                	  function savexls() { 
                	  if (I1.document.readyState == "complete") { 
                	  I1.document.execCommand("saveas"); 
                	  } else { 
                	  window.setTimeout("savexls()", 10); 
                	  } 
                	  } 
          </script> 
  </body>
</html>