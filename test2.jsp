
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>front</title> 
<script type="text/javascript" language="JavaScript"> 
<!-- 
var flag=false; 
function DrawImage(ImgD){ 
var image=new Image(); 
image.src=ImgD.src; 
if(image.width>0 && image.height>0){ 
flag=true; 
if(image.width/image.height>= 400/400){ 
if(image.width>400){ 
ImgD.width=400; 
ImgD.height=(image.height*400)/image.width; 
}else{ 
ImgD.width=image.width; 
ImgD.height=image.height; 
} 
ImgD.alt=image.width+"x"+image.height; 
} 
else{ 
if(image.height>400){ 
ImgD.height=400; 
ImgD.width=(image.width*400)/image.height; 
}else{ 
ImgD.width=image.width; 
ImgD.height=image.height; 
} 
ImgD.alt=image.width+"x"+image.height; 
} 
} 
} 
//--> 
</script> 
<style type="text/css"> 
<!-- 
* { 
margin:0; 
padding:0; 
} 
li { 
list-style:none; 
} 
img { 
border:0; 
} 
.group_head { 
width:400px; 
height:400px; 
line-height:400px; 
border:1px solid #ccc; 
overflow:hidden; 
position:relative; 
text-align:center; 
float:left; 
margin-right:10px; 
} 
.group_head p { 
position:static; 
+position:absolute; 
top:50%; 
vertical-align:middle 
} 
.group_head img { 
position:static; 
+position:relative; 
top:-50%;left:-50%; 
vertical-align:middle 
} 

--> 
</style> 
</head> 

<body>
 <% String name=request.getParameter("shuming");%> 
<div style="height:500px; width:1345px; position:absolute; background-image:url(Images/backF.jpg); ">
<ul class="jobGroup"> 
<li><a href="help.jsp?shuming=<%=name%>"><div style="margin-left:1130px; margin-top:51px; position:absolute;"><p><img width="80" height="65" src="Images/help.JPG" onload="DrawImage(this);"/></p></div></a>
<a href="setting.jsp?shuming=<%=name%>"><div style="margin-left:1227px; margin-top:50px; position:absolute;"><p><img width="84" height="64" src="Images/setting.JPG" onload="DrawImage(this);"/></p></div></a>
</li>
<br/> 
<li><a href="advise.jsp?shuming=<%=name%>"><div  style="margin-left:65px; margin-top:161px; position:absolute;"><img width="397" height="110" src="Images/firstadvise.jpg" onload="DrawImage(this);"/></div></a>
</li> 
<br/>
<li><a href="daisuifang_n.jsp?shuming=<%=name%>"><div style="margin-left:912px; margin-top:144px; position:absolute;"><p><img width="397" height="110" src="Images/daisuifang.jpg" onload="DrawImage(this);"/></p></div></a>
</li>
<br/> 
<li><a href="dailuoshi.jsp?shuming=<%=name%>"><div  style="margin-left:491px; margin-top:126px; position:absolute;"><p><img width="397" height="112" src="Images/dailuoshi.JPG" onload="DrawImage(this);"/></p></div></a>
</li>
<br/> 
<li><a href="patient_page.jsp?shuming=<%=name%>"><div  style="margin-left:65px; margin-top:280px; position:absolute;"><p><img width="397" height="110" src="Images/patienttable.jpg" onload="DrawImage(this);"/></p></div></a>
</li>
<br/> 
<li><a href="output.jsp?shuming=<%=name%>"><div  style="margin-left:490px; margin-top:263px; position:absolute;"><p><img width="397" height="110" src="Images/statistic.jpg" onload="DrawImage(this);"/></p></div></a>
</li>
<li><a href="cankao.jsp?shuming=<%=name%>"><div  style="margin-left:912px; margin-top:262px; position:absolute;"><p><img width="397" height="110" src="Images/reference.jpg" onload="DrawImage(this);"/></p></div></a>
</li> 

</ul> 
</div>
</body> 
</html>