<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="mychecknum" scope="page" class="PAC.makechecknum"></jsp:useBean>
<jsp:useBean id="mylogin" class="PAC.login"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%String shuming = request.getParameter("shuming"); %>
</head>
<body>
<style type="text/css">

.style1 {
	color: #6633CC;
	font-weight: bold;
	font-size: 13px;
}

.style3 {
	font-size: 12
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-left: 0px;
	margin-bottom: 0px;
}
form {width:1000px; margin: auto;}
a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}
.STYLE4 {font-size: 18px}
table{border-collapse: collapse;}
tr{border: 1px solid #666666;}
td {border: 1px solid #666666;}
td.star{color:red}
td.input{
	padding: 10px;
}
td.input:focus
{
	border: yellow;
}

#r_table td {
vertical-align: middle;
padding-top: 5px;
padding-bottom: 2px;
border-bottom: 1px solid #c9d7f1;
}

#r_table div {
display: block;
font-size: 14px;
font-weight: bold;
color: #666;
padding-bottom: 3px;
}
.r_cell_1 {
width: 100px;
padding-left: 10px;
font-size: 3px;
}

.b-content {
border: 1px solid #d9e7ff;
background: #FFF;
padding: 10px;
border-top: 0 none;
overflow: hidden;
-moz-border-radius: 0 0 4px 4px;
-webkit-border-radius: 0 0 4px 4px;
border-radius: 0 0 4px 4px;
clear: both;
width：80%;
margin: auto;

}
.corner {
-moz-border-radius: 4px;
-webkit-border-radius: 4px;
border-radius: 4px;
}

.input-text, select, textarea {
border: 1px solid #7F9DB9;
background: -moz-linear-gradient(top,#eee,#fff 8px);
background: -webkit-gradient(linear,0% 0%,0% 30%,from(#eee),to(#fff));
}

#r_table input, select, radio {
font-size: 18px;
margin-right: 10px;
}

</style>
<script language=javascript>
	function isRegisterAddress(s_address){
		var patrn_address=/^[a-zA-Z]{1}([a-zA-Z0-9]|[ .]){0,100}$/;
		return patrn_address.test(s_address);
	}
	function isRegisterPhone(s_phone){
		var patrn_phone=/^[+]{0,1}(\d){0,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
		return patrn_phone.test(s_phone);
	}
	function isRegisterUserName(s){
		var patrn=/^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){0,19}$/;
		return patrn.test(s);
	}
	function hash(key){
		var hash_num = 0;
		var len = key.length;
		var num;
		for(num=0;num<len;num++)
		{
			hash_num = hash_num*31 + key.charCodeAt(num);
		}
		hash_num = hash_num%100000000;
		return hash_num;
	}
	function doRegister(){
		//window.alert("register");
		var registerform = document.registerform;
		
		var username   = registerform.user_name.value;
		var password   = registerform.password.value;
		var password_r = registerform.password_r.value;
		//window.alert(username_hash);
		var phone      = registerform.shuming.value;

		
		if(username!="" && password!=""){

				//alert("username right");
				if(phone!=""){
					//alert("phone right");

						if(password == password_r){
							send_request("doregister.jsp?username="+username+"&password="+password+"&num="+phone+"&shuming=<%=shuming%>");
						}else{
							registerform.password.value = "";
							registerform.password_r.value = "";
							alert("请重新确认密码");
						}


				}
				else{
					//alert("error");
					if(registerform.shuming.value==""){
						alert("咨询员编号不能为空！");
					}
				}
		
		}else{
			alert("登录名或密码不能为空!");
		}
	}
	var http_request = false;
	function send_request(url){
		//window.alert(url);
		http_request = false;
		if(window.XMLHttpRequest){
			//window.alert("test xmlhttp");
			http_request = new XMLHttpRequest();
			if(http_request.overrideMimeType){
				http_request.overrideMimeType('text/xml');
			}
		}else if(window.ActiveXObject){
			//window.alert("test activexobject");
			try{
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			}catch(e){
				try{
					http_request = new ActiveXCObject("Microsoft.XMLHTTP");
				}catch(e){}
			}
		}
		if(!http_request){
			window.alert("不能创建XMLHttpRequest对象");
			return false;
		}
		//window.alert("success");
		http_request.onreadystatechange = processRequest;
		http_request.open("GET",url,true);
		http_request.send(null);
	}
	
	function processRequest(){
		var registerform = document.registerform;
		//window.alert(http_request.readyState);
		if(http_request.readyState == 4){
			//window.alert(http_request.status);
			if(http_request.status == 200){
				//window.alert("200 state");
				var res = http_request.responseText;
				if(res.indexOf("Exist") != -1){
					alert("用户已经存在，请重新注册");
					registerform.user_name.value = "";
					registerform.password.value = "";
					registerform.password_r.value = "";
					registerform.shuming.value = "";
		
				}else if(res.indexOf("success") == -1){
					alert("注册失败，请重新注册");
					registerform.user_name.value = "";
					registerform.password.value = "";
					registerform.password_r.value = "";
					registerform.shuming.value = "";	
				}else{
					alert("注册成功");
					window.location.href="setting5.jsp?shuming=<%=shuming%>";
					
				}
			}
		}
	}

</script>
<body>
<center>
<form action = "doregister.jsp" method="post" enctype = "application/x-www-form-urlencoded" name="registerform" target="_self">
	<br/>
	<br/>
	<table width="500" cellpadding="4" cellspacing="1" border="0">
	
	<tr  id="r_table">
			<td height="34" colspan="2" >
				<div align="center" class="STYLE4">
					
					<img width="500" height="30" src="Images/tianjiazixunyuan.jpg"/>						
				</div>								
			</td>
	</tr>
	<tr  id="r_table">
      <td class="r_cell_1"><div>咨询员登录名</div></td>
      <td class="star">
      	<input name="user_name" type="text" size="30" >
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>咨询员署名</div></td>
      <td class="star">
      	<input name="shuming" type="text" size="30" >
      </td>
    </tr>
	
	<tr  id="r_table">
      <td class="r_cell_1"><div>密码</div></td>
      <td class="star">
      	<input name="password" type="password" size="30" >
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>再次输入密码</div></td>
      <td class="star">
      	<input name="password_r" type="password" size="30" >
      </td>
    </tr>
    
	
	<tr>
	<td align="center" colspan="2">
	<input type="button" name="register" value="注册" onClick = "doRegister()"/>
	</td>
	</tr>
	
	</table>


</form>
</center>
</body>
</html>