<%@ page contentType="text/html;charset=utf-8" autoFlush="false" buffer="3000kb" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="public/css/reset.css" type="text/css">
        <link rel="stylesheet" href="public/css/default.css" type="text/css">
        <link rel="stylesheet" href="public/css/style.css" type="text/css">

        <link type="text/css" rel="stylesheet" href="libraries/syntaxhighlighter/public/css/shCoreDefault.css">

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

.style1 {
	color: #6633CC;
	font-weight: bold;
	font-size: 13px;
}

.style3 {
	font-size: 12
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
font-family:"微软雅黑";
	font-size: 16px;
	font-weight: bold;
vertical-align: middle;
padding-top: 10px;
padding-bottom: 3px;
border-bottom: 1px solid #c9d7f1;
}

#r_table div {
font-family:"微软雅黑";
	font-size: 16px;
	font-weight: bold;
display: block;
font-weight: bold;
padding-bottom: 3px;
}
.r_cell_1 {
font-family:"微软雅黑";
	font-size: 16px;
	font-weight: bold;
width: 250px;
padding-left: 15px;
}

.b-content {
font-family:"微软雅黑";
	font-size: 16px;
	font-weight: bold;
border: 1px solid #d9e7ff;
background: #FFF;
padding: 15px;
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
font-family:"微软雅黑";
	font-size: 16px;
border: 1px solid #7F9DB9;
background: -moz-linear-gradient(top,#eee,#fff 8px);
background: -webkit-gradient(linear,0% 0%,0% 30%,from(#eee),to(#fff));
}

#r_table input, select, radio {
font-family:"微软雅黑";
	font-size: 16px;
font-size: 18px;
margin-right: 10px;
}

</style>
	<title>患者问诊信息录入</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<% String method=request.getParameter("method");%>
</head>
<script language=javascript>
function do_first(){
	
	var adviseform = document.adviseform;
	var name = adviseform.name.value;
	var date = adviseform.date.value;
	var num = adviseform.num.value;
	var tel = adviseform.tel.value;
	var fangshi = adviseform.fangshi.value;
	var Bchao = adviseform.Bchao.value;
	var canliu = adviseform.canliu.value;
	var neimo = adviseform.neimo.value;
	var chuxuetianshu = adviseform.chuxuetianshu.value;
	var youwubingfa = adviseform.youwubingfa.value;
	var bingfa = adviseform.bingfa.value;
	var qitabingfa = adviseform.qitabingfa.value;	
	var chuxue = adviseform.chuxue.value;
	var youwubushi = adviseform.youwubushi.value;
	var bushi = adviseform.bushi.value;
	var qitabushi = adviseform.qitabushi.value;
	var yuejinghuifu = adviseform.yuejinghuifu.value;
	var huifushijian = adviseform.huifushijian.value;
	var yuejingxueliang = adviseform.yuejingxueliang.value;
	var xinghuifu = adviseform.xinghuifu.value;
	var liuchanbiyun = adviseform.liuchanbiyun.value;
	var COCshijian = "";
	if(adviseform.COCshijian!=undefined){
		COCshijian= adviseform.COCshijian.value;
	}
	var COCchufang = "";
	if(adviseform.COCchufang!=undefined){
		COCchufang= adviseform.COCchufang.value;
	}
	var COCzhonglei = "";
	if(adviseform.COCzhonglei!=undefined){
		COCzhonglei= adviseform.COCzhonglei.value;
	}
	var COCjianchi = "";
	if(adviseform.COCjianchi!=undefined){
		COCjianchi= adviseform.COCjianchi.value;
	}
	var COCyuanyin = "";
	if(adviseform.COCyuanyin!=undefined){
		COCyuanyin= adviseform.COCyuanyin.value;
	}
	var qitaCOCyuanyin = "";
	if(adviseform.qitaCOCyuanyin!=undefined){
		qitaCOCyuanyin= adviseform.qitaCOCyuanyin.value;
	}
	var COCjixuchufang = "";
	if(adviseform.COCjixuchufang!=undefined){
		COCjixuchufang= adviseform.COCjixuchufang.value;
	}
	var COCchufangshu = "";
	if(adviseform.COCchufangshu!=undefined){
		COCchufangshu= adviseform.COCchufangshu.value;
	}
	var IUDfangzhi = "";
	if(adviseform.IUDfangzhi!=undefined){
		IUDfangzhi= adviseform.IUDfangzhi.value;
	}
	var IUDjianchi = "";
	if(adviseform.IUDjianchi!=undefined){
		IUDjianchi= adviseform.IUDjianchi.value;
	}
	var IUDfangzhi2 ="";
	if(adviseform.IUDfangzhi2!=undefined){
		IUDfangzhi2= adviseform.IUDfangzhi2.value;
	}
	var riqi ="";
	if(adviseform.riqi!=undefined){
		riqi= adviseform.riqi.value;
	}
	var IUDyuanyin ="";
	if(adviseform.IUDyuanyin!=undefined){
		IUDyuanyin= adviseform.IUDyuanyin.value;
	}
	var qitaIUDyuanyin ="";
	if(adviseform.qitaIUDyuanyin!=undefined){
		qitaIUDyuanyin= adviseform.qitaIUDyuanyin.value;
	}
	var qitaIUDyuanyin = adviseform.qitaIUDyuanyin.value;
	var huanyongbiyun = adviseform.huanyongbiyun.value;
	var huanyongCOC = adviseform.huanyongCOC.value;
	var huanyongIUD = adviseform.huanyongIUD.value;
	var huanyongCOCchufang = adviseform.huanyongCOCchufang.value;
	var yuanyigaoxiao = adviseform.yuanyigaoxiao.value;
	var gaoxiaobiyun = adviseform.gaoxiaobiyun.value;
	var gaoxiaoshijian = adviseform.gaoxiaoshijian.value;
	var gaoxiaochufang = adviseform.gaoxiaochufang.value;
	var gaoxiaofangzhi = adviseform.gaoxiaofangzhi.value;
	var feigaoxiao = adviseform.feigaoxiao.value;
	var qitafeigaoxiao = adviseform.qitafeigaoxiao.value;
	var other ="";
	if(adviseform.other!=undefined){
		other= adviseform.other.value;
	}
	var person = "<%=request.getParameter("shuming")%>";
	var method = "<%=method%>";

	//window.alert(username_hash);
	if(adviseform.name.value!="" && adviseform.num.value!=""){
		//window.alert(loginForm.user_name.value + "  " + loginForm.password.value);
		
		url="do_first.jsp?name="+name+"&date="+date+"&tle="+tel+"&fangshi="+fangshi+"&chuxuetianshu="+chuxuetianshu+"&num="+num
				+"&youwubingfa="+youwubingfa+"&bingfa="+bingfa+"&qitabingfa="+qitabingfa+"&chuxue="+chuxue+"&youwubushi="+youwubushi
				+"&bushi="+bushi+"&qitabushi="+qitabushi+"&yuejinghuifu="+yuejinghuifu+"&huifushijian="+huifushijian
				+"&yuejingxueliang="+yuejingxueliang+"&xinghuifu="+xinghuifu+"&liuchanbiyun="+liuchanbiyun+"&COCshijian="+COCshijian
				+"&COCchufang="+COCchufang+"&COCzhonglei="+COCzhonglei+"&COCjianchi="+COCjianchi+"&COCyuanyin="+COCyuanyin
				+"&qitaCOCyuanyin="+qitaCOCyuanyin+"&COCjixuchufang="+COCjixuchufang+"&COCchufangshu="+COCchufangshu
				+"&IUDfangzhi="+IUDfangzhi+"&IUDjianchi="+IUDjianchi+"&IUDfangzhi2="+IUDfangzhi2+"&riqi="+riqi+"&IUDyuanyin="+IUDyuanyin+"&qitaIUDyuanyin="+qitaIUDyuanyin
				+"&huanyongbiyun="+huanyongbiyun+"&huanyongCOC="+huanyongCOC+"&huanyongIUD="+huanyongIUD+"&huanyongCOCchufang="+huanyongCOCchufang
				+"&yuanyigaoxiao="+yuanyigaoxiao+"&gaoxiaobiyun="+gaoxiaobiyun+"&gaoxiaoshijian="+gaoxiaoshijian
				+"&gaoxiaochufang="+gaoxiaochufang+"&gaoxiaofangzhi="+gaoxiaofangzhi+"&feigaoxiao="+feigaoxiao
				+"&qitafeigaoxiao="+qitafeigaoxiao+"&other="+other+"&person="+person+"&Bchao="+Bchao+"&canliu="+canliu+"&neimo="+neimo+"&method="+method;
		window.location.href = url;

	}else{
		sAlert("用户名或者病历号不能为空");
	}	
	
}

function bingfaChange(bingfa)
{
 if(bingfa.value=="1")
 {	
	 var list = document.getElementsByClassName("disbingfa");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disbingfa");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function NewBchaoChange(cc)
{
	if(cc.value=="1" || cc.value=="0")
	{
		var list = document.getElementsByClassName("Bchao");
		for(var i=0, l = list.length; i < l; i++){
			var objTemp = list[i];
			objTemp.style.display = "table-row";
		}
	}
	else
	{
		var list = document.getElementsByClassName("Bchao");
		for(var i = 0, l = list.length; i < l; i++){
			var objTemp = list[i];
			objTemp.style.display = "none";
		}
	}
}

function qitabingfaChange(qitabingfa)
{
 if(qitabingfa.value=="7")
 {	
	 var list = document.getElementsByClassName("disqitabingfa");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disqitabingfa");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function huifuChange(huifu)
{
 if(huifu.value=="1")
 {	
	 var list = document.getElementsByClassName("dishuifu");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("dishuifu");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}



function BchaoChange(Bchao)
{
 if(Bchao.value=="1")
 {	
	 var list = document.getElementsByClassName("Bchao");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("Bchao");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function biyunChange(biyun)
{
 if(biyun.value=="COC")
 {	
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
	 var list3 = document.getElementsByClassName("disother");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "none";
	 }
 } 
 else if(biyun.value=="IUD"||biyun.value=="IUS"||biyun.value=="皮埋")
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
	 var list3 = document.getElementsByClassName("disother");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "none";
	 }
 }
 else if(biyun.value!="绝育")
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
	 var list3 = document.getElementsByClassName("disother");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "table-row";
	 }
 }
}

function COCjianchiChange(COCjianchi)
{
 if(COCjianchi.value=="1")
 {	
	 var list = document.getElementsByClassName("disCOCjianchi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
	 var list2 = document.getElementsByClassName("disCOCweijianchi");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "none";
	 }
	 var list3 = document.getElementsByClassName("disweijianchi");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "none";
	 }
	 var list4 = document.getElementsByClassName("dishuanyongCOC");
	 for(var i = 0, l = list4.length; i < l; i++) {
	     var objTemp = list4[i];
	     objTemp.style.display = "none";
	 }
	 var list5 = document.getElementsByClassName("dishuanyongIUD");
	 for(var i = 0, l = list5.length; i < l; i++) {
	     var objTemp = list5[i];
	     objTemp.style.display = "none";
	 }
	 var list6 = document.getElementsByClassName("disCOCjixu");
	 for(var i = 0, l = list6.length;i < l; i++){
	 	var objTemp = list6[i];
	 	objTemp.style.display = "table-row";
	 }

 } 
 else
 {
	var list = document.getElementsByClassName("disCOCjianchi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
	 var list2 = document.getElementsByClassName("disCOCweijianchi");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "table-row";
	 }
	 var list7 = document.getElementsByClassName("disweijianchi");
	 for(var i = 0, l = list7.length; i < l; i++) {
	     var objTemp = list7[i];
	     objTemp.style.display = "table-row";
	 }
	 var list3 = document.getElementsByClassName("disCOCmanyi");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "none";
	 }
	 var list4 = document.getElementsByClassName("disCOCqitamanyi");
	 for(var i = 0, l = list4.length; i < l; i++) {
	     var objTemp = list4[i];
	     objTemp.style.display = "none";
	 }
	 var list5 = document.getElementsByClassName("disCOCjixushiyong");
	 for(var i = 0, l = list5.length; i < l; i++) {
	     var objTemp = list5[i];
	     objTemp.style.display = "none";
	 }
	 var list6 = document.getElementsByClassName("disCOCjixu");
	 for(var i = 0, l = list6.length; i < l; i++) {
	     var objTemp = list6[i];
	     objTemp.style.display = "none";
	 }
	 var list8 = document.getElementsByClassName("dishuanyongCOC");
	 for(var i = 0, l = list8.length; i < l; i++) {
	     var objTemp = list8[i];
	     objTemp.style.display = "none";
	 }
	 var list9 = document.getElementsByClassName("dishuanyongIUD");
	 for(var i = 0, l = list9.length; i < l; i++) {
	     var objTemp = list9[i];
	     objTemp.style.display = "none";
	 }
	 sAlert("提示：此患者可能有近期再次妊娠风险，请重点咨询！");
 }
}

function COCbumanyiChange(COCbumanyi)
{
 if(COCbumanyi.value=="0")
 {	
	 var list = document.getElementsByClassName("disCOCbumanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disCOCbumanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function COCqitabumanyiChange(COCqitabumanyi)
{
 if(COCqitabumanyi.value=="6")
 {	
	 var list = document.getElementsByClassName("disCOCqitabumanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disCOCqitabumanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function COCjixuChange(COCjixu)
{
 if(COCjixu.value=="1")
 {	
	 var list = document.getElementsByClassName("disCOCjixu");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disCOCjixu");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function COCjixushiyongChange(COCjixu)
{
 if(COCjixu.value=="1")
 {	
	 var list = document.getElementsByClassName("disCOCjixushiyong");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disCOCjixushiyong");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function COCmanyiChange(COCjixu)
{
 if(COCjixu.value=="0")
 {	
	 var list = document.getElementsByClassName("disCOCmanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disCOCmanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function IUDriqiChange(IUDriqi)
{
 if(IUDriqi.value=="1")
 {	
	 var list = document.getElementsByClassName("disIUDfangzhi2");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
	 var list = document.getElementsByClassName("disIUDfangzhi3");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disIUDfangzhi2");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
	 var list = document.getElementsByClassName("disIUDfangzhi3");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 }
}

function IUDjianchiChange(jianchi)
{
 if(jianchi.value=="1")
 {	
	 var list = document.getElementsByClassName("disIUDjianchi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
	 var list2 = document.getElementsByClassName("disIUDweijianchi");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "none";
	 }
	 var list3 = document.getElementsByClassName("disweijianchi");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "none";
	 }
	 var list4 = document.getElementsByClassName("dishuanyongCOC");
	 for(var i = 0, l = list4.length; i < l; i++) {
	     var objTemp = list4[i];
	     objTemp.style.display = "none";
	 }
	 var list5 = document.getElementsByClassName("dishuanyongIUD");
	 for(var i = 0, l = list5.length; i < l; i++) {
	     var objTemp = list5[i];
	     objTemp.style.display = "none";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disIUDjianchi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
	 var list2 = document.getElementsByClassName("disIUDweijianchi");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "table-row";
	 }
	 var list3 = document.getElementsByClassName("disweijianchi");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "table-row";
	 }
	 var list4 = document.getElementsByClassName("dishuanyongCOC");
	 for(var i = 0, l = list4.length; i < l; i++) {
	     var objTemp = list4[i];
	     objTemp.style.display = "none";
	 }
	 var list5 = document.getElementsByClassName("dishuanyongIUD");
	 for(var i = 0, l = list5.length; i < l; i++) {
	     var objTemp = list5[i];
	     objTemp.style.display = "none";
	 }
	 sAlert("提示：此患者可能有近期再次妊娠风险，请重点咨询！");
 }
}

function IUDbumanyiChange(bumanyi)
{
 if(bumanyi.value=="0")
 {	
	 var list = document.getElementsByClassName("disIUDbumanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disIUDbumanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function IUDqitabumanyiChange(qitabumanyi)
{
 if(qitabumanyi.value=="6")
 {	
	 var list = document.getElementsByClassName("disIUDqitabumanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disIUDqitabumanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function IUDweijianchiChange(weijianchi)
{
 if(weijianchi.value=="5")
 {	
	 var list = document.getElementsByClassName("disIUDqitaweijianchi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disIUDqitaweijianchi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function gaoxiaoChange(gaoxiao)
{
 if(gaoxiao.value=="1")
 {	
	 var list = document.getElementsByClassName("disgaoxiao");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
	 var list2 = document.getElementsByClassName("disfeigaoxiao");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "none";
	 }
	 var list3 = document.getElementsByClassName("disgaoxiaoCOC");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "none";
	 }
	 var list4 = document.getElementsByClassName("disgaoxiaoIUD");
	 for(var i = 0, l = list4.length; i < l; i++) {
	     var objTemp = list4[i];
	     objTemp.style.display = "none";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disgaoxiao");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
	 var list2 = document.getElementsByClassName("disfeigaoxiao");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "table-row";
	 }
	 var list3 = document.getElementsByClassName("disgaoxiaoCOC");
	 for(var i = 0, l = list3.length; i < l; i++) {
	     var objTemp = list3[i];
	     objTemp.style.display = "none";
	 }
	 var list4 = document.getElementsByClassName("disgaoxiaoIUD");
	 for(var i = 0, l = list4.length; i < l; i++) {
	     var objTemp = list4[i];
	     objTemp.style.display = "none";
	 }
	 
	 sAlert("此患者应落实高效避孕措施！");
 }
}

function qitafeigaoxiaoChange(qitafeigaoxiao)
{
 if(qitafeigaoxiao.value=="5")
 {	
	 var list = document.getElementsByClassName("disqitafeigaoxiao");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disqitafeigaoxiao");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function gaoxiaobiyunChange(gaoxiaobiyun)
{
 if(gaoxiaobiyun.value=="1")
 {	
	 var list = document.getElementsByClassName("disgaoxiaoCOC");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
	 var list2 = document.getElementsByClassName("disgaoxiaoIUD");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "none";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disgaoxiaoCOC");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
	 var list2 = document.getElementsByClassName("disgaoxiaoIUD");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "table-row";
	 }
 }
}

function bushiChange(bushi)
{
 if(bushi.value=="1")
 {	
	 var list = document.getElementsByClassName("disbushi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disbushi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
	 var list = document.getElementsByClassName("disqitabushi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function qitabushiChange(qitabushi)
{
 if(qitabushi.value=="3")
 {	
	 var list = document.getElementsByClassName("disqitabushi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disqitabushi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function COCqitaweijianchiChange(qitaweijianchi)
{
 if(qitaweijianchi.value=="9")
 {	
	 var list = document.getElementsByClassName("disCOCqitaweijianchi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disCOCqitaweijianchi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}

function COCqitamanyiChange(qitaweijianchi)
{
 if(qitaweijianchi.value=="9")
 {	
	 var list = document.getElementsByClassName("disCOCqitamanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
 } 
 else
 {
	var list = document.getElementsByClassName("disCOCqitamanyi");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}


function huanyongChange(nibiyun)
{
	if(nibiyun.value=="1"){
		var list = document.getElementsByClassName("dishuanyongCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "table-row";
		}
	 	var list2 = document.getElementsByClassName("dishuanyongIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "none";
		}
	}
	else if(nibiyun.value=="2"||nibiyun.value=="3"||nibiyun.value=="5")
 	{	
		var list = document.getElementsByClassName("dishuanyongCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "none";
		}
	 	var list2 = document.getElementsByClassName("dishuanyongIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "table-row";
		}
 	} 
 	else
 	{
 		var list = document.getElementsByClassName("dishuanyongCOC");
	 	for(var i = 0, l = list.length; i < l; i++) {
	     	var objTemp = list[i];
	     	objTemp.style.display = "none";
		}
	 	var list2 = document.getElementsByClassName("dishuanyongIUD");
	 	for(var i = 0, l = list2.length; i < l; i++) {
	     	var objTemp = list2[i];
	     	objTemp.style.display = "none";
		}
 	}
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
	eSrc.focus();
	document.body.onselectstart = function(){return true;}
	document.body.oncontextmenu = function(){return true;}
	}
	document.getElementById("do_OK").focus();
	eSrc.blur();
	document.body.onselectstart = function(){return false;}
	document.body.oncontextmenu = function(){return false;}
	}
	
function do_back(method){
	var url = "";
	if(method=="patient")
		url = "patient_page.jsp?shuming=<%=request.getParameter("shuming")%>";
	else if(method=="suifang")
		url = "daisuifang_n.jsp?shuming=<%=request.getParameter("shuming")%>";
	window.location.href = url;
}
</script>
		<%
    	String num,name,tel,nibiyun,biyun,COCshijian,COCchufang,IUDfangzhi,COCzhonglei,zhonglei,gaowei,liudate;
    	request.setCharacterEncoding("utf-8");
    	String shijian=" ";
    	ResultSet Rs2;
    	ResultSet Rs;
    	String result="";
    	if(request.getParameter("num")==null){
    		num=" ";name=" ";tel=" ";nibiyun=" ";biyun=" ";gaowei=" ";zhonglei=" ";
    		COCshijian=" ";COCchufang=" ";IUDfangzhi=" ";COCzhonglei=" ";liudate=" ";}
    	else{
    		num=request.getParameter("num");
    		String SQL = "select * from patient_info where num='"+num+"'";
    		Rs = dao.executeQuery(SQL);
    		Rs.next();
    		name = Rs.getString("name");
    		tel = Rs.getString("tel");
    		biyun = Rs.getString("nibiyun");
    		COCshijian = Rs.getString("COCshijian");
    		COCchufang = Rs.getString("COCchufang");
    		IUDfangzhi = Rs.getString("IUDfangzhi");
    		COCzhonglei = Rs.getString("COCzhonglei");
    		gaowei = Rs.getString("gaowei");
    		liudate = Rs.getString("liudate");
    		zhonglei=" ";
    		int biyun_i = Integer.valueOf(biyun).intValue();
    		nibiyun = new String();
    		switch(biyun_i){
    			case 1:nibiyun="COC";break;
    			case 2:nibiyun="IUD";break;
    			case 3:nibiyun="IUS";break;
    			case 4:nibiyun="避孕套";break;
    			case 5:nibiyun="皮埋";break;
    			case 6:nibiyun="绝育";break;
    			case 7:nibiyun="其他";break;
    			case 8:nibiyun="未决定";break;
    		}
    	
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
    		if(Rs.getString("liutime").compareTo("2")>0){
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
    	
    	}
    	%>
    			
<body>
<form action="javascript:void(0)" name="adviseform" id="Form1" method="post" accept-charset="utf-8">
  	<table class="b-content">
        <tr  id="r_table">
			<td colspan="2" >
				<img width="724" height="45" src="Images/yigeyue.jpg"/>								
			</td>
		</tr>
		<%if(!gaowei.equals("0")) {%>
		<script type="text/javascript">
    			var resultgaowei = "<%=result%>";
    			sAlert(resultgaowei);
    			
    			</script>
    			<%} %>
    	<tr  id="r_table">
    		<td height="34" colspan="2">
    		<div align="center" >
				<font size="3px" face="微软雅黑" color="red">保护隐私是我们的责任，病人所有资料保密，任何人不得外泄或窃取！</font>	<br/>
				<font size="3px" face="微软雅黑" color="black">目的：了解流产后身体及月经恢复情况，评估避孕方式使用情况，解答<br/>疑问，必要时补充避孕药具，并告知后续获取服务的途径。	</font>						
			</div>	
			</td>
    	</tr>
    	<tr>
    		<td  colspan="2" align="right">
    			<input type="button" value=""  style=" width:60px; height:30px; border:0; background:url(Images/back.jpg) no-repeat " onClick = "do_back('<%=method%>')"/>
			</td>
    	</tr>
    	<%
    	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    	java.util.Date currTime = new java.util.Date();
    	String curTime = formatter.format(currTime);
    	%>
    	<tr  id="r_table">
      		<td class="r_cell_1"><div>*&nbsp;&nbsp;随访日期</div></td>
      		<td class="r_cell_1">
      			<input name="date" type="text" size="30" value=<%=curTime %> id="datepicker-example1">
      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		</td>
    	</tr>
    	<tr  id="r_table">
      		<td class="r_cell_1"><div>*&nbsp;&nbsp;手术日期</div></td>
      		<td class="r_cell_1">
      			<input name="liudate" type="text" size="30" value=<%=liudate %> id="liudate-example">
      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		</td>
    	</tr>
    	<tr  id="r_table">
      		<td class="r_cell_1"><div>*&nbsp;&nbsp;姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<input name="name" type="text" size="10" value=<%=name%>>&nbsp;&nbsp;
      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
      		<td class="r_cell_1"><div>*&nbsp;&nbsp;病历号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		<input name="num" type="text" size="10" value=<%=num%>>&nbsp;&nbsp;&nbsp;&nbsp;
      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
    	</tr>
    	<tr  id="r_table">
      		<td class="r_cell_1"><div>*&nbsp;&nbsp;联系方式</div></td>
      		<td class="r_cell_1"><input name="tel" type="text" size="20" value=<%=tel%>>&nbsp;&nbsp;
      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		&nbsp;&nbsp;</td>
    	</tr>
    	<tr  id="r_table">
      		<td class="r_cell_1"><div>*&nbsp;&nbsp;随访方式</div></td>
      		<td class="r_cell_1">
        		<input name="fangshi" type="radio" value="1">
	       			复诊
        		<input type="radio" name="fangshi" value="2">
       				电话
       			<input type="radio" name="fangshi" value="0">
       				未联系上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		</td>
    	</tr>
    	<!--
    	<tr  id="r_table"   >
      		<td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;&nbsp;B超复查有无残留</div></td>
      		<td class="r_cell_1">
        		<input name="canliu" type="radio" value="1" onchange="NewBchaoChange(this)">
	       			有
       			<input type="radio" name="canliu" value="0" onchange="NewBchaoChange(this)">
       				无
       			<input type="radio" name="canliu" value="2" onchange="NewBchaoChange(this)">
       				未检&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;
       		</td>
    	</tr>   	
    	<tr  id="r_table" class="Bchao" style="display:none">
      <td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;子宫内膜厚度</div></td>
      <td class="r_cell_1">
        <select name="neimo" >
        	<option value="16"></option>
	        <option value="0">未检</option>
          	<option value="1">1mm</option>
          	<option value="2">2mm</option>
          	<option value="3">3mm</option>
          	<option value="4">4mm</option>
          	<option value="5">5mm</option>
          	<option value="6">6mm</option>
          	<option value="7">7mm</option>
          	<option value="8">8mm</option>
          	<option value="9">9mm</option>
          	<option value="10">10mm</option>
          	<option value="11">11mm</option>
          	<option value="12">12mm</option>
          	<option value="13">13mm</option>
          	<option value="14">14mm</option>
          	<option value="15">15mm</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
-->

    	<tr  id="r_table">
      		<td class="r_cell_1"><div>*&nbsp;&nbsp;流产后出血天数&nbsp;&nbsp;&nbsp;</div></td>
      		<td class="r_cell_1" >
      			<input name="chuxuetianshu" type="text" size="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      		
    	</tr>
    	
    <tr  id="r_table" class="disbingfa" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;并发症种类</div></td>
      <td class="r_cell_1">
        <select name="bingfa" onchange="qitabingfaChange(this)">
          	<option value="1">子宫穿孔</option>
          	<option value="2">生殖道损伤</option>
          	<option value="3">人流不全</option>
          	<option value="4">大出血</option>
          	<option value="5">感染</option>
          	<option value="6">宫腔粘连</option>
          	<option value="7">其他</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disqitabingfa" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;其他并发症种类</div></td>
      <td class="r_cell_1"><input name="qitabingfa" type="text" size="30"></td>
    </tr>
    <tr  id="r_table" style="display:none">
      <td class="r_cell_1"><div>目前出血量</div></td>
      <td class="r_cell_1">
        <select name="chuxue">
          	<option value="1">少于月经</option>
          	<option value="2">与月经相似</option>
          	<option value="3">多于月经</option>
        </select></td>
    </tr>
    <tr  id="r_table" style="display:none">
      		<td class="r_cell_1"><div>有无不适主诉</div></td>
			<td class="r_cell_1">
        		<input name="youwubushi" type="radio" value="1" >
	       			有
       	 		<input type="radio" name="youwubushi" value="0" >
       				无&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*
       		</td>
    </tr>
    <!--
    <tr  id="r_table" class="disbushi" >
      <td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;不适主诉</div></td>
      <td class="r_cell_1">
        <select name="bushi" onchange="qitabushiChange(this)">
        		<option value="0"></option>
          	<option value="1">发热</option>
          	<option value="2">腹痛</option>
          	<option value="3">其他</option>
          	<option value="4">无</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
	
    <tr  id="r_table" class="disqitabushi" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;具体描述</div></td>
      <td class="r_cell_1"><input name="qitabushi" type="text" size="30">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
-->
    <tr  id="r_table">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;月经是否恢复</div></td>
      <td class="r_cell_1">
        <input name="yuejinghuifu" type="radio" value="1" onchange="huifuChange(this)">
	       	是
        <input type="radio" name="yuejinghuifu" value="0" onchange="huifuChange(this)">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr  id="r_table" class="dishuifu" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;月经恢复时间</div></td>
      <td class="r_cell_1">
        <select name="huifushijian">
        	<option value="0"></option>
          	<option value="2">流产后2周</option>
          	<option value="3">流产后3周</option>
          	<option value="4">流产后4周</option>
          	<option value="5">流产后5周</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr  id="r_table" class="dishuifu" style="display:none">
      <td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;&nbsp;月经血量与术前相比</div></td>
      <td class="r_cell_1">
        <input name="yuejingxueliang" type="radio" value="1">
	       	 少于
        <input type="radio" name="yuejingxueliang" value="2">
       		相似
       	<input type="radio" name="yuejingxueliang" value="3">
       		多于
       	<input type="radio" name="yuejingxueliang" value="4">
       		说不清&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;是否恢复性生活</div></td>
      <td class="r_cell_1">
        <select name="xinghuifu">
        	<option value="0"></option>
        	<option value="0">未恢复</option>
          	<option value="1">流产后1周恢复</option>
          	<option value="2">流产后2周恢复</option>
          	<option value="3">流产后3周恢复</option>
          	<option value="4">流产后4周恢复</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;</td>
    </tr>   



    <!-- 将是否B超复查隐藏掉直接显示有无残留和内膜厚度 -->
	<tr  id="r_table" style="display:none">
  		<td class="r_cell_1"><div>&nbsp;&nbsp;B超复查有无残留</div></td>
  		<td class="r_cell_1">
    		<input name="Bchao" type="radio" value="1" >
       			有
   			<input type="radio" name="Bchao" value="0" >
   				无&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   				&nbsp;&nbsp;
   		</td>
	</tr>


    	<tr  id="r_table" style="display:none">
    		<td class="r_cell_1" ><div style="font-weight:normal">&nbsp;&nbsp;&nbsp;有无流产并发症&nbsp;&nbsp;&nbsp;&nbsp;
    			</div></td>
    			<td class="r_cell_1">
        		<input name="youwubingfa" type="radio" value="1" onchange="bingfaChange(this)">
	       			有
       	 		<input type="radio" name="youwubingfa" value="0" onchange="bingfaChange(this)">
       				无&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       			</td>
       		
       	</tr>
       	<tr  id="r_table"   >
      		<td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;&nbsp;B超复查有无残留</div></td>
      		<td class="r_cell_1">
        		<input name="canliu" type="radio" value="1" onchange="NewBchaoChange(this)">
	       			有
       			<input type="radio" name="canliu" value="0" onchange="NewBchaoChange(this)">
       				无
       			<input type="radio" name="canliu" value="2" onchange="NewBchaoChange(this)">
       				未检&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       				&nbsp;&nbsp;&nbsp;
       		</td>
    	</tr>   	
    	<tr  id="r_table" class="Bchao" style="display:none">
      <td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;子宫内膜厚度</div></td>
      <td class="r_cell_1">
        <select name="neimo" >
        	<option value="16"></option>
	        <option value="0">未检</option>
          	<option value="1">1mm</option>
          	<option value="2">2mm</option>
          	<option value="3">3mm</option>
          	<option value="4">4mm</option>
          	<option value="5">5mm</option>
          	<option value="6">6mm</option>
          	<option value="7">7mm</option>
          	<option value="8">8mm</option>
          	<option value="9">9mm</option>
          	<option value="10">10mm</option>
          	<option value="11">11mm</option>
          	<option value="12">12mm</option>
          	<option value="13">13mm</option>
          	<option value="14">14mm</option>
          	<option value="15">15mm</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr  id="r_table" class="disbushi" >
      <td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;&nbsp;不适主诉</div></td>
      <td class="r_cell_1">
        <select name="bushi" onchange="qitabushiChange(this)">
        		<option value="0"></option>
          	<option value="1">发热</option>
          	<option value="2">腹痛</option>
          	<option value="3">其他</option>
          	<option value="4">无</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
     <tr  id="r_table" class="disqitabushi" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;具体描述</div></td>
      <td class="r_cell_1"><input name="qitabushi" type="text" size="30">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    
    <tr  id="r_table">
      	<td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;&nbsp;上次选择避孕方式</div></td>
      	<td class="r_cell_1"><input id="liuchanbiyun" name="liuchanbiyun" type="text" size="10" readonly="true" value=<%=nibiyun%> onmousemove="biyunChange(this)"></td>
    </tr>
    	<% if(nibiyun.equals("COC")){ 
			if(COCshijian.equals("1"))
				shijian="流产当日";
			else if(COCshijian.equals("2"))
				shijian="流产后2周";
			else if(COCshijian.equals("3"))
				shijian="首次恢复月经";
			else if(COCshijian.equals("4"))
				shijian="流产后1个月";
			else{
				shijian="流产后2-3月";
			 }
			if(COCzhonglei.equals("1"))
				zhonglei="屈螺酮炔雌醇片";
			else if(COCzhonglei.equals("2"))
				zhonglei="去氧孕烯炔雌醇片";
			else if(COCzhonglei.equals("3"))
				zhonglei="炔雌醇环丙孕酮片";
			else if(COCzhonglei.equals("4"))
				zhonglei="复方左炔诺孕酮片";
			else{
				zhonglei="未选择";
			 }
    	}
		%>
      <tr  id="r_table" class="disCOC" style="display:none">
      	<td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;开始使用时间
      	<input type="text" name="COCshijian" value=<%=shijian %> size="10">
      	</div></td>
      	<td class="r_cell_1"><div>上次落实周期数
      	<input type="text" name="COCchufang" value=<%=COCchufang %> size="10">
      	</div></td>
    </tr>   
    <tr id="r_table" class="disCOC" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;所选COC种类</div></td>
      <td class="r_cell_1"><div>
      	<input type="text" name="COCzhonglei" value=<%=zhonglei %> size="10">
      	</div></td>
    </tr> 
    
	<tr  id="r_table" class="disCOC" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;是否仍在使用</div></td>
      <td class="r_cell_1">
        <input name="COCjianchi" type="radio" value="1" onchange="COCjianchiChange(this)">
	       	是
        <input type="radio" name="COCjianchi" value="0" onchange="COCjianchiChange(this)">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr> 
	<!-- 
    <tr  id="r_table" class="disCOCjianchi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;是否愿意继续使用</div></td>
      <td class="r_cell_1">
        <input name="COCjixu" type="radio" value="1" onchange="COCjixushiyongChange(this)">
	       	是
        <input type="radio" name="COCjixu" value="0" onchange="COCjixushiyongChange(this)">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*
       </td>
    </tr> 
   
    <tr  id="r_table" class="disCOCjianchi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;使用是否满意</div></td>
      <td class="r_cell_1">
        <input name="COCmanyi" type="radio" value="1" onchange="COCmanyiChange(this)">
	       	是
        <input type="radio" name="COCmanyi" value="0" onchange="COCmanyiChange(this)">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*
       </td>
    </tr>
    <tr  id="r_table" class="disCOCmanyi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;不满意原因</div></td>
      <td class="r_cell_1">
        <select name="COCmanyiyuanyin" style="width:150px" onchange="COCqitamanyiChange(this)">
          	<option value="1">每天服用麻烦</option>
          	<option value="2">出现副作用</option>
          	<option value="3">担心长期服用不安全</option>
          	<option value="4">认为近期不可能怀孕，没必要避孕</option>
          	<option value="5">改用其他方法</option>
          	<option value="6">打算近期生育，不再需要避孕</option>
          	<option value="7">不知去哪里补充购买</option>
          	<option value="8">伴侣不满意</option>
          	<option value="9">其他原因</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disCOCqitamanyi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;其他不满意原因</div></td>
      <td class="r_cell_1"><input name="qitaCOCmanyiyuanyin" type="text" size="30">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</td>
    </tr>
	 -->
     <tr  id="r_table" class="disCOCweijianchi" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;未坚持使用原因</div></td>
      <td class="r_cell_1">
        <select name="COCyuanyin" style="width:150px" onchange="COCqitaweijianchiChange(this)">
          	<option value="1">每天服用麻烦</option>
          	<option value="2">出现副作用</option>
          	<option value="3">担心长期服用不安全</option>
          	<option value="4">认为近期不可能怀孕，没必要避孕</option>
          	<option value="5">改用其他方法</option>
          	<option value="6">打算近期生育，不再需要避孕</option>
          	<option value="7">不知去哪里补充购买</option>
          	<option value="8">伴侣不满意</option>
          	<option value="9">其他原因</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr  id="r_table" class="disCOCqitaweijianchi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;其他未坚持原因</div></td>
      <td class="r_cell_1"><input name="qitaCOCyuanyin" type="text" size="30">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</td>
    </tr>
     
    
    
    <tr  id="r_table" class="disCOCjianchi" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;本次是否补充落实</div></td>
      <td class="r_cell_1">
        <input name="COCjixuchufang" type="radio" value="1" >
	       	是
        <input type="radio" name="COCjixuchufang" value="0" >
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr  id="r_table" class="disCOCjixu" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;补充落实情况</div></td>
      <td class="r_cell_1"  >
        <select name="COCchufangshu" style="width:90px">
        	<option value="0">未补充</option>
          	<option value="1">一周期</option>
          	<option value="2">二周期</option>
          	<option value="3">三周期</option>
          	<option value="4">四周期</option>
          	<option value="5">五周期</option>
          	<option value="6">六周期</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    
    
    <tr  id="r_table" class="disIUD" style="display:none">
      <td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;放置时间</div></td>
      <%
			String fangzhi;
			if(IUDfangzhi.equals("1"))
				fangzhi="流产当日";
			else if(IUDfangzhi.equals("2"))
				fangzhi="流产后2周";
			else if(IUDfangzhi.equals("3"))
				fangzhi="首次恢复月经";
			else if(IUDfangzhi.equals("4"))
				fangzhi="流产后1个月";
			else{
				fangzhi="流产后2-3月";
			 }
		%>
      <td class="r_cell_1"><input name="IUDfangzhi" value=<%=fangzhi %> readonly="true" type="text" size="30"></td>
    </tr>
    <%if(IUDfangzhi.equals("1")) {%>
    <tr  id="r_table" class="disIUD" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;是否仍在使用</div></td>
      <td class="r_cell_1">
        <input name="IUDjianchi" type="radio" value="1" onchange="IUDjianchiChange(this)">
	       	是
        <input type="radio" name="IUDjianchi" value="0" onchange="IUDjianchiChange(this)">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
       
    </tr>
    <%}else{ %>
    <tr  id="r_table" class="disIUD" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;是否已放置</div></td>
      <td class="r_cell_1">
        <input name="IUDfangzhi2" type="radio" value="1" onchange="IUDriqiChange(this)">
	       	是
        <input type="radio" name="IUDfangzhi2" value="0" onchange="IUDriqiChange(this)">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
       
    </tr>
    <%} %>
    <tr  id="r_table" class="disIUDfangzhi2" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;放置日期</div></td>
      <td class="r_cell_1">
      	<div><input name="riqi" type="text" size="20" id="datepicker-example15" >
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
    </tr>
    <tr  id="r_table" class="disIUDfangzhi3" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;预约放置日期</div></td>
      <td class="r_cell_1">
      	<div><input name="riqi" type="text" size="20" id="datepicker-example16" >
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
    </tr>
    
    <tr  id="r_table" class="disIUDweijianchi" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;未坚持使用原因</div></td>
      <td class="r_cell_1">
        <select name="IUDyuanyin" onchange="IUDweijianchiChange(this)">
        	<option value="0"></option>
          	<option value="1">移位</option>
          	<option value="2">感染</option>
          	<option value="3">因症取出</option>
          	<option value="4">妊娠</option>
          	<option value="5">其他</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    
    <tr  id="r_table" class="disIUDqitaweijianchi" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;其他未坚持使用原因</div></td>
      <td class="r_cell_1"><input name="qitaIUDyuanyin" type="text" size="30">&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr  id="r_table" class="disweijianchi" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;是否换用其他避孕方式</div></td>
      <td class="r_cell_1">
        <select name="huanyongbiyun" onchange="huanyongChange(this)">
        	<option value="0"></option>
        	<option value="1">COC</option>
          	<option value="2">IUD</option>
          	<option value="3">IUS</option>
          	<option value="5">皮埋</option>
          	<option value="6">绝育</option>
          	<option value="4">避孕套</option>
          	<option value="7">其他</option>
			<option value="8">无</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    
    
    <tr id="r_table"   class="dishuanyongCOC" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议开始使用时间</div></td>
		<td class="r_cell_1">&nbsp;&nbsp;
		<select name="huanyongCOC" >
			<option value="0"></option>
        	<option value="1">立即</option>
          	<option value="2">未立即</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr> 
    <tr id="r_table"  class="dishuanyongIUD" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议放置时间</div></td>
		<td class="r_cell_1">&nbsp;&nbsp;
		<select name="huanyongIUD">
			<option value="0"></option>
        	<option value="1">流产后1个月</option>
          	<option value="2">流产后2-3个月</option>
        </select>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
       </td>
    </tr>
    <tr id="r_table"  class="dishuanyongCOC" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议使用周期</div></td>
      <td class="r_cell_1">&nbsp;&nbsp;
        <input name="huanyongCOCchufang" type="radio" value="1">
	       	1个月
        <input type="radio" name="huanyongCOCchufang" value="2">
       		2个月
		<input type="radio" name="huanyongCOCchufang" value="3">
       		3个月<br/>&nbsp;&nbsp;
       		<!--
		<input type="radio" name="huanyongCOCchufang" value="4">
       		3个周期以上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       	-->
       	<input type="radio" name="huanyongCOCchufang" value="4">
       		4个月
       	<input type="radio" name="huanyongCOCchufang" value="5">
       		5个月
       	<input type="radio" name="huanyongCOCchufang" value="6">
       		6个月
       </td>
    </tr>
    
    <tr  id="r_table" class="disother" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;是否愿意选择高效避孕方法</div></td>
      <td class="r_cell_1">
        <input name="yuanyigaoxiao" type="radio" value="1" onchange="gaoxiaoChange(this)">
	       	是
        <input type="radio" name="yuanyigaoxiao" value="0" onchange="gaoxiaoChange(this)">
       		否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr>
    <tr  id="r_table" class="disgaoxiao" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;高效避孕方式</div></td>
      <td class="r_cell_1">
        <select name="gaoxiaobiyun" onchange="gaoxiaobiyunChange(this)">
        	<option value="0"></option>
          	<option value="1">COC</option>
          	<option value="2">IUD</option>
          	<option value="3">IUS</option>
          	<option value="4">皮埋</option>
          	<option value="5">绝育</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr id="r_table" class="disgaoxiaoCOC" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;所选COC种类</div></td>
		<td class="r_cell_1">
		<select name="gaoxiaozhonglei">
			<option value="0"></option>
        	<option value="1">屈螺酮炔雌醇片</option>
          	<option value="2">去氧孕烯炔雌醇片</option>
          	<option value="3">炔雌醇环丙孕酮片</option>
          	<option value="4">复方左炔诺孕酮片</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr> 
    <tr  id="r_table" class="disgaoxiaoCOC" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;建议开始使用时间</div></td>
      <td class="r_cell_1">
        <select name="gaoxiaoshijian">
          	<option value="1">立即</option>
          	<option value="2">下次月经第1天</option>
          	<option value="3">1个月后</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr  id="r_table" class="disgaoxiaoCOC" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;本次落实周期数</div></td>
      <td class="r_cell_1">
        <select name="gaoxiaochufang" style="width:50px">
          	<option value="1">1</option>
          	<option value="2">2</option>
          	<option value="3">3</option>
          	<option value="4">4</option>
          	<option value="5">5</option>
          	<option value="6">6</option>
        </select>个月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr  id="r_table" class="disgaoxiaoIUD" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;&nbsp;&nbsp;放置时间</div></td>
      <td class="r_cell_1">
        <select name="gaoxiaofangzhi">
          	<option value="1">立即</option>
          	<option value="2">下次月经</option>
          	<option value="3">1个月后</option>
          	<option value="4">3个月后</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    
    <tr  id="r_table" class="disfeigaoxiao" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;非高效避孕方式</div></td>
      <td class="r_cell_1">
        <select name="feigaoxiao" onchange="qitafeigaoxiaoChange(this)">
          	<option value="1">避孕套</option>
          	<option value="5">其他</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr  id="r_table" class="disqitafeigaoxiao" style="display:none">
      <td class="r_cell_1"><div>*&nbsp;&nbsp;其他避孕方式</div></td>
      <td class="r_cell_1"><input name="qitafeigaoxiao" type="text" size="30">
      &nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>

    

    <tr  id="r_table">
      <td class="r_cell_1"><div style="font-weight:normal">&nbsp;&nbsp;&nbsp;其他咨询内容</div></td>
      <td class="r_cell_1"><input name="other" type="text" size="30">
      </td>
    </tr>
	<%
    	String shuming = dao.getShuming(request.getParameter("shuming"));
    	%>
    <tr  id="r_table">
      <td class="r_cell_1"><div>&nbsp;&nbsp;咨询员署名</div></td>
      <td class="r_cell_1"><input name="person" type="text" value=<%=shuming%> size="15">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
    </tr>
	
	 <tr  id="r_table">
       <td class="r_cell_1">&nbsp;</td>
       <td class="r_cell_1" align="right">
       <input type="image" id="save1" src="Images/save.jpg" onClick="do_first()"/>
       </td>
    </tr>
  </table>
 </form>
 <script type="text/javascript" src="public/javascript/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="public/javascript/zebra_datepicker.src.js"></script>
        <script type="text/javascript" src="public/javascript/core.js"></script>
</body>
</HTML>