<%@ page contentType="text/html" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
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
width: 350px;
padding-left: 15px;
}

.b-content {
font-family:"微软雅黑";
	font-size: 16px;
	font-weight: bold;
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
	<title>患者问诊信息录入</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script language=javascript>
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
	alertFram.style.width = "360px";
	alertFram.style.height = "223px";
	alertFram.style.background = "#ccc";
	alertFram.style.textAlign = "center";
	alertFram.style.lineHeight = "20px";
	alertFram.style.zIndex = "10001";
	strHtml   = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";
	strHtml += " <li style=\"background-image:url(Images/alert.png);text-align:center;font-size:12px;height:223px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\"><br/><br/>"+txt+"<br/><br/><input type=\"image\" id=\"do_OK\" src=\"Images/sure.jpg\" onClick=\"doOk()\"/></li>\n";
	strHtml += "</ul>\n";
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
	
function do_zhongyuan(){
	
	var adviseform = document.adviseform;
	var name = adviseform.name.value;
	var date = adviseform.date.value;
	var num = adviseform.num.value;
	var shijian = adviseform.shijian.value;
	var fangshi = adviseform.fangshi.value;
	var chuxuetianshu = adviseform.chuxuetianshu.value;
	var bingfa = adviseform.bingfa.value;
	var bingfazheng = adviseform.bingfazheng.value;
	var qitabingfa = adviseform.qitabingfa.value;
	var chuxue = adviseform.chuxue.value;
	var youwubushi = adviseform.youwubushi.value;
	var bushi = adviseform.bushi.value;
	var qitabushi = adviseform.qitabushi.value;
	var huifu = adviseform.huifu.value;
	var huifushijian = adviseform.huifushijian.value;
	var xiangbi = adviseform.xiangbi.value;
	var xinghuifu = adviseform.xinghuifu.value;
	var liuchanbiyun = adviseform.liuchanbiyun.value;
	var COCshijian = adviseform.COCshijian.value;
	var COCchufang = adviseform.COCchufang.value;
	var COCjianchi = adviseform.COCjianchi.value;
	var COCjixu = adviseform.COCjixu.value;
	var COCyuanyin = adviseform.COCyuanyin.value;
	var qitaCOCyuanyin = adviseform.qitaCOCyuanyin.value;
	var COCjixuchufang = adviseform.COCjixuchufang.value;
	var COCchufangshu = adviseform.COCchufangshu.value;
	var IUDfangzhi = adviseform.IUDfangzhi.value;
	var IUDjianchi = adviseform.IUDjianchi.value;
	var IUDyuanyin = adviseform.IUDyuanyin.value;
	var qitaIUDyuanyin = adviseform.qitaIUDyuanyin.value;
	var yuanyigaoxiao = adviseform.yuanyigaoxiao.value;
	var gaoxiaobiyun = adviseform.gaoxiaobiyun.value;
	var gaoxiaoshijian = adviseform.gaoxiaoshijian.value;
	var gaoxiaochufang = adviseform.gaoxiaochufang.value;
	var gaoxiaofangzhi = adviseform.gaoxiaofangzhi.value;
	var feigaoxiao = adviseform.feigaoxiao.value;
	var qitafeigaoxiao = adviseform.qitafeigaoxiao.value;
	var yiwai = adviseform.yiwai.value;
	var renshen = adviseform.renshen.value;
	var zhongzhi = adviseform.zhongzhi.value;
	var qita = 0;
	//window.alert(username_hash);
	if(adviseform.name.value!="" && adviseform.num.value!=""){
		//window.alert(loginForm.user_name.value + "  " + loginForm.password.value);
		url="do_zhongyuan.jsp?name="+name+"&date="+date+"&shijian="+shijian+"&num="+num
				+"&fangshi="+fangshi+"&chuxuetianshu="+chuxuetianshu+"&bingfa="+bingfa
				+"&bingfazheng="+bingfazheng+"&qitabingfa="+qitabingfa+"&chuxue="+chuxue
				+"&youwubushi="+youwubushi+"&bushi="+bushi+"&qitabushi="+qitabushi+"&huifu="+huifu
				+"&huifushijian="+huifushijian+"&xiangbi="+xiangbi+"&xinghuifu="+xinghuifu
				+"&liuchanbiyun="+liuchanbiyun+"&COCshijian="+COCshijian+"&COCyuanyin="+COCyuanyin
				+"&COCjianchi="+COCjianchi+"&COCjixu="+COCjixu+"&COCchufangshu="+COCchufangshu+"&COCchufang="+COCchufang
				+"&qitaCOCyuanyin="+qitaCOCyuanyin+"&COCjixuchufang="+COCjixuchufang+"&IUDfangzhi="+IUDfangzhi
				+"&IUDjianchi="+IUDjianchi+"&IUDyuanyin="+IUDyuanyin+"&qitaIUDyuanyin="+qitaIUDyuanyin
				+"&yuanyigaoxiao="+yuanyigaoxiao+"&gaoxiaobiyun="+gaoxiaobiyun+"&gaoxiaoshijian="+gaoxiaoshijian
				+"&gaoxiaochufang="+gaoxiaochufang+"&gaoxiaofangzhi="+gaoxiaofangzhi+"&feigaoxiao="+feigaoxiao
				+"&qitafeigaoxiao="+qitafeigaoxiao+"&yiwai="+yiwai+"&renshen="+renshen+"&zhongzhi="+zhongzhi;
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
	     objTemp.style.display = "table-row";
	 }
	 var list2 = document.getElementsByClassName("disCOCweijianchi");
	 for(var i = 0, l = list2.length; i < l; i++) {
	     var objTemp = list2[i];
	     objTemp.style.display = "none";
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
	 sAlert("提示：此患者可能有近期再次妊娠风险，请重点咨询！");
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
 if(weijianchi.value=="6")
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


function renshenChange(renshen)
{
 if(renshen.value=="1")
 {	
	 var list = document.getElementsByClassName("disrenshen");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "table-row";
	 }
	 sAlert("此患者短期内再次妊娠，属高危患者，请重点咨询！");
 } 
 else
 {
	var list = document.getElementsByClassName("disrenshen");
	 for(var i = 0, l = list.length; i < l; i++) {
	     var objTemp = list[i];
	     objTemp.style.display = "none";
	 }
 }
}
</script>

<body>
<form action="javascript:void(0)" name="adviseform" id="Form1" method="post" accept-charset="utf-8">
  <table class="b-content">
    <tr  id="r_table">
			<td height="34" colspan="2" bgcolor="#97CBFF">
				<div align="center" class="STYLE4">
					三个月随访						
				</div>								
			</td>
		</tr>
    	<tr  id="r_table">
    		<td height="34" colspan="2">
    		<div align="center" class="STYLE4">
					<font size="2px" color="red">保护隐私是我们的责任，病人所有资料保密，任何人不得外泄或窃取！</font>								
			</div>	
			</td>
    	</tr>
    	<tr>
    		<td  colspan="2" align="right">
    			<a href="patient_page.jsp"><img width="60" height="30" src="Images/back.jpg"/></a>
			</td>
    	</tr>
    	<%
    	String num,name,tel,nibiyun,biyun,COCshijian,COCchufang,IUDfangzhi,other="",COCzhonglei="",zhonglei="",gaowei="";
    	request.setCharacterEncoding("utf-8");
    	ResultSet Rs;
    	if(request.getParameter("num")==null){
    		num=" ";name=" ";tel=" ";nibiyun=" ";biyun=" ";
    		COCshijian=" ";COCchufang=" ";IUDfangzhi=" ";}
    	else{
    		
    		num=request.getParameter("num");
    		String SQL = "select * from patient_info where num="+num.toString();
    		Rs = dao.executeQuery(SQL);
    		Rs.next();
    		name = Rs.getString("name");
    		tel = Rs.getString("tel");
    		biyun = Rs.getString("nibiyun");
    		COCshijian = Rs.getString("COCshijian");
    		COCchufang = Rs.getString("COCchufang");
    		IUDfangzhi = Rs.getString("IUDfangzhi");
    		other = Rs.getString("other");
    		int biyun_i = Integer.valueOf(biyun).intValue();
    		nibiyun = new String();
			gaowei = Rs.getString("gaowei");
			COCzhonglei = Rs.getString("COCzhonglei");
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
    	}
    	%>
    	<%if(gaowei.equals("1")||gaowei.equals("2")) {%>
    			<script type="text/javascript">
    			sAlert("此患者属高危或重点，请重点咨询！");
    			</script>
    			<%} %>
    <tr  id="r_table">
      <td class="r_cell_1"><div>随访时间</div></td>
      <td>
        <input type="radio" disabled="disabled" name="shijian" value="3" checked="checked">
       		3
       	<input type="radio" disabled="disabled" name="shijian" value="6">
       		6
       	<input type="radio" disabled="disabled" name="shijian" value="12">
       		12
       </td>
    </tr>
    <%
    	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-M-dd");
    	java.util.Date currTime = new java.util.Date();
    	String curTime = formatter.format(currTime);
    	%>
    <tr  id="r_table">
      <td class="r_cell_1"><div>咨询日期</div></td>
      <td class="star">
      	<input name="date" type="text" size="30" value=<%=curTime %> id="datepicker-example1">
      	
      </td>
    </tr>

    <tr  id="r_table">
      <td class="r_cell_1"><div>姓名</div></td>
      <td><input name="name" type="text" size="30" value=<%=name%>>&nbsp;*
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>病历号</div></td>
      <td class="star"><input name="num" type="text" size="30" value=<%=num%> >&nbsp;*</td>
    </tr>
    <tr  id="r_table">
      		<td class="r_cell_1"><div>联系方式</div></td>
      		<td class="star"><input name="tel" type="text" size="30" value=<%=tel%>></td>
    	</tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>随访方式</div></td>
        <td>
        		<input name="fangshi" type="radio" value="1">
	       			复诊
        		<input type="radio" name="fangshi" value="2">
       				电话
       			<input type="radio" name="fangshi" value="0">
       				未联系上&nbsp;*
       		</td>
    </tr>
    <tr  id="r_table">
      		<td class="r_cell_1"><div>流产后出血天数&nbsp;
      		<input name="chuxuetianshu" type="text" size="5">&nbsp;*</div></td>
      		<td class="r_cell_1"><div>有无流产并发症
        		<input name="bingfa" type="radio" value="1" onchange="bingfaChange(this)">
	       			有
       	 		<input type="radio" name="bingfa" value="0" onchange="bingfaChange(this)">
       				无&nbsp;*
       		</div></td>
    	</tr>
    
    <tr  id="r_table" class="disbingfa" style="display:none">
      <td class="r_cell_1"><div>并发症种类</div></td>
      <td>
        <select name="bingfazheng" onchange="qitabingfaChange(this)">
          	<option value="1">子宫穿孔</option>
          	<option value="2">生殖道损伤</option>
          	<option value="3">人流不全</option>
          	<option value="4">大出血</option>
          	<option value="5">感染</option>
          	<option value="6">宫腔粘连</option>
          	<option value="7">其他</option>
        </select>&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disqitabingfa" style="display:none">
      <td class="r_cell_1"><div>其他并发症种类</div></td>
      <td class="star"><input name="qitabingfa" type="text" size="30" >&nbsp;*</td>
    </tr>
    <tr  id="r_table" style="display:none">
      <td class="r_cell_1"><div>目前出血量</div></td>
      <td>
        <select name="chuxue">
          	<option value="1">少于月经</option>
          	<option value="2">与月经相似</option>
          	<option value="3">多于月经</option>
        </select>&nbsp;*</td>
    </tr>
    <tr id="r_table">
      	<td class="r_cell_1"><div>有无不适症状</div></td>
		<td>
        	<input name="youwubushi" type="radio" value="1" onchange="bushiChange(this)">
	    		有
       	 	<input type="radio" name="youwubushi" value="0" onchange="bushiChange(this)">
   				无&nbsp;*
   		</td>
    </tr>
    <tr  id="r_table" class="disbushi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;不适症状</div></td>
      <td>
        <select name="bushi" onchange="qitabushiChange(this)">
          	<option value="1">发热</option>
          	<option value="2">腹痛</option>
          	<option value="3">其他</option>
        </select>&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disqitabushi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;其他不适症状</div></td>
      <td class="star"><input name="qitabushi" type="text" size="30">&nbsp;*</td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>月经是否恢复</div></td>
      <td>
        <input name="huifu" type="radio" value="1" onchange="huifuChange(this)">
	       	是
        <input type="radio" name="huifu" value="0" onchange="huifuChange(this)">
       		否&nbsp;*
       </td>
    </tr>
    <tr  id="r_table" class="dishuifu" style="display:none">
      <td class="r_cell_1"><div>月经恢复时间</div></td>
      <td>
        <select name="huifushijian">
        	<option value="0"></option>
          	<option value="2">流产后2周</option>
          	<option value="3">流产后3周</option>
          	<option value="4">流产后4周</option>
          	<option value="5">流产后5周</option>
        </select>&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="dishuifu" style="display:none">
      <td class="r_cell_1"><div>月经血量与平时相比</div></td>
      <td>
        <input name="xiangbi" type="radio" value="1">
	       	 少于
        <input type="radio" name="xiangbi" value="2">
       		相似
       	<input type="radio" name="xiangbi" value="3">
       		多于
       	<input type="radio" name="xiangbi" value="4">
       		说不清&nbsp;*
       </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>是否性生活恢复</div></td>
      <td>
        <select name="xinghuifu">
        	<option value="0"></option>
        	<option value="0">未恢复</option>
          	<option value="1">流产后一周恢复</option>
          	<option value="2">流产后两周恢复</option>
          	<option value="3">流产后三周恢复</option>
          	<option value="4">流产后四周恢复</option>
        </select>&nbsp;*</td>
    </tr>   
    
    <tr  id="r_table">
      	<td class="r_cell_1"><div>流产时选择避孕方式</div></td>
      	<td><input id="liuchanbiyun" name="liuchanbiyun" type="text" size="10" value=<%=nibiyun%> readonly="true" onmousemove="biyunChange(this)"></td>
    </tr>
    <% 		String shijian;
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
    	
		%>
		<tr id="r_table" class="disCOC" style="display:none">
      <td><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所选COC种类</div></td>
      <td class="r_cell_1"><div>
      	<input type="text" name="COCzhonglei" value=<%=zhonglei %> size="10">
      	</div></td>
    </tr> 
    
      <tr  id="r_table" class="disCOC" style="display:none">
      	<td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首次使用时间
      	<input type="text" name="COCshijian" value=<%=shijian %> size="10">
      	</div></td>
      	<td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;处方周期数
      	<input type="text" name="COCchufang" value=<%=COCchufang %> size="10">
      	</div></td>
    </tr>   
	<tr  id="r_table" class="disCOC" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否仍在使用</div></td>
      <td>
        <input name="COCjianchi" type="radio" value="1" onchange="COCjianchiChange(this)">
	       	是
        <input type="radio" name="COCjianchi" value="0" onchange="COCjianchiChange(this)">
       		否&nbsp;*
       </td>
    </tr> 
    <tr  id="r_table" class="disCOCjianchi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否愿意继续使用</div></td>
      <td>
        <input name="COCjixu" type="radio" value="1">
	       	是
        <input type="radio" name="COCjixu" value="0">
       		否&nbsp;*
       </td>
    </tr>
     <tr  id="r_table" class="disCOCweijianchi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未坚持使用原因</div></td>
      <td>
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
        </select>&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disCOCqitaweijianchi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他原因</div></td>
      <td class="star"><input name="qitaCOCyuanyin" type="text" size="30">&nbsp;*</td>
    </tr>
    
    <tr  id="r_table" class="disCOC" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本次是否继续处方</div></td>
      <td>
        <input name="COCjixuchufang" type="radio" value="1" onchange="COCjixuChange(this)">
	       	是
        <input type="radio" name="COCjixuchufang" value="0" onchange="COCjixuChange(this)">
       		否&nbsp;*
       </td>
    </tr>
    <tr  id="r_table" class="disCOCjixu" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;处方数</div></td>
      <td>
        <select name="COCchufangshu">
        	<option value="0"></option>
          	<option value="1">1</option>
          	<option value="2">2</option>
          	<option value="3">3</option>
          	<option value="4">4</option>
          	<option value="5">5</option>
          	<option value="6">6</option>
        </select>盒&nbsp;*</td>
    </tr>
    
    
    <tr  id="r_table" class="disIUD" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;放置时间</div></td>
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
      <td class="star"><input name="IUDfangzhi" value=<%=fangzhi %> readonly="true" type="text" size="30"></td>
  
    </tr>
    <%if(IUDfangzhi.equals("1")) {%>
    <tr  id="r_table" class="disIUD" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否仍在使用</div></td>
      <td>
        <input name="IUDjianchi" type="radio" value="1" onchange="IUDjianchiChange(this)">
	       	是
        <input type="radio" name="IUDjianchi" value="0" onchange="IUDjianchiChange(this)">
       		否&nbsp;*
       </td>
       
    </tr>
    <%}else{ %>
    <tr  id="r_table" class="disIUD" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否放置</div></td>
      <td>
        <input name="IUDfangzhi2" type="radio" value="1" onchange="IUDriqiChange(this)">
	       	是
        <input type="radio" name="IUDfangzhi2" value="0" onchange="IUDriqiChange(this)">
       		否&nbsp;*
       </td>
       
    </tr>
    <%} %>
    <tr  id="r_table" class="disIUDfangzhi2" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;放置日期</div></td>
      <td class="star">
      	<div><input name="riqi" type="text" size="30" id="datepicker-example15" >
      	*</div>
      </td>
    </tr>
    <tr  id="r_table" class="disIUDfangzhi3" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;预约放置日期</div></td>
      <td class="star">
      	<div><input name="riqi" type="text" size="30" id="datepicker-example16" >
      	*</div>
      </td>
    </tr>
    <tr  id="r_table" class="disIUDweijianchi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未坚持使用原因</div></td>
      <td>
        <select name="IUDyuanyin" onchange="IUDweijianchiChange(this)">
        	<option value="0"></option>
          	<option value="1">移位</option>
          	<option value="2">感染</option>
          	<option value="3">因症取出</option>
          	<option value="4">妊娠</option>
          	<option value="6">其他</option>
        </select>&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disIUDqitaweijianchi" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他未坚持使用原因</div></td>
      <td class="star"><input name="qitaIUDyuanyin" type="text" size="30">&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disother" style="display:none">
      <td class="r_cell_1"><div>是否愿意选择高效避孕方法</div></td>
      <td>
        <input name="yuanyigaoxiao" type="radio" value="1" onchange="gaoxiaoChange(this)">
	       	是
        <input type="radio" name="yuanyigaoxiao" value="0" onchange="gaoxiaoChange(this)">
       		否&nbsp;*
       </td>
    </tr>
    <tr  id="r_table" class="disgaoxiao" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高效避孕方式</div></td>
      <td>
        <select name="gaoxiaobiyun" onchange="gaoxiaobiyunChange(this)">
        	<option value="0"></option>
          	<option value="1">COC</option>
          	<option value="2">IUD</option>
          	<option value="3">曼月乐</option>
          	<option value="5">皮埋</option>
          	<option value="6">绝育</option>
        </select>&nbsp;*</td>
    </tr>
    <tr id="r_table" class="disgaoxiaoCOC" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所选COC种类</div></td>
		<td>
		<select name="gaoxiaozhonglei">
			<option value="0"></option>
        	<option value="1">屈螺酮炔雌醇片</option>
          	<option value="2">去氧孕烯炔雌醇片</option>
          	<option value="3">炔雌醇环丙孕酮片</option>
          	<option value="4">复方左炔诺孕酮片</option>
        </select>&nbsp;*	
       </td>
    </tr> 
    <tr  id="r_table" class="disgaoxiaoCOC" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首次使用时间</div></td>
      <td>
        <select name="gaoxiaoshijian">
          	<option value="1">立即</option>
          	<option value="2">下次月经第一天</option>
          	<option value="3">一个月后</option>
        </select>&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disgaoxiaoCOC" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;处方周期数</div></td>
      <td>
        <select name="gaoxiaochufang">
          	<option value="1">1</option>
          	<option value="2">2</option>
          	<option value="3">3</option>
          	<option value="4">4</option>
          	<option value="5">5</option>
          	<option value="6">6</option>
        </select>盒&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disgaoxiaoIUD" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;放置时间</div></td>
      <td>
        <select name="gaoxiaofangzhi">
          	<option value="1">立即</option>
          	<option value="2">下次月经</option>
          	<option value="3">一个月后</option>
          	<option value="4">三个月后</option>
        </select>&nbsp;*</td>
    </tr>
    
    <tr  id="r_table" class="disfeigaoxiao" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;非高效避孕方式</div></td>
      <td>
        <select name="feigaoxiao" onchange="qitafeigaoxiaoChange(this)">
          	<option value="1">避孕套</option>
          	<option value="2">安全期</option>
          	<option value="3">体外射精</option>
          	<option value="4">紧急避孕药</option>
          	<option value="5">其他</option>
        </select>&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disqitafeigaoxiao" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其他避孕方式</div></td>
      <td class="star"><input name="qitafeigaoxiao" type="text" size="30">&nbsp;*</td>
    </tr>
    <%
       String other_t="";
       if(other.contains("1"))
    	   {other_t+="月经紊乱,";}
       if(other.contains("2"))
    	   {other_t+="月经过多,";}
       if(other.contains("3"))
    	   {other_t+="痛经,";}
       if(other.contains("4"))
    	   {other_t+="经前期综合征,";}
       if(other.contains("5"))
    	   {other_t+="盆腔炎,";}
       if(other.contains("7"))
    	   {other_t+="痤疮";}
       %>
       <%if(other_t!=""){ %>
	  <tr  id="r_table">
      <td class="r_cell_1"><div>此患者流产前合并</div></td>
      <td class="r_cell_1"><input name="hebing" type="text" readonly="readonly" value=<%=other_t %>></td>
    </tr>
      <tr  id="r_table">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前是否有所缓解</div></td>
      <td>
        <input name="huanjie" type="radio" value="1">
	       	是
        <input type="radio" name="huanjie" value="0">
       		否&nbsp;*
       </td>
    </tr>
    <%} %>
        <tr  id="r_table">
      <td class="r_cell_1"><div>是否再次妊娠</div></td>
      <td>
        <input name="yiwai" type="radio" value="1" onchange="renshenChange(this)">
	       	是
        <input type="radio" name="yiwai" value="0" onchange="renshenChange(this)">
       		否&nbsp;*
       </td>
    </tr>
     <tr  id="r_table" class="disrenshen" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;再次妊娠时间</div></td>
      <td>
        <select name="renshen">
          	<option value="1">上次流产后1个月</option>
          	<option value="2">上次流产后2个月</option>
          	<option value="3">上次流产后3个月</option>
        </select>&nbsp;*</td>
    </tr>
    <tr  id="r_table" class="disrenshen" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否终止</div></td>
      <td>
        <input name="zhongzhi" type="radio" value="1">
	       	有
        <input type="radio" name="zhongzhi" value="0">
       		无&nbsp;*
       </td>
    </tr>
	 <tr  id="r_table">
       <td class="r_cell_1">&nbsp;</td>
       <td align="right"><input type="button" name="first" value="保存" onClick = "do_zhongyuan()"/>
       </td>
    </tr>
  </table>
 </form>
 <script type="text/javascript" src="public/javascript/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="public/javascript/zebra_datepicker.src.js"></script>
        <script type="text/javascript" src="public/javascript/core.js"></script>
</body>
</HTML>