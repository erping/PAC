<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*,java.lang.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <title>患者信息编辑</title>

        <link rel="stylesheet" href="public/css/reset.css" type="text/css">
        <link rel="stylesheet" href="public/css/default.css" type="text/css">
        <link rel="stylesheet" href="public/css/style.css" type="text/css">

        <link type="text/css" rel="stylesheet" href="libraries/syntaxhighlighter/public/css/shCoreDefault.css">

		<script src="./JS/jquery.js" type="text/javascript"></script>
		<script src="./JS/jquery.validate.js" type="text/javascript"></script>


        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/XRegExp.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shCore.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shLegacy.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shBrushJScript.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shBrushXML.js"></script>

        <script type="text/javascript">
            SyntaxHighlighter.defaults['toolbar'] = false;
            SyntaxHighlighter.all();
        </script>
<style type="text/css">

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

body {
	font-family:"微软雅黑";
	font-size: 16px;
	font-weight: bold;
	margin-left: 0px;
	margin-top: 0px;
	margin-left: 0px;
	margin-bottom: 0px;
}
table{border-collapse: collapse;}
tr{border: 1px solid #666666;}
td {border: 1px solid #666666;
vertical-align: middle;
padding-top: 5px;
padding-bottom: 1px;
border-bottom: 1px solid #c9d7f1;}
td.star{color:red}
td.input{
	padding: 10px;
}
td.input:focus
{
	border: yellow;
}
form {width:1000px; margin: auto;}
div {
font-family:"微软雅黑";
display: block;
font-size: 16px;
font-weight: bold;
padding-bottom: 1px;
}
input, select, radio {
font-family:"微软雅黑";
font-size: 16px;
margin-right: 5px;
}
</style>
</head>
<%
    	String num;
    	request.setCharacterEncoding("utf-8");
    	ResultSet Rs;
    	num=request.getParameter("num");
    	String SQL = "select * from patient_info where num="+"'"+num+"'";
    	Rs = dao.executeQuery(SQL);
    	Rs.next();
	request.setCharacterEncoding("utf-8");
  	String name=Rs.getString("name");
	String date=Rs.getString("date");
	String tel=Rs.getString("tel");
	String age=Rs.getString("age");
	String hun=Rs.getString("hun");
	String huji=Rs.getString("huji");
	String zhiye=Rs.getString("zhiye");
	String yuanyin=Rs.getString("yuanyin");
	String tingjing=Rs.getString("tingjing");
	String Bchao=Rs.getString("Bchao");
	String niliuchan=Rs.getString("niliuchan");
	String liudate=Rs.getString("liudate");
	String yuntime=Rs.getString("yuntime");
	String chantime=Rs.getString("chantime");
	String birth=Rs.getString("birth");
	String chanlater=Rs.getString("chanlater");
	String chantonow=Rs.getString("chantonow");
	String liutime=Rs.getString("liutime");
	String liulater=Rs.getString("liulater");
	String liutonow=Rs.getString("liutonow");
	String poutime=Rs.getString("poutime");
	String moci=Rs.getString("moci");
	String buru=Rs.getString("buru");
	String zhiru=Rs.getString("zhiru");
	String liu2=Rs.getString("liu2");
	String zigong=Rs.getString("zigong");
	String zhanlian=Rs.getString("zhanlian");
	String lieshang=Rs.getString("lieshang");
	String qitagaowei=Rs.getString("qitagaowei");
	String history=Rs.getString("history");
	String otherhistory=Rs.getString("otherhistory");
	String gaowei=Rs.getString("gaowei");
	String plan=Rs.getString("plan");
	String biyun=Rs.getString("biyun");
	String otherbiyun=Rs.getString("otherbiyun");
	String nibiyun=Rs.getString("nibiyun");
	String othernibiyun=Rs.getString("otherbiyun");
	String COCshijian=Rs.getString("COCshijian");
	String COCzhonglei=Rs.getString("COCzhonglei");
	String IUDfangzhi=Rs.getString("IUDfangzhi");
	String weiliji=Rs.getString("weiliji");
	String COCchufang=Rs.getString("COCchufang");
	String pinlv=Rs.getString("pinlv");
	String renshen=Rs.getString("renshen");
	String other=Rs.getString("other");
	String buliang=Rs.getString("buliang");
	String zhidao=Rs.getString("zhidao");
	String otherzixun=Rs.getString("otherzixun");
	String person=Rs.getString("person");
	String yisheng=Rs.getString("yisheng");
	String luoshi=Rs.getString("luoshi");
	String shijibiyun=Rs.getString("shijibiyun");
	String COCshijishijian=Rs.getString("COCshijishijian");
	        	/*<option value="1">流产当日</option>
          	<option value="2">流产后2周</option>
          	<option value="3">首次恢复月经</option>
          	<option value="4">流产后1个月</option>
          	<option value="5">流产后2-3个月</option>*/
  java.util.Date tmpDate;
  SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
  if(liudate.equals("")){
    tmpDate = new java.util.Date();
  }else{
  	tmpDate = df.parse(liudate);
  }
	if(COCshijian.equals("1")){ 
		COCshijishijian = liudate;
	}else if(COCshijian.equals("2")){ 
		COCshijishijian = df.format(new java.util.Date(tmpDate.getTime()+2*7*24*60*60*1000));
	}else if(COCshijian.equals("4")){
		COCshijishijian = df.format(new java.util.Date(tmpDate.getTime()+20*24*60*60*1000));
		tmpDate = df.parse(COCshijishijian);
		COCshijishijian = df.format(new java.util.Date(tmpDate.getTime()+10*24*60*60*1000));
	}else{
		COCshijishijian = df.format(new java.util.Date(tmpDate.getTime()));
	}
	String IUDshijifangzhi=Rs.getString("IUDshijifangzhi");
	String COCjianyichufang=Rs.getString("COCjianyichufang");
	String[] other_array = other.split(",");
	String[] biyun_array = biyun.split(",");
	String[] history_array = history.split(",");
	if(Rs.getString("otherzixun").equals("0"))
		otherzixun = "未填写";
	else
		otherzixun = Rs.getString("otherzixun");
	if(Rs.getString("tingjing").equals(""))
		tingjing="未填写";
	else
		tingjing=Rs.getString("tingjing");

	String result="";
	if(gaowei.equals("1")) {
		result+="此患者属于重点咨询对象<br/>原因：<br/>";
		if(Rs.getString("chantime").equals("0")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;生产次数为0，<br/>";
		}
		if(Rs.getString("liutime").compareTo("0")>0){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;流产次数大于等于1次，<br/>";
		}
		result+="&nbsp;&nbsp;&nbsp;&nbsp;应重点避免短期内再次人流对生殖健康的危害！";
	}else if(gaowei.equals("0"))
	{
		result="";	
	}
	else{
		result+="提示：此患者属于高危及重点咨询对象<br/>&nbsp;&nbsp;&nbsp;&nbsp;原因：<br/>";
		if(Rs.getString("liutime").compareTo("1")<0){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;人工流产大于等于三次，<br/>";
		}
		if(Rs.getString("liutonow").compareTo("0")>0&&Rs.getString("liutonow").compareTo("7")<0)
		{
			result+="&nbsp;&nbsp;&nbsp;&nbsp;末次人工流产时间小于六个月，<br/>";
		}
		if(Rs.getString("liu2").equals("1")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;在过去1年内>=2次人工流产(不含本次)，<br/>";
		}
		if(Rs.getString("birth").equals("1")&&Rs.getString("chantonow").compareTo("0")>0&&Rs.getString("chantonow").compareTo("4")<0)
		{
			result+="&nbsp;&nbsp;&nbsp;&nbsp;人工分娩时间小于三个月，<br/>";
		}
		if(Rs.getString("birth").equals("2")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;曾有剖宫产，<br/>";
		}
		if(Rs.getString("buru").equals("1")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;仍在哺乳期，<br/>";
		}
		if(Rs.getString("zhiru").equals("1")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;有胎盘植入/胎盘粘连史，<br/>";
		}
		if(Rs.getString("zigong").equals("1")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;曾有子宫穿孔，<br/>";
		}
		if(Rs.getString("zhanlian").equals("1")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;曾有宫腔粘连，<br/>";
		}
		if(Rs.getString("lieshang").equals("1")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;曾有宫颈阴道裂伤，<br/>";
		}
		if(Rs.getString("qitagaowei").equals("1")){
			result+="&nbsp;&nbsp;&nbsp;&nbsp;存在其他可能导致高危手术因素，<br/>";
		}
		result+="&nbsp;&nbsp;&nbsp;&nbsp;应重点避免短期内再次人流对生殖健康的危害！";
	}
	
%>
<%if(!gaowei.equals("0")){ %>
    			<script type="text/javascript">
    			sAlert("<%=result%>");
    			</script>
    	<%} %>
<script language="javascript">
function do_load(){
	var adviseform1 = document.adviseform1;
	var hun = document.getElementsByName("hun");
	for(var i=0;i<hun.length;i++) {//循环
        if(hun[i].value=="<%=hun%>"){  
            hun[i].checked=true;
            break; //停止循环
        }
   }
	var huji = document.getElementById("huji");
	for (var i = 0; i < huji.options.length; i++) { 
		if (huji.options[i].value =="<%=huji%>") { 
			huji.options[i].selected = true; 
		break; 
		} 
	} 
	var zhiye = document.getElementById("zhiye");
	for (var i = 0; i < zhiye.options.length; i++) { 
		if (zhiye.options[i].value =="<%=zhiye%>") { 
			zhiye.options[i].selected = true; 
		break; 
		} 
	} 
	var adviseform2 = document.adviseform2;
	var yuanyin = document.getElementsByName("yuanyin");
	for(var i=0;i<yuanyin.length;i++) {//循环
        if(yuanyin[i].value=="<%=yuanyin%>"){  
        	yuanyin[i].checked=true;
            break; //停止循环
        }
   }
	yiyuanChange(yuanyin);
	var Bchao = document.getElementById("Bchao");
	for (var i = 0; i < Bchao.options.length; i++) { 
		if (Bchao.options[i].value =="<%=Bchao%>") { 
			Bchao.options[i].selected = true; 
		break; 
		} 
	} 
	
	var niliuchan = document.getElementsByName("niliuchan");
	for(var i=0;i<niliuchan.length;i++) {//循环
        if(niliuchan[i].value=="<%=niliuchan%>"){  
        	niliuchan[i].checked=true;
            break; //停止循环
        }
   }
	
	var yuntime = document.getElementById("yuntime");
	for (var i = 0; i < yuntime.options.length; i++) { 
		if (yuntime.options[i].value =="<%=yuntime%>") { 
			yuntime.options[i].selected = true; 
		break; 
		} 
	} 
	yunChange(yuntime);
	var chantime = document.getElementById("chantime");
	for (var i = 0; i < chantime.options.length; i++) { 
		if (chantime.options[i].value =="<%=chantime%>") { 
			chantime.options[i].selected = true; 
		break; 
		} 
	} 
	chanChange(chantime);
	
	var birth = document.getElementsByName("birth");
	for(var i=0;i<birth.length;i++) {//循环
        if(birth[i].value=="<%=birth%>"){  
        	birth[i].checked=true;
            break; //停止循环
        }
   }
	
	var liutime = document.getElementById("liutime");
	for (var i = 0; i < liutime.options.length; i++) { 
		if (liutime.options[i].value =="<%=liutime%>") { 
			liutime.options[i].selected = true; 
		break; 
		} 
	}
	liuChange(liutime);
	
	var moci = document.getElementById("moci");
	for (var i = 0; i < moci.options.length; i++) { 
		if (moci.options[i].value =="<%=moci%>") { 
			moci.options[i].selected = true; 
		break; 
		} 
	}
	
	var buru = document.getElementsByName("buru");
	for(var i=0;i<buru.length;i++) {//循环
        if(buru[i].value=="<%=buru%>"){  
        	buru[i].checked=true;
            break; //停止循环
        }
   	}
	var zhiru = document.getElementsByName("zhiru");
	for(var i=0;i<zhiru.length;i++) {//循环
        if(zhiru[i].value=="<%=zhiru%>"){  
        	zhiru[i].checked=true;
            break; //停止循环
        }
   	}
	var liu2 = document.getElementsByName("liu2");
	for(var i=0;i<liu2.length;i++) {//循环
        if(liu2[i].value=="<%=liu2%>"){  
        	liu2[i].checked=true;
            break; //停止循环
        }
   	}
	var zigong = document.getElementsByName("zigong");
	for(var i=0;i<zigong.length;i++) {//循环
        if(zigong[i].value=="<%=zigong%>"){  
        	zigong[i].checked=true;
            break; //停止循环
        }
   	}
	var zhanlian = document.getElementsByName("zhanlian");
	for(var i=0;i<zhanlian.length;i++) {//循环
        if(zhanlian[i].value=="<%=zhanlian%>"){  
        	zhanlian[i].checked=true;
            break; //停止循环
        }
   	}
	var lieshang = document.getElementsByName("lieshang");
	for(var i=0;i<lieshang.length;i++) {//循环
        if(lieshang[i].value=="<%=lieshang%>"){  
        	lieshang[i].checked=true;
            break; //停止循环
        }
   	}
	var qitagaowei = document.getElementsByName("qitagaowei");
	for(var i=0;i<qitagaowei.length;i++) {//循环
        if(qitagaowei[i].value=="<%=qitagaowei%>"){  
        	qitagaowei[i].checked=true;
            break; //停止循环
        }
   	}
	var other = document.getElementsByName("other");
	<%for(int j=0;j<other_array.length;j++){%>
		for(var i=0;i<other.length;i++) {//循环
        if(other[i].value=="<%=other_array[j]%>"){  
            other[i].checked="checked";
        	}
   		}
	<%}%>
	var history = document.getElementsByName("history");
	<%for(int j=0;j<history_array.length;j++){%>
		for(var i=0;i<history.length;i++) {//循环
        if(history[i].value=="<%=history_array[j]%>"){  
        	history[i].checked="checked";
        	}
   		}
	<%}%>
	var biyun = document.getElementsByName("biyun");
	<%for(int j=0;j<biyun_array.length;j++){%>
		for(var i=0;i<biyun.length;i++) {//循环
        if(biyun[i].value=="<%=biyun_array[j]%>"){  
        	biyun[i].checked="checked";
        	}
   		}
	<%}%>
	var adviseform3 = document.adviseform3;
	var plan = document.getElementById("plan");
	for (var i = 0; i < plan.options.length; i++) { 
		if (plan.options[i].value =="<%=plan%>") { 
			plan.options[i].selected = true; 
		break; 
		} 
	}	
	var nibiyun = document.getElementById("nibiyun");
	for (var i = 0; i < nibiyun.options.length; i++) { 
		if (nibiyun.options[i].value =="<%=nibiyun%>") { 
			nibiyun.options[i].selected = true; 
		break; 
		} 
	}
	nibiyunChange(nibiyun);
	var COCshijian = document.getElementById("COCshijian");
	for (var i = 0; i < COCshijian.options.length; i++) { 
		if (COCshijian.options[i].value =="<%=COCshijian%>") { 
			COCshijian.options[i].selected = true; 
		break; 
		} 
	}
	var IUDfangzhi = document.getElementById("IUDfangzhi");
	for (var i = 0; i < IUDfangzhi.options.length; i++) { 
		if (IUDfangzhi.options[i].value =="<%=IUDfangzhi%>") { 
			IUDfangzhi.options[i].selected = true; 
		break; 
		} 
	}
	var COCchufang = document.getElementsByName("COCchufang");
	for(var i=0;i<COCchufang.length;i++) {//循环
        if(COCchufang[i].value=="<%=COCchufang%>"){  
        	COCchufang[i].checked=true;
            break; //停止循环
        }
   	}
	var buliang = document.getElementsByName("buliang");
	for(var i=0;i<buliang.length;i++) {//循环
        if(buliang[i].value=="<%=buliang%>"){  
        	buliang[i].checked=true;
            break; //停止循环
        }
   	}
	var zhidao = document.getElementsByName("zhidao");
	for(var i=0;i<zhidao.length;i++) {//循环
        if(zhidao[i].value=="<%=zhidao%>"){  
        	zhidao[i].checked=true;
            break; //停止循环
        }
   	}
	
	doctorChange();
	
	var pinlv = document.getElementById("pinlv");
	for (var i = 0; i < pinlv.options.length; i++) { 
		if (pinlv.options[i].value =="<%=pinlv%>") { 
			pinlv.options[i].selected = true; 
		break; 
		} 
	}
	var renshen = document.getElementById("renshen");
	for (var i = 0; i < renshen.options.length; i++) { 
		if (renshen.options[i].value =="<%=renshen%>") { 
			renshen.options[i].selected = true; 
		break; 
		} 
	}
	var yisheng = document.getElementById("yisheng");
	for (var i = 0; i < yisheng.options.length; i++) { 
		if (yisheng.options[i].value =="<%=yisheng%>") { 
			yisheng.options[i].selected = true; 
		break; 
		} 
	}
	var shijibiyun = document.getElementById("shijibiyun");
	for (var i = 0; i < yisheng.options.length; i++) { 
		if (shijibiyun.options[i].value =="<%=shijibiyun%>") { 
			shijibiyun.options[i].selected = true; 
		break; 
		} 
	}
	shijibiyunChange(shijibiyun);
	var COCzhonglei = document.getElementById("COCzhonglei");
	for (var i = 0; i < COCzhonglei.options.length; i++) { 
		if (COCzhonglei.options[i].value =="<%=COCzhonglei%>") { 
			COCzhonglei.options[i].selected = true; 
		break; 
		} 
	}
	var COCjianyichufang = document.getElementsByName("COCjianyichufang");
	for(var i=0;i<COCjianyichufang.length;i++) {//循环
        if(COCjianyichufang[i].value=="<%=COCjianyichufang%>"){  
        	COCjianyichufang[i].checked=true;
            break; //停止循环
        }
   	}
	
}
window.onload=do_load;

function do_single(){
	
	var form=document.forms[0];//将当前页第二个表单赋给变量form，以便以后引用
    for(var i=0;i<form.elements.length;i++)//循环表单内的元素数组的最大项
    {
        if(form.elements[i].type=="text")//如果当前元素的类型是text
        {
            form.elements[i].readOnly="true";//那就把他的值赋成 田洪川
        }    
        else if(form.elements[i].type=="radio")//如果是复选框
        {
            form.elements[i].disabled="disabled";//取消选择 
        }
        else if(form.elements[i].type=="checkbox")//如果是复选框
        {
            form.elements[i].disabled="disabled";//取消选择 
        }
        else if(form.elements[i].type=="button")//如果是复选框
        {
            form.elements[i].disabled="disabled";//取消选择 
        }
    }
    var selects = form.getElementsByTagName("select");
    for(var i=0;i<selects.length;i++)//循环表单内的元素数组的最大项
    {
    	selects[i].disabled=true;
    }
    document.getElementById("edit1").style.display = "table-row";
    document.getElementById("save1").style.display = "none";
}
function do_single2(){
	
	var form=document.forms[0];//将当前页第二个表单赋给变量form，以便以后引用
    for(var i=0;i<form.elements.length;i++)//循环表单内的元素数组的最大项
    {
        if(form.elements[i].type=="text")//如果当前元素的类型是text
        {
            form.elements[i].readOnly="";//那就把他的值赋成 田洪川
        }    
        else if(form.elements[i].type=="radio")//如果是复选框
        {
            form.elements[i].disabled="";//取消选择 
        }
        else if(form.elements[i].type=="checkbox")//如果是复选框
        {
            form.elements[i].disabled="";//取消选择 
        }
        else if(form.elements[i].type=="button")//如果是复选框
        {
            form.elements[i].disabled="";//取消选择 
        }
    }
    var selects = form.getElementsByTagName("select");
    for(var i=0;i<selects.length;i++)//循环表单内的元素数组的最大项
    {
    	selects[i].disabled="";
    }
    document.getElementById("edit1").style.display = "none";
    document.getElementById("save1").style.display = "table-row";
}

function doctor_display(biyun){
	var shijibiyun = document.getElementById("shijibiyun");
	if(biyun!="0"){
		shijibiyun.disabled=false;
	}
}


function do_normal(){
	
	var form=document.forms[1];//将当前页第二个表单赋给变量form，以便以后引用
	var liutime = form.liutime.value;
	var chantime = form.chantime.value;
	var liutonow = form.liutonow.value;
	var birth = form.birth.value;
	var chantonow = form.chantonow.value;
	var liu2 = form.liu2.value;
	var zigong = form.zigong.value;
	var zhanlian = form.zhanlian.value;
	var lieshang = form.lieshang.value;
	var zhiru = form.zhiru.value;
	var buru = form.buru.value;
	var qitagaowei = form.qitagaowei.value;
    for(var i=0;i<form.elements.length;i++)//循环表单内的元素数组的最大项
    {
        if(form.elements[i].type=="text")//如果当前元素的类型是text
        {
            form.elements[i].readOnly="true";//那就把他的值赋成 田洪川
        }    
        else if(form.elements[i].type=="radio")//如果是复选框
        {
            form.elements[i].disabled="disabled";//取消选择 
        }
        else if(form.elements[i].type=="checkbox")//如果是复选框
        {
            form.elements[i].disabled="disabled";//取消选择 
        }
        else if(form.elements[i].type=="button")//如果是复选框
        {
            form.elements[i].disabled="disabled";//取消选择 
        }
    }
    var selects = form.getElementsByTagName("select");
    for(var i=0;i<selects.length;i++)//循环表单内的元素数组的最大项
    {
    	selects[i].disabled=true;
    }
    document.getElementById("edit2").style.display = "table-row";
    document.getElementById("save2").style.display = "none";
    var tag = 0;
    var tag2 = 1;
    var result1 = "此患者属于重点咨询对象：<br/>原因：<br/>";
    if(chantime==0){
    	result1 = result1+"&nbsp;&nbsp;&nbsp;&nbsp;生产次数为0，<br/>";
    	tag = 1;
    }
    if(liutime>=1){
    	result1 = result1+"&nbsp;&nbsp;&nbsp;&nbsp;流产次数大于等于1次，<br/>"
    	tag = 1;
    }
    result1 = result1+"应重点避免短期内再次人流对生殖健康的危害！";
    var result2 = "提示：此患者属于高危及重点咨询对象：<br/>原因：<br/>";
    if(liutime>=3){
    	
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;人工流产大于等于三次，<br/>";
    	tag2++;
    }
    if(liutonow<=6&&liutonow>=1){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;末次人工流产时间小于六个月，<br/>";
    	tag2++;
    }
    if(liu2==1){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;在过去1年内>=2次人工流产(不含本次)，<br/>";
    	tag2++;
    }
    if(birth==1){
    	if(chantonow<=6&&chantonow>0){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;人工分娩时间小于三个月，<br/>";
    	tag2++;
    	}
    }else if(birth==2){
    	if(chantonow<=3&&chantonow>0){
    		result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;剖宫产时间小于六个月，<br/>";
    		tag2++;
    	}
    }
    if(buru==1){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;仍在哺乳期，<br/>";
    	tag2++;
    }
    if(zhiru==1){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;有胎盘植入/胎盘粘连史，<br/>";
    	tag2++;
    }
    if(zigong==1){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;曾有子宫穿孔，<br/>";
    	tag2++;
    }
    if(zhanlian==1){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;曾有宫腔粘连，<br/>";
    	tag2++;
    }
    if(lieshang==1){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;曾有宫颈阴道裂伤，<br/>";
    	tag2++;
    }
    if(qitagaowei==1){
    	result2 = result2+"&nbsp;&nbsp;&nbsp;&nbsp;存在其他可能导致高危手术因素，<br/>";
    	tag2++;
    }
    result2 = result2+"应重点避免短期内再次人流对生殖健康的危害！";
    if(tag2>1)
    	sAlert(result2);
    else if(tag==1)
    	sAlert(result1);
    
}
function do_normal2(){
	
	var form=document.forms[1];//将当前页第二个表单赋给变量form，以便以后引用
	var liutime = form.liutime.value;
	var chantime = form.chantime.value;
	var liutonow = form.liutonow.value;
	var birth = form.birth.value;
	var chantonow = form.chantonow.value;
	var liu2 = form.liu2.value;
	var zigong = form.zigong.value;
	var zhanlian = form.zhanlian.value;
	var lieshang = form.lieshang.value;
	var zhiru = form.zhiru.value;
	var buru = form.buru.value;
	var qitagaowei = form.qitagaowei.value;
    for(var i=0;i<form.elements.length;i++)//循环表单内的元素数组的最大项
    {
        if(form.elements[i].type=="text")//如果当前元素的类型是text
        {
            form.elements[i].readOnly="false";//那就把他的值赋成 田洪川
        }    
        else if(form.elements[i].type=="radio")//如果是复选框
        {
            form.elements[i].disabled="";//取消选择 
        }
        else if(form.elements[i].type=="checkbox")//如果是复选框
        {
            form.elements[i].disabled="";//取消选择 
        }
        else if(form.elements[i].type=="button")//如果是复选框
        {
            form.elements[i].disabled="";//取消选择 
        }
    }
    var selects = form.getElementsByTagName("select");
    for(var i=0;i<selects.length;i++)//循环表单内的元素数组的最大项
    {
    	selects[i].disabled=false;
    }
    document.getElementById("edit2").style.display = "none";
    document.getElementById("save2").style.display = "table-row";
}
function do_advise(){
	
	var adviseform1 = document.adviseform1;
	var name = adviseform1.name.value;
	var date = adviseform1.date.value;
	var tel = adviseform1.tel.value;
	var num = adviseform1.num.value;
	var age = adviseform1.age.value;
	var hun = adviseform1.hun.value;
	var huji = adviseform1.huji.value;
	var zhiye = adviseform1.zhiye.value;
	
	var adviseform2 = document.adviseform2;
	var yuanyin = adviseform2.yuanyin.value;
	var tingjing = adviseform2.tingjing.value;
	var Bchao = adviseform2.Bchao.value;
	var niliuchan = adviseform2.niliuchan.value;
	var liudate = adviseform2.liudate.value;
	var yuntime = adviseform2.yuntime.value;
	var chantime = adviseform2.chantime.value;
	var chanlater = adviseform2.chanlater.value;
	var chantonow = adviseform2.chantonow.value;
	var birth = adviseform2.birth.value;
	var poutime = adviseform2.poutime.value;
	var buru = adviseform2.buru.value;
	var zhiru = adviseform2.zhiru.value;
	var liutime = adviseform2.liutime.value;
	var moci = adviseform2.moci.value;
	var liulater = adviseform2.liulater.value;
	var liutonow = adviseform2.liutonow.value;
	var liu2 = adviseform2.liu2.value;
	var zigong = adviseform2.zigong.value;
	var zhanlian = adviseform2.zhanlian.value;
	var lieshang = adviseform2.lieshang.value;
	var qitagaowei = adviseform2.qitagaowei.value;
	var history = "";
	var otherhistory = adviseform2.otherhistory.value;
	var gaowei = 1;
	var zhongdian = 0;
    if(chantime==0){
    	zhongdian = 1;
    }
    if(liutime>=1){
    	zhongdian = 1;
    }
    if(liutime>=3){
    	gaowei++;
    }
    if(liutonow<=6&&liutonow>=1){
    	gaowei++;
    }
    if(liu2==1){
    	gaowei++;
    }
    if(birth==1){
    	if(chantonow<=6&&chantonow>0){
    		gaowei++;
    	}
    }else if(birth==2){
    	if(chantonow<=3&&chantonow>0){
    		gaowei++;
    	}
    }
    if(buru==1){
    	gaowei++;
    }
    if(zhiru==1){
    	gaowei++;
    }
    if(zigong==1){
    	gaowei++;
    }
    if(zhanlian==1){
    	gaowei++;
    }
    if(lieshang==1){
    	gaowei++;
    }
    if(qitagaowei==1){
    	gaowei++;
    }
    if(gaowei>1){
    	zhongdian=gaowei;}
	var historybox = document.getElementsByName("history");
	for(var i=0;i<historybox.length;i++){
		if(historybox[i].checked){
			history+=historybox[i].value+",";
		}
	}
	history=history.substring(0,history.length-1);
	
	var adviseform3 = document.adviseform3;
	var renshen = adviseform3.renshen.value;
	var biyun = "";
	var otherbiyun = adviseform3.otherbiyun.value;
	var plan = adviseform3.plan.value;
	var pinlv = adviseform3.pinlv.value;
	var other = "";
	var nibiyun = adviseform3.nibiyun.value;
	var othernibiyun = adviseform3.othernibiyun.value;
	var COCshijian = adviseform3.COCshijian.value;
	var IUDfangzhi = adviseform3.IUDfangzhi.value;
	var weiliji = adviseform3.weiliji.value;
	var COCchufang = adviseform3.COCchufang.value;
	var buliang = adviseform3.buliang.value;
	var zhidao = adviseform3.zhidao.value;
	var otherzixun = adviseform3.otherzixun.value;
	var person = "<%=request.getParameter("shuming")%>";
	var yisheng = adviseform3.yisheng.value;
	var shijibiyun = adviseform3.shijibiyun.value;
	var COCzhonglei = adviseform3.COCzhonglei.value;
	var COCshijishijian = adviseform3.COCshijishijian.value;
	var IUDshijifangzhi = adviseform3.IUDshijifangzhi.value;
	var COCjianyichufang = adviseform3.COCjianyichufang.value;
	
	var luoshi=0;
	if(shijibiyun!="0")
		{luoshi=1;}
	//window.alert("yisheng:"+yisheng+" luoshi:"+luoshi);
	//window.alert(username_hash);
	var biyunbox = document.getElementsByName("biyun");
	for(var i=0;i<biyunbox.length;i++){
		if(biyunbox[i].checked){
			biyun+=biyunbox[i].value+",";
		}
	}
	biyun=biyun.substring(0,biyun.length-1);
	
	var otherbox = document.getElementsByName("other");
	for(var i=0;i<biyunbox.length;i++){
		if(otherbox[i].checked){
			other+=otherbox[i].value+",";
		}
	}
	other=other.substring(0,other.length-1);
	
	if(name.value!="" && num.value!=""){
		//window.alert(loginForm.user_name.value + "  " + loginForm.password.value);
		url="do_edit.jsp?name="+name+"&date="+date+"&tel="+tel+"&num="+num+"&age="+age+"&hun="+hun+"&huji="+huji+"&zhiye="+zhiye
		+"&yuanyin="+yuanyin+"&tingjing="+tingjing+"&Bchao="+Bchao+"&niliuchan="+niliuchan+"&liudate="+liudate+"&yuntime="+yuntime
		+"&chantime="+chantime+"&chanlater="+chanlater+"&chantonow="+chantonow+"&birth="+birth+"&poutime="+poutime+"&buru="+buru+"&zhiru="+zhiru
		+"&liutime="+liutime+"&moci="+moci+"&liulater="+liulater
		+"&liutonow="+liutonow+"&liu2="+liu2+"&zigong="+zigong+"&zhanlian="+zhanlian+"&lieshang="+lieshang
		+"&qitagaowei="+qitagaowei+"&history="+history+"&otherhistory="+otherhistory+"&gaowei="+zhongdian
		+"&renshen="+renshen+"&plan="+plan+"&biyun="+biyun+"&otherbiyun="+otherbiyun+"&pinlv="+pinlv+"&other="+other+"&nibiyun="+nibiyun+"&othernibiyun="+othernibiyun
		+"&COCshijian="+COCshijian+"&COCzhonglei="+COCzhonglei+"&IUDfangzhi="+IUDfangzhi+"&weiliji="+weiliji+"&COCchufang="+COCchufang
		+"&buliang="+buliang+"&zhidao="+zhidao+"&otherzixun="+otherzixun+"&person="+person+"&yisheng="+yisheng+"&shijibiyun="+shijibiyun
		+"&COCshijishijian="+COCshijishijian+"&IUDshijifangzhi="+IUDshijifangzhi+"&COCjianyichufang="+COCjianyichufang+"&luoshi="+luoshi;
	window.location.href = url;

	}else{
		sAlert("用户名或者病历号不能为空");
	}	
	
}

var doctor_array = new Array();
var count=0;
<%
String sql = "select * from doctor_list";
ResultSet rs = dao.executeQuery(sql);
while(rs.next()){
	System.out.println("doctor name:"+rs.getString("name"));
	%>
	doctor_array[count] = "<%=rs.getString("name") %>";
	//alert(doctor_array[i]);
	count++;
	<%
}
%>

function doctorChange(){
	var yisheng = document.getElementById("yisheng");
	yisheng.length=0;
	var option = new Option("",0); 
	//alert(doctor_array[i]);
	yisheng.options[0]=option;
	//alert(doctor_array.length);
	for(var i=0;i<doctor_array.length;i++){
		var option = new Option(doctor_array[i],i); 
		//alert(doctor_array[i]);
		yisheng.options[i+1]=option;
	}
}

var time = new Array(); 
time[0]= "0" ; 
time[1]= "1" ; 
time[2]= "2" ; 
time[3]= "3" ;
time[4]= "4" ;
time[5]= "5" ;
time[6]= "6" ;
time[7]= "7" ;
time[8]= "8" ;
time[9]= "9" ;
time[10]= "10" ;
time[11]= "10次以上" ;

function yunChange(yun)
{
	var chan=document.getElementById("chantime");
	chan.length=0;
	var liu = document.getElementById("liutime");
	liu.length=0;
	for(var i=0;i<yun.value;i++) 
	{ 
	var option = new Option(time[i],i); 
	chan.options[i]=option; 
	} 
		//document.all('dischan').style.display = 'none';
		 var list = document.getElementsByClassName("dischan");
		 for(var i = 0, l = list.length; i < l; i++) {
		     var objTemp = list[i];
		     objTemp.style.display = "none";
		 }
		 var list2 = document.getElementsByClassName("disjiwang");
		 for(var i = 0, l = list2.length; i < l; i++) {
		     var objTemp = list2[i];
		     objTemp.style.display = "none";
		 }
		 var list3 = document.getElementsByClassName("disliu");
		 for(var i = 0, l = list3.length; i < l; i++) {
		     var objTemp = list3[i];
		     objTemp.style.display = "none";

		 }
	 
}

function pouChange(pou)
{
	var chan=document.getElementById("chantime");
	
	var poutime=document.getElementById("poutime");
	poutime.length=0;
	for(var i=0;i<=chan.value;i++) 
	{ 
	var option = new Option(time[i],i); 
	poutime.options[i]=option; 

	} 
		//document.all('dischan').style.display = 'none';
	if(chan.value>1&&pou.value=="2"){
		 var list = document.getElementsByClassName("dispou");
		 for(var i = 0, l = list.length; i < l; i++) {
		     var objTemp = list[i];
		     objTemp.style.display = "table-row";
		 }
	}
	else{
		var list = document.getElementsByClassName("dispou");
		 for(var i = 0, l = list.length; i < l; i++) {
		     var objTemp = list[i];
		     objTemp.style.display = "none";
		 }
	}
	 
}

function shengyu(sheng)
{
	if(sheng.value=="1")
		sAlert("计划在半年内生育！");
	
}

function chanChange(chan)
{
 if(chan.value == "0")
 {	//document.all('dischan').style.display = 'none';
	 var list = document.getElementsByClassName("dischan");
	 for(var i = 0, l = list.length; i < l; i++) {
	    var objTemp = list[i];
	    objTemp.style.display = "none";
	 }
	 
 } 
 else
 {
	var list = document.getElementsByClassName("dischan");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";

	 }
	 
 }
 
 var yun = document.getElementById("yuntime");
//	var ziranliu=document.getElementById("ziranliutime");
//	ziranliu.length=0;
 if((yun.value-chan.value)>1)
 {	//document.all('dischan').style.display = 'none';
	 var list = document.getElementsByClassName("disjiwang");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
	 var liu=document.getElementById("liutime");
	 for(var i=0;i<(yun.value-chan.value+1);i++) 
	 { 
	 var option = new Option(time[i],i); 
	 liu.options[i]=option; 

	 } 
 } 
 else
 {
	var list = document.getElementsByClassName("disjiwang");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";

	 }
	 var list2 = document.getElementsByClassName("disliu");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "none";

	 }

	 var list3 = document.getElementsByClassName("dischan");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "table-row";

	 }
	 if(chan.value == 0)
 	{	//document.all('dischan').style.display = 'none';
	 var list = document.getElementsByClassName("dischan");
	 for(var i = 0, l = list.length; i < l; i++) {
	    var objTemp = list[i];
	    objTemp.style.display = "none";
	 }
	 
 } 

 }


 
 var listpou = document.getElementsByClassName("dispou");
 for(var i = 0, l = listpou.length; i < l; i++) {
     var objTemp = listpou[i];
     objTemp.style.display = "none";}
}

function liuChange(liu)
{
 if(liu.value==0)
 {	
	 var list = document.getElementsByClassName("disliu");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disliu");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";

	 }
 }
// var yun = document.getElementById("yuntime");
// var chan = document.getElementById("chantime");
// var ziranliu=document.getElementById("ziranliutime");
// ziranliu.length=0;
// var size = yun.value-chan.value-liu.value+1;
// for(var i=0;i<size;i++) 
// { 
// var option = new Option(time[i],i); 
// ziranliu.options[i]=option; 
//
// } 

}

function historyChange(history)
{
 if(history.checked)
 {	
	 var list = document.getElementsByClassName("dishistory");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("dishistory");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function exhistoryChange(exhistory)
{
 if(exhistory.checked)
 {	
	 var list = document.getElementsByClassName("disexhistory");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disexhistory");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function biyunChange(biyun)
{
 if(biyun.checked)
 {	
	 var list = document.getElementsByClassName("disbiyun");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disbiyun");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function nibiyunChange(nibiyun)
{
	if(nibiyun.value=="1"){
		var list = document.getElementsByClassName("disCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "table-row";
		}
	 	var list2 = document.getElementsByClassName("disIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "none";
		}
	 	var list3 = document.getElementsByClassName("disnibiyun");
	 	for(var i = 0, l = list3.length; i < l; i++) {
	     	var objTemp = list3[i];
	     	objTemp.style.display = "none";
		}
	}
	else if(nibiyun.value=="2"||nibiyun.value=="3"||nibiyun.value=="5")
 	{	
		var list = document.getElementsByClassName("disCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "none";
		}
	 	var list2 = document.getElementsByClassName("disIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "table-row";
		}
	 	var list3 = document.getElementsByClassName("disnibiyun");
	 	for(var i = 0, l = list3.length; i < l; i++) {
	     	var objTemp = list3[i];
	     	objTemp.style.display = "none";
		}
 	} 
	else if(nibiyun.value=="7")
 	{	
		var list = document.getElementsByClassName("disCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "none";
		}
	 	var list2 = document.getElementsByClassName("disIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "none";
		}
	 	var list3 = document.getElementsByClassName("disnibiyun");
	 	for(var i = 0, l = list3.length; i < l; i++) {
	     	var objTemp = list3[i];
	     	objTemp.style.display = "table-row";
		}
 	} 
 	else
 	{
 		var list = document.getElementsByClassName("disCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "none";
		}
	 	var list2 = document.getElementsByClassName("disIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "none";
		}
	 	var list3 = document.getElementsByClassName("disnibiyun");
	 	for(var i = 0, l = list3.length; i < l; i++) {
	     	var objTemp = list3[i];
	     	objTemp.style.display = "none";
		}
 	}
 	// 消除落实界面显示两个弹框
	//if(nibiyun.value=="4"||nibiyun.value=="7"||nibiyun.value=="8"){
	//	sAlert("此患者属高危或重点，请关注高效避孕方式落实！");
	//}
}

function shijibiyunChange(nibiyun)
{
	if(nibiyun.value=="1"){
		var list = document.getElementsByClassName("disshijiCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "table-row";
		}
	 	var list2 = document.getElementsByClassName("disshijiIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "none";
		}
	 	var list3 = document.getElementsByClassName("disshijibiyun");
	 	for(var i = 0, l = list3.length; i < l; i++) {
	     	var objTemp = list3[i];
	     	objTemp.style.display = "none";
		}
	}
	else if(nibiyun.value=="2"||nibiyun.value=="3"||nibiyun.value=="5")
 	{	
		var list = document.getElementsByClassName("disshijiCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "none";
		}
	 	var list2 = document.getElementsByClassName("disshijiIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "table-row";
		}
	 	var list3 = document.getElementsByClassName("disshijibiyun");
	 	for(var i = 0, l = list3.length; i < l; i++) {
	     	var objTemp = list3[i];
	     	objTemp.style.display = "none";
		}
 	} 
	else if(nibiyun.value=="7")
 	{	
		var list = document.getElementsByClassName("disshijiCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "none";
		}
	 	var list2 = document.getElementsByClassName("disshijiIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "none";
		}
	 	var list3 = document.getElementsByClassName("disshijibiyun");
	 	for(var i = 0, l = list3.length; i < l; i++) {
	     	var objTemp = list3[i];
	     	objTemp.style.display = "table-row";
		}
 	} 
 	else
 	{
 		var list = document.getElementsByClassName("disshijiCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "none";
		}
	 	var list2 = document.getElementsByClassName("disshijiIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "none";
		}
	 	var list3 = document.getElementsByClassName("disshijibiyun");
	 	for(var i = 0, l = list3.length; i < l; i++) {
	     	var objTemp = list3[i];
	     	objTemp.style.display = "none";
		}
 	}
}

function lijiChange(liji)
{
 if(liji.value=="1"||liji.value=="0")
 {	
	 var list = document.getElementsByClassName("disliji");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disliji");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 }
}

function yiyuanChange(yiyuan)
{
 if(yiyuan.value=="1")
 {	
	 var list = document.getElementsByClassName("disyiyuan");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disyiyuan");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 }
}


function chanToNow(chanlater)
{	
	var today = new Date();
	var chantonow = document.getElementById("chantonow");
	var chan = chanlater.value.split("-");
	var year = chan[0];
	var month = chan[1];
	var i = (today.getFullYear()-year)*12+(today.getMonth()-month)+1;
	chantonow.value = i;
}

function liuToNow(liulater)
{	
	var today = new Date();
	var liutonow = document.getElementById("liutonow");
	var liu = liulater.value.split("-");
	var year = liu[0];
	var month = liu[1];
	var i = (today.getFullYear()-year)*12+(today.getMonth()-month)+1;
	liutonow.value = i;
}
function check(check)
{	
	if(check.value=="")
		sAlert("此为必填项，请输入！");
}


function sAlert(txt){

var eSrc=(document.all)?window.event.srcElement:arguments[1];
var shield = document.createElement("DIV");
shield.id = "shield";
shield.style.position = "absolute";
shield.style.left = "0px";
shield.style.top = "0px";
shield.style.width = "100%";
shield.style.height = ((document.documentElement.clientHeight>document.documentElement.scrollHeight)?document.documentElement.clientHeight:document.documentElement.scrollHeight)+"px";
shield.style.background = "#333";
shield.style.textAlign = "center";
shield.style.zIndex = "10000";
shield.style.filter = "alpha(opacity=0)";
shield.style.opacity = 0;
var alertFram = document.createElement("DIV");
alertFram.id="alertFram";
alertFram.style.position = "absolute";
alertFram.style.left = "50%";
alertFram.style.top = "50%";
alertFram.style.marginLeft = "-225px" ;
alertFram.style.marginTop = -75+document.body.scrollTop+"px";
//documentElement
alertFram.style.width = "400px";
alertFram.style.height = "225px";
alertFram.style.background = "#ccc";
alertFram.style.textAlign = "center";
alertFram.style.lineHeight = "20px";
alertFram.style.zIndex = "10001";
strHtml   = "<ul style=\"background-image:url(Images/alertnew2.jpg);list-style:none;margin:0px;padding:0px;width:100%;\">\n";
strHtml += " <li style=\"color:red;text-align:left;font-size:16px;font-weight:bold;margin-left: 20px;margin-right: 20px;height:193px;border-left:0px solid #F9CADE;border-right:0px solid #F9CADE;\"><br/><br/>"+txt+"<br/><br/></li>\n";
strHtml += "<li style=\"text-align:center;\"><input type=\"image\" id=\"do_OK\" src=\"Images/sure.jpg\" onClick=\"doOk()\"/></li></ul>\n";
alertFram.innerHTML = strHtml;
document.body.appendChild(alertFram);
document.body.appendChild(shield);
this.setOpacity = function(obj,opacity){
if(opacity>=1)opacity=opacity/100;
try{ obj.style.opacity=opacity; }catch(e){}
try{ 
if(obj.filters.length>0&&obj.filters("alpha")){
 obj.filters("alpha").opacity=opacity*100;
}else{
 obj.style.filter="alpha(opacity=\""+(opacity*100)+"\")";
}
}catch(e){}
}
var c = 0;
this.doAlpha = function(){
if (++c > 20){clearInterval(ad);return 0;}
setOpacity(shield,c);
}
var ad = setInterval("doAlpha()",1);
this.doOk = function(){
//alertFram.style.display = "none";
//shield.style.display = "none";

	document.body.removeChild(alertFram);
	document.body.removeChild(shield);

//eSrc.focus();
document.body.onselectstart = function(){return true;}
document.body.oncontextmenu = function(){return true;}
}
document.getElementById("do_OK").focus();
//eSrc.blur();
document.body.onselectstart = function(){return false;}
document.body.oncontextmenu = function(){return false;}
}

</script>
<body>
<CENTER>
<form action="javascript:void(0)" name="adviseform1" id="Form1" method="post" accept-charset="utf-8">
  <table class="b-content" width=601>
    	
    	<tr>
    		<td  colspan="2">
    		<img width="601" height="113" src="Images/protect2.jpg"/>
			</td>
    	</tr>
    	<%if(!gaowei.equals("0")) {%>
		<script type="text/javascript">
    			var resultgaowei = "<%=result%>";
    			sAlert(resultgaowei);
    			</script>
    			<%} %>
    	<tr>
    		<td  colspan="2" align="right">
    			<a href="test2.jsp"><img width="60" height="30" src="Images/back.jpg"/></a>
			</td>
    	</tr>
    	<%
    	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    	java.util.Date currTime = new java.util.Date();
    	String curTime = formatter.format(currTime);
    	%>
    	
    	<tr  >
			<td colspan="2">
				<img width="601" height="22" src="Images/grxx.jpg"/>						
			</td>
		</tr>
    <tr >
      <td width=280><div>*&nbsp;&nbsp;咨询日期
      	<input name="date" type="text" size="15" value=<%=date %> id="datepicker-example1" >
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
      <td><div>*&nbsp;&nbsp;病历号&nbsp;&nbsp;&nbsp;&nbsp;
      	<input name="num" type="text" size="15" value=<%=num%> readonly="readonly">
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
    </tr>
    <tr  >
      <td><div>*&nbsp;&nbsp;姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="name" type="text" value=<%=name%> size="10" onblur=check(this)>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>

      <td><div>*&nbsp;&nbsp;联系电话&nbsp;&nbsp;<input name="tel" type="text" value=<%=tel%> size="15" onblur=check(this)>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
    </tr>
    <tr  >
      <td><div>*&nbsp;&nbsp;年龄&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="age" type="text" size="10" value=<%=age%> onblur=check(this)>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
      <td><div>*&nbsp;&nbsp;婚否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="hun" type="radio" value="1">
	       	是
        <input type="radio" name="hun" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
       </td>
    </tr>
    <tr  >
      <td><div style="font-weight:normal">&nbsp;&nbsp;户籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select id="huji" name="huji">
        	<option value=""></option>
        	<option value="0">本地城市</option>
          	<option value="1">本地农村</option>
          	<option value="2">外地城市</option>
          	<option value="3">外地农村</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <td><div style="font-weight:normal">&nbsp;&nbsp;职业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <select id="zhiye" name="zhiye">
      		<option value=""></optiaon>
        	<option value="0">公司职员</option>
          	<option value="1">公务员</option>
          	<option value="2">教师/科研人员</option>
          	<option value="3">商业服务人员</option>
          	<option value="4">个体经营</option>
          	<option value="5">学生</option>
          	<option value="6">家政服务</option>
          	<option value="7">待业/退休</option>
          	<option value="8">工人</option>
          	<option value="9">农民</option>
          	<option value="10">其他</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
    </tr>
    <!--
    <tr >
       <td>&nbsp;</td>
       <td align="right">
       <input type="image" id="save1" src="Images/save.jpg" onClick="do_single()"/>
       <input type="image" style="display:none" id="edit1" src="Images/edit.jpg" onClick="do_single2()"/>
	   </td>
    </tr>
	-->
      </table>
 </form>
 <form action="javascript:void(0)" name="adviseform2" id="Form2" method="post" accept-charset="utf-8">
  <table class="b-content" width=600>
    <tr>
		  <td colspan="2">
           <img width="601" height="22" src="Images/jibengbingshi601x.jpg">
          </td>
		</tr>
	<tr>
		<td>*&nbsp;&nbsp;本次妊娠原因</td>
		<td><div>&nbsp;&nbsp;
			<input type="radio" name="yuanyin" value="0" onchange="yiyuanChange(this)">
       		非意愿妊娠
			<input name="yuanyin" type="radio" value="1" onchange="yiyuanChange(this)">
	       	意愿妊娠
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
	</tr>
    <tr  >
      <td width=280><div style="font-weight:normal">&nbsp;&nbsp;停经&nbsp;&nbsp;&nbsp;&nbsp;<input name="tingjing" value=<%=tingjing %> type="text" size="5">天&nbsp;
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
      <td><div>*&nbsp;&nbsp;B超显示孕
      	<select name="Bchao" id="Bchao" style="width:75px" >
      		<option value="0"></option>
        	<option value="4">4</option>
          	<option value="5">5</option>
          	<option value="6">6</option>
          	<option value="7">7</option>
          	<option value="8">8</option>
          	<option value="9">9</option>
          	<option value="10">10</option>
          	<option value="11">11</option>
          	<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
        </select>周&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
    </tr>
    <tr  >
      <td><div>*&nbsp;&nbsp;拟选择的流产方式&nbsp;&nbsp;</div>
       </td>
   
      <td><div>&nbsp;&nbsp;
        <input name="niliuchan" type="radio" value="1">
	       	门诊手术
        <input type="radio" name="niliuchan" value="2">
       		门诊药物
       	<input type="radio" name="niliuchan" value="3">
       		住院手术&nbsp;&nbsp;</div>
       </td>
    </tr>
	<tr>
      <td><div>*&nbsp;&nbsp;预约流产日期</div></td>
      <td><div>&nbsp;&nbsp;<input name="liudate" type="text" value=<%=liudate%> size="20" id="datepicker-example14">
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
    </tr>
    <tr>
      <td><div>*&nbsp;&nbsp;孕&nbsp;&nbsp;&nbsp;&nbsp;
      <select name="yuntime" id="yuntime" style="width:100px" onchange="yunChange(this)">
        	<option value="0"></option>
          	<option value="1">1</option>
          	<option value="2">2</option>
          	<option value="3">3</option>
          	<option value="4">4</option>
          	<option value="5">5</option>
          	<option value="6">6</option>
          	<option value="7">7</option>
          	<option value="8">8</option>
          	<option value="9">9</option>
          	<option value="10">10</option>
          	<option value="11">10次以上</option></select>
          	次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
      <td><div>&nbsp;&nbsp;产&nbsp;&nbsp;&nbsp;
		<select name="chantime" id="chantime" style="width:100px" onchange="chanChange(this)">
        </select>次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
    </tr>
    <tr class="dischan" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上次生产时间<input name="chanlater" value=<%=chanlater%> type="text" size="10" 
      		id="datepicker-example11" onfocus="chanToNow(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
      <td><div>&nbsp;&nbsp;距现在 &nbsp;&nbsp;&nbsp;<input name="chantonow" id="chantonow" value=<%=chantonow%> type="text" size="5">月 </div>
      </td>
    </tr>
    <tr class="dischan" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上次生产方式</div></td>
      <td>&nbsp;&nbsp;
        <input name="birth" type="radio" value="1" onchange="pouChange(this)">
	       	自然分娩
        <input type="radio" name="birth" value="2" onchange="pouChange(this)">
       		剖宫产 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr class="dispou" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剖宫产次数</div></td>
      <td><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="poutime" id="poutime" style="width:100px" >
        </select>次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
    </tr>
    <tr  class="dischan" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前是否在哺乳期</div></td>
      <td>&nbsp;&nbsp;
        <input name="buru" type="radio" value="1">
	       	是
        <input type="radio" name="buru" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr  class="drop" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否有胎盘植入/胎盘粘连史</div></td>
      <td>&nbsp;&nbsp;
        <input name="zhiru" type="radio" value="1">
	       	是
        <input type="radio" name="zhiru" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    
    <tr  class="disjiwang" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;既往人工流产次数</div></td>
      <td>&nbsp;&nbsp;<select name="liutime" id="liutime" style="width:100px" onchange="liuChange(this)">
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>   
    <tr  class="drop" style="display:none">
    	<td>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;末次流产方式</td>
      <td><div>&nbsp;&nbsp;
      	<select name="moci" id="moci" style="width:75px" >
      		<option value="0"></option>
        	<option value="1">手术</option>
          	<option value="2">药物</option>
          	<option value="3">手术+药物</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
    </tr>
    <tr   class="disliu" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;末次人工流产时间
      	<input name="liulater" type="text" size="10" id="datepicker-example111"  value=<%=liulater%> onfocus="liuToNow(this)">&nbsp;</div>
      </td>

      <td><div>&nbsp;&nbsp;距现在&nbsp;&nbsp;&nbsp;
      	&nbsp;&nbsp;<input name="liutonow" id="liutonow" value=<%=liutonow%> type="text" size="5">月</div>
      </td>
    </tr>
    <tr   class="disliu" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否过去1年内>=2次人工流产</div></td>
      <td>&nbsp;&nbsp;
        <input name="liu2" type="radio" value="1">
	       	是
        <input type="radio" name="liu2" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr   class="drop" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否曾有子宫穿孔</div></td>
      <td>&nbsp;&nbsp;
        <input name="zigong" type="radio" value="1">
	       	是
        <input type="radio" name="zigong" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr   class="drop" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否曾有宫腔粘连</div></td>
      <td>&nbsp;&nbsp;
        <input name="zhanlian" type="radio" value="1">
	       	是
        <input type="radio" name="zhanlian" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr   class="drop" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否曾有宫颈阴道裂伤</div></td>
      <td>&nbsp;&nbsp;
        <input name="lieshang" type="radio" value="1">
	       	是
        <input type="radio" name="lieshang" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr   class="disliu" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他可能导致高危手术因素</div></td>
      <td>&nbsp;&nbsp;
        <input name="qitagaowei" type="radio" value="1">
	       	是
        <input type="radio" name="qitagaowei" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
  <!-- <tr  class="disjiwang" style="display:none">
      <td><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;既往自然流产次数</div></td>
      <td>&nbsp;&nbsp;<select name="ziranliutime" id="ziranliutime" style="width:100px">
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;*
      </td>
    </tr> -->
    <tr  >
      <td><div>*&nbsp;&nbsp;现病史及既往史</div></td>
      <td>
      	<input type="checkbox" name="history" value="0">无
      	<input type="checkbox" name="history" value="1">心肝肾疾病
		<input type="checkbox" name="history" value="2">激素依赖型肿瘤<br/>
		<input type="checkbox" name="history" value="3">静脉血栓
		<input type="checkbox" name="history" value="4">药物过敏
		<input type="checkbox" name="history" value="9" onchange="historyChange(this)"> 其他
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr class="dishistory" style="display:none">
      <td><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他病史</div></td>
      <td>&nbsp;&nbsp;<input name="otherhistory" type="text" value=<%=otherhistory%> size="30">&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <!--
    <tr >
       <td>&nbsp;</td>
       <td align="right">
       <input type="image" id="save2" src="Images/save.jpg" onClick="do_normal()"/>
       <input type="image" id="edit2" style="display:none" src="Images/edit.jpg" onClick="do_normal2()"/>
       </td>
    </tr>
	-->
     </table>
 </form>
 <form action="javascript:void(0)" name="adviseform3" method="post" accept-charset="utf-8">
  <table class="b-content"  width=600>
  
	<tr  >
			<td colspan="2">
				<img width="601" height="25" src="Images/byzx.jpg"/>								
			</td>
		</tr>
    
    
	<tr  class="disyiyuan" style="display:none">
      <td width=280><div style="font-weight:normal">&nbsp;&nbsp;本次非意愿妊娠原因</div></td>
      <td>&nbsp;&nbsp;
		<select name="renshen" id="renshen" style="width:150px" >
			<option value="0"></option>
        	<option value="1">未采取避孕方法</option>
          	<option value="2">避孕失败</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
	<tr  >
      <td><div>*&nbsp;&nbsp;以往常用避孕方法</div></td>
      <td>
      	<input type="checkbox" name="biyun" value="0">避孕套&nbsp;&nbsp;&nbsp;
      	<input type="checkbox" name="biyun" value="1">紧急避孕药&nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="biyun" value="2">安全期<br/>
		<input type="checkbox" name="biyun" value="3">体外排精
		<input type="checkbox" name="biyun" value="4">COC
		<input type="checkbox" name="biyun" value="5">IUD
		<input type="checkbox" name="biyun" value="6">皮埋&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
		<input type="checkbox" name="biyun" value="7" onchange="biyunChange(this)">其他
      </td>
    </tr>
	<tr   class="disbiyun" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他避孕方式</div></td>
      <td>&nbsp;&nbsp;<input name="otherbiyun" value=<%=otherbiyun%> type="text" size="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <tr  >
      <td><div>*&nbsp;&nbsp;计划未来生育时间</div></td>
      <td>&nbsp;&nbsp;
        <select name="plan" id="plan" onchange="shengyu(this)">
        	<option value=""></option>
			<option value="0">无</option>
          	<option value="1">半年内</option>
          	<option value="2">1年内</option>
          	<option value="3">1-2年</option>
          	<option value="4">3-5年</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr  class="disyiyuan" style="display:none">
      <td><div style="font-weight:normal">&nbsp;&nbsp;性生活频率</div></td>
      <td>&nbsp;&nbsp;
        <select name="pinlv" id="pinlv">
        	<option value="0"></option>
          	<option value="1">小于1周1次</option>
          	<option value="2">1周1-3次</option>
          	<option value="3">1周3次以上</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td><div>*&nbsp;&nbsp;合并妇科情况</div></td>
      <td>
      	<input type="checkbox" name="other" value="0">无&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<input type="checkbox" name="other" value="1">月经紊乱&nbsp;&nbsp;
		<input type="checkbox" name="other" value="2">月经过多<br/>
		<input type="checkbox" name="other" value="3">痛经&nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="other" value="4">经前期综合征&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br/>
		<input type="checkbox" name="other" value="5">盆腔炎
		<input type="checkbox" name="other" value="6">宫外孕史&nbsp;&nbsp;
		<input type="checkbox" name="other" value="7">痤疮
		</td>
    </tr>
	<tr  >
      <td><div>*&nbsp;&nbsp;本次流产后拟选择避孕方式</div></td>
      <td>&nbsp;&nbsp;
		<select name="nibiyun" id="nibiyun" onchange="nibiyunChange(this)">
			<option value="0"></option>
        	<option value="1">COC</option>
          	<option value="2">IUD</option>
          	<option value="3">IUS</option>
          	<!--
          	<option value="4">避孕套</option>
          -->
          	<option value="5">皮埋</option>
          	<option value="6">绝育</option>
          	<option value="7">其他</option>
          	<option value="8">未决定</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    
    <tr   class="disnibiyun" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他流产后避孕方式</div></td>
      <td>&nbsp;&nbsp;<input name="othernibiyun" type="text" size="30" value=<%=Rs.getString("othernibiyun")%>>&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>

    <tr   class="disCOC" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议开始使用时间</div></td>
		<td>&nbsp;&nbsp;
		<select name="COCshijian" id="COCshijian" onchange="lijiChange(this)">
			<option value="0"></option>
        	<option value="1">流产当日</option>
          	<option value="2">流产后2周</option>
          	<option value="3">首次恢复月经</option>
          	<option value="4">流产后1个月</option>
          	<option value="5">流产后2-3月</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr> 
    <tr class="disIUD" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议放置时间</div></td>
		<td>&nbsp;&nbsp;
		<select name="IUDfangzhi" id="IUDfangzhi" onchange="lijiChange(this)">
			<option value="0"></option>
        	<option value="1">流产当日</option>
          	<option value="2">流产后2周</option>
          	<option value="3">首次恢复月经</option>
          	<option value="4">流产后1个月</option>
          	<option value="5">流产后2-3月</option>
        </select>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
       </td>
    </tr>
    <tr class="disliji" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未立即使用原因</div></td>
      <td>&nbsp;&nbsp;<input name="weiliji" type="text" value=<%=weiliji%> size="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <tr class="disCOC" style="display:none">
      <td><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议落实周期</div></td>
      <td>&nbsp;&nbsp;
        <input name="COCchufang" type="radio" value="1">
	       	1个月
        <input type="radio" name="COCchufang" value="2">
       		2个月
		<input type="radio" name="COCchufang" value="3">
       		3个月<br/>&nbsp;&nbsp;
       	<!--
		<input type="radio" name="COCchufang" value="4">
       		3个月以上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       	-->
       	<input type="radio" name="COCchufang" value="4">
       		4个月
       	<input type="radio" name="COCchufang" value="5">
       		5个月
       	<input type="radio" name="COCchufang" value="6">
       		6个月
       </td>
    </tr>
    
    <tr style="display:none">
      <td><div style="font-weight:normal">&nbsp;&nbsp;是否已向患者说明可能出现不良反应</div></td>
      <td>&nbsp;&nbsp;
        <input name="buliang" type="radio" value="1">
	       	是
        <input type="radio" name="buliang" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
   	<tr style="display:none" >
      <td><div style="font-weight:normal">&nbsp;&nbsp;是否已指导患者使用</div></td>
      <td>&nbsp;&nbsp;
        <input name="zhidao" type="radio" value="1">
	       	是
        <input type="radio" name="zhidao" value="0">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
	
	<tr  >
      <td><div style="font-weight:normal">&nbsp;&nbsp;其他咨询内容</div></td>
      <td>&nbsp;&nbsp;<input name="otherzixun" value=<%=otherzixun%>  type="text" size="30">&nbsp;&nbsp;
      </td>
    </tr>
    <%
        String shuming = dao.getShuming(request.getParameter("shuming"));
    	%>
	<tr >
      <td><div>*&nbsp;&nbsp;咨询员署名</div></td>
      <td>&nbsp;&nbsp;<input name="person" type="text" size="15" value=<%=shuming %> >&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <tr  id="r_table">
    		<td height="34" colspan="2">
    		<div align="center" >
				<font size="3px" face="微软雅黑" color="red">以下内容由医生在实际落实后填写</font>	<br/>
			</div>	
			</td>
    	</tr>
    	
    	<tr>
      <td><div>*&nbsp;&nbsp;医生署名</div></td>
      <td>&nbsp;&nbsp;
		<select  id="yisheng" name="yisheng"  style="width:100px" onfocus="doctorChange()" onChange="doctor_display()">
        </select>
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
	<tr  >
      <td><div>*&nbsp;&nbsp;本次流产后实际落实避孕方式</div></td>
      <td>&nbsp;&nbsp;
		<select name="shijibiyun" id="shijibiyun" onchange="shijibiyunChange(this)" disabled="disabled">
			<option value="0"></option>
        	<option value="1">COC</option>
          	<option value="2">IUD</option>
          	<option value="3">IUS</option>
          	<option value="5">皮埋</option>
          	<option value="6">绝育</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
    <tr class="disshijiCOC" style="display:none">
      <td><div>*&nbsp;&nbsp;所选COC种类</div></td>
		<td>&nbsp;&nbsp;
		<select name="COCzhonglei" id="COCzhonglei">
			<option value="0"></option>
        	<option value="1">屈螺酮炔雌醇片</option>
          	<option value="2">去氧孕烯炔雌醇片</option>
          	<option value="3">炔雌醇环丙孕酮片</option>
          	<option value="4">复方左炔诺孕酮片</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	
       </td>
    </tr> 
    <tr   class="disshijiCOC">
      <td><div>*&nbsp;&nbsp;实际开始使用时间</div></td>
		<td>&nbsp;&nbsp;<!--COCshijishijian-->
		<input name="COCshijishijian" type="text" value=<%=COCshijishijian%> size="15" id="datepicker-example15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr> 
    <tr class="disshijiIUD" style="display:none">
      <td><div>*&nbsp;&nbsp;实际放置时间</div></td>
		<td>&nbsp;&nbsp;
		<input name="IUDshijifangzhi" type="text" value=<%=IUDshijifangzhi%> size="15" id="datepicker-example16">	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
       </td>
    </tr>
    <tr class="disshijiCOC" style="display:none">
      <td><div>*&nbsp;&nbsp;建议使用周期</div></td>
      <td>&nbsp;&nbsp;
        <input name="COCjianyichufang" type="radio" value="1">
	       	1个月
        <input type="radio" name="COCjianyichufang" value="2">
       		2个月
		<input type="radio" name="COCjianyichufang" value="3">
       		3个月<br/>&nbsp;&nbsp;
       		<!--
		<input type="radio" name="COCjianyichufang" value="4">
       		3个月以上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       	-->
       	<input type="radio" name="COCchufang" value="4">
       		4个月
       	<input type="radio" name="COCchufang" value="5">
       		5个月
       	<input type="radio" name="COCchufang" value="6">
       		6个月
       </td>
    </tr>
    
    
	 <tr>
       <td>&nbsp;</td>
       <td align="right">
       <input type="image" id="save3" src="Images/save.jpg" onClick="do_advise()"/>
       </td>
    </tr>
  </table>
 </form>
</CENTER>
 <script type="text/javascript" src="public/javascript/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="public/javascript/zebra_datepicker.src.js"></script>
        <script type="text/javascript" src="public/javascript/core.js"></script>
        
        
        
</body>
</html>