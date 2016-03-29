<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

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
padding-bottom: 1px;
border-bottom: 1px solid #c9d7f1;
}

#r_table div {
display: block;
font-size: 14px;
font-weight: bold;
color: #666;
padding-bottom: 1px;
}

#dischan td {
vertical-align: middle;
padding-top: 5px;
padding-bottom: 3px;
border-bottom: 1px solid #c9d7f1;
}

#dischan div {
display: block;
font-size: 14px;
font-weight: bold;
color: #666;
padding-bottom: 1px;
}

.r_cell_1 {
width: 350px;
padding-left: 10px;
font-size: 8px;
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
margin-right: 5px;
}

</style>
	<title>患者问诊信息录入</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script language=javascript>
function checkEmpty(form)
{
	if(document.form.name.value=="")
	{
		alert("患者姓名不能为空");
		return false;
	}
	else if(document.form.num.value=="")
	{
		alert("患者病历号不能为空");
		return false;
	}
	else if(document.form.date.value=="")
	{
		alert("咨询日期不能为空");
		return false;
	}
	else if(document.form.age.value=="")
	{
		alert("患者年龄不能为空");
		return false;
	}
	else 
	{
		return true;
	}
}
function loadCalendar(field){
		var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
		return true;
	}
function HS_DateAdd(interval,number,date){
	 number = parseInt(number);
	 if (typeof(date)=="string"){var date = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2]);}
	 if (typeof(date)=="object"){var date = date;}
	 switch(interval){
	 case "y":return new Date(date.getFullYear()+number,date.getMonth(),date.getDate()); break;
	 case "m":return new Date(date.getFullYear(),date.getMonth()+number,checkDate(date.getFullYear(),date.getMonth()+number,date.getDate())); break;
	 case "d":return new Date(date.getFullYear(),date.getMonth(),date.getDate()+number); break;
	 case "w":return new Date(date.getFullYear(),date.getMonth(),7*number+date.getDate()); break;
	 }
	}
	function checkDate(year,month,date){
	 var enddate = ["31","28","31","30","31","30","31","31","30","31","30","31"];
	 var returnDate = "";
	 if (year%4==0){enddate[1]="29";}
	 if (date>enddate[month]){returnDate = enddate[month];}else{returnDate = date;}
	 return returnDate;
	}

	function WeekDay(date){
	 var theDate;
	 if (typeof(date)=="string"){theDate = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2]);}
	 if (typeof(date)=="object"){theDate = date}
	 return theDate.getDay();
	}
	function HS_calender(){
	 var lis = "";
	 var style = "";
	 style +="<style type='text/css'>";
	 style +=".calender { width:200px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
	 style +=".calender ul {list-style-type:none; margin:0; padding:0;}";
	 style +=".calender .day { background-color:#EDF5FF; height:20px;}";
	 style +=".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
	 style +=".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
	 style +=".calender li a:hover { color:#f30; text-decoration:underline}";
	 style +=".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
	 style +=".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
	 style +=".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
	 style +=".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
	 style +=".calender .LastMonth { float:left;}";
	 style +=".calender .NextMonth { float:right;}";
	 style +=".calenderBody {clear:both}";
	 style +=".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
	 style +=".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
	 style +=".today a { color:#f30; }";
	 style +=".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
	 style +=".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
	 style +=".calenderBottom a.closeCalender{float:right}";
	 style +=".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
	 style +="</style>";

	 var now,i=0;
	 if (typeof(arguments[0])=="string"){
	  selectDate = arguments[0].split("-");
	  var year = selectDate[0];
	  var month = parseInt(selectDate[1])-1+"";
	  var date = selectDate[2];
	  now = new Date(year,month,date);
	 }else if (typeof(arguments[0])=="object"){
	  now = arguments[0];
	 }
	 var lastMonthEndDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+now.getMonth()+"-01").getDate();
	 var lastMonthDate = WeekDay(now.getFullYear()+"-"+now.getMonth()+"-01");
	 var thisMonthLastDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-01");
	 var thisMonthEndDate = thisMonthLastDate.getDate();
	 var thisMonthEndDay = thisMonthLastDate.getDay();
	 var todayObj = new Date();
	 today = todayObj.getFullYear()+"-"+todayObj.getMonth()+"-"+todayObj.getDate();
	 
	 for (i=0; i<lastMonthDate; i++){  // Last Month's Date
	  lis = "<li class='lastMonthDate'>"+lastMonthEndDate+"</li>" + lis;
	  lastMonthEndDate--;
	 }
	 for (i=1; i<=thisMonthEndDate; i++){ // Current Month's Date

	  if(today == now.getFullYear()+"-"+now.getMonth()+"-"+i){
	   var todayString = now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-"+i;
	   lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
	  }else{
	   lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
	  }
	  
	 }
	 var j=1;
	 for (i=thisMonthEndDay; i<6; i++){  // Next Month's Date
	  lis += "<li class='nextMonthDate'>"+j+"</li>";
	  j++;
	 }
	 lis += style;

	 var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Next Month'>&raquo;</a>";
	 CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Previous Month'>&laquo;</a>";
	 CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"+now.getFullYear()+"</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"+(parseInt(now.getMonth())+1).toString()+"</a></span>月";

	 if (arguments.length>1){
	  arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
	  arguments[1].parentNode.innerHTML = CalenderTitle;

	 }else{
	  var CalenderBox = style+"<div class='calender'><div class='calenderTitle'>"+CalenderTitle+"</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>"+lis+"</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>&times;</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+todayString+"'>Today</a></span></span></div></div>";
	  return CalenderBox;
	 }
	}
	function _selectThisDay(d){
	 var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
	  boxObj.targetObj.value = d.title;
	  boxObj.parentNode.removeChild(boxObj);
	}
	function closeCalender(d){
	 var boxObj = d.parentNode.parentNode.parentNode;
	  boxObj.parentNode.removeChild(boxObj);
	}

	function CalenderselectYear(obj){
	  var opt = "";
	  var thisYear = obj.innerHTML;
	  for (i=1970; i<=2020; i++){
	   if (i==thisYear){
	    opt += "<option value="+i+" selected>"+i+"</option>";
	   }else{
	    opt += "<option value="+i+">"+i+"</option>";
	   }
	  }
	  opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"+opt+"</select>";
	  obj.parentNode.innerHTML = opt;
	}

	function selectThisYear(obj){
	 HS_calender(obj.value+"-"+obj.parentNode.parentNode.getElementsByTagName("span")[1].getElementsByTagName("a")[0].innerHTML+"-1",obj.parentNode);
	}

	function CalenderselectMonth(obj){
	  var opt = "";
	  var thisMonth = obj.innerHTML;
	  for (i=1; i<=12; i++){
	   if (i==thisMonth){
	    opt += "<option value="+i+" selected>"+i+"</option>";
	   }else{
	    opt += "<option value="+i+">"+i+"</option>";
	   }
	  }
	  opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"+opt+"</select>";
	  obj.parentNode.innerHTML = opt;
	}
	function selectThisMonth(obj){
	 HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0].getElementsByTagName("a")[0].innerHTML+"-"+obj.value+"-1",obj.parentNode);
	}
	function HS_setDate(inputObj){
	 var calenderObj = document.createElement("span");
	 calenderObj.innerHTML = HS_calender(new Date());
	 calenderObj.style.position = "absolute";
	 calenderObj.targetObj = inputObj;
	 inputObj.parentNode.insertBefore(calenderObj,inputObj.nextSibling);
	}

function reWin() {

var mngIfrm_div = $d("MngIfrm_div");

var rightIfrm_div = $d("rightIfrm_div");

var arrowright_div = $d("arrowright_div");

arrowright_div.className = "aw";

if(mngIfrm_div.style.display!="none") {

mngIfrm_div.style.display="none";

arrowright_div.style.filter="fliph";

arrowright_div.title=txtEp;

is_ext_mb = false;

if(hasAds) {

if(hasLrc || isAllyesExt) {

arrowright_div.style.marginLeft="420px";

rightIfrm_div.style.display="inline";

} else {

rightIfrm_div.style.display="none";

arrowright_div.style.marginLeft="0px";

showAdRight(arrBaiduAds[18]);

$d("Lrc_div").style.marginLeft = "8";

window.moveTo((screen.width - 399) / 2, 0);

window.resizeTo(399 + woffset, 600);

}

} else {

rightIfrm_div.style.display="none";

$d("Lrc_div").style.marginLeft = "8";

window.moveTo((screen.width - 399) / 2, 0);

window.resizeTo(399 + woffset, 600);

}

} else {

$d("Lrc_div").style.marginLeft = "3";



if(screen.width > 800) window.moveTo(100, 0); else window.moveTo(0, 0);

window.resizeTo(810 + woffset, 600);



mngIfrm_div.style.display="inline";

rightIfrm_div.style.display="inline";

if(!isLoadIf) {

search_location = search_location.replace("baidumt", "baidubox");

$d("try_iframe").src= search_location;

try_iframe = window.frames[0];

isLoadIf = true;

}

$d("Blrc").style.display          = "inline";

$d("LrcShower_div").style.display = "inline";

$d("lrctellall_div").style.display = "none";

arrowright_div.style.filter="normal";

arrowright_div.style.marginLeft="0px";

arrowright_div.title=txtTb;

is_ext_mb = true;

}

if(hasAds){
$d('try_iframe').style.height = "225px";
}else{
$d('try_iframe').style.height = "520px";
}

if (is_ext_mb) {

$d("leftAd_div").style.marginTop = "5px";
}
else {
if (isAllyesExt) {
$d("leftAd_div").style.display = "none";
$d("leftAd2_div").style.display = "";
$d("leftAd2_div").style.height = "430px";
$d("leftAd2_div").style.marginTop = "100px";

return true;
}
else {
$d("leftAd_div").style.marginTop = "230px";
}
}

$d("leftAd_div").style.display = "";
$d("leftAd2_div").style.display = "none";

}
function GetRequest() {
   var url = location.search; //��ȡurl��"?"�����ִ�
   var theRequest = new Object();
   if (url.indexOf("?") != -1) {
      var str = url.substr(1);
      strs = str.split("&");
      for(var i = 0; i < strs.length; i ++) {
         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
      }
   }
   return theRequest;
}
function onerror(){}		//错误处理函数
//回调函数
function deal(){
	document.getElementById("div_user").innerHTML=this.req.responseText;		//输出执行结果
}
function checkUser(str){
	if(str==""){
		document.getElementById("div_user").innerHTML="请输入病历号！";
	}else{
		var loader;
		loader=new net.AjaxRequest("checkName.jsp?num="+str+"&nocache="+new Date().getTime(),deal,onerror,"GET");
	}	
}
//验证用户名

function do_advise(){
	
	var adviseform = document.adviseform;
	var name = adviseform.name.value;
	var date = adviseform.date.value;
	var tel = adviseform.tel.value;
	var num = adviseform.num.value;
	var age = adviseform.age.value;
	var hun = adviseform.hun.value;
	var yuntime = adviseform.yuntime.value;
	var chantime = adviseform.chantime.value;
	var chanlater = adviseform.chanlater.value;
	var birth = adviseform.birth.value;
	var liutime = adviseform.liutime.value;
	var liulater = adviseform.liulater.value;
	var history = adviseform.history.value;
	var exhistory = adviseform.exhistory.value;
	var plan = adviseform.plan.value;
	var biyun = adviseform.biyun.value;
	var renshen = adviseform.renshen.value;
	var tingjing = adviseform.tingjing.value;
	var chufang = adviseform.chufang.value;
	var shijian = adviseform.shijian.value;
	var other = adviseform.other.value;
	var person = adviseform.person.value;
	var liuchan = adviseform.liuchan.value;
	var liudate = adviseform.liudate.value;
	var nibiyun = adviseform.nibiyun.value;
	//window.alert(username_hash);
	if(adviseform.name.value!="" && adviseform.num.value!=""){
		//window.alert(loginForm.user_name.value + "  " + loginForm.password.value);
		url="do_advise.jsp?name="+name+"&date="+date+"&tel="+tel+"&num="+num+"&age="+age+"&hun="+hun+"&yuntime="+yuntime+"&chantime="+chantime+"&chanlater="+chanlater+"&birth="+birth+"&liutime="+liutime+"&liulater="+liulater+"&history="+history+"&exhistory="+exhistory+"&plan="+plan+"&biyun="+biyun+"&renshen="+renshen+"&tingjing="+tingjing+"&liuchan="+liuchan+"&liudate="+liudate+"&nibiyun="+nibiyun+"&chufang="+chufang+"&shijian="+shijian+"&other="+other+"&person="+person;
		window.location.href = url;

	}else{
		alert("用户名或者病历号不能为空");
	}	
	
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
 
}

function liuChange(liu)
{
 if(liu.value=="0")
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

function chanToNow(chanlater)
{	
	var today = new Date();
	var chantonow = document.getElementById("chantonow");
	var chan = chalater.split("-");
	var year = chan[0];
	var month = chan[1];
	var i = (today.getFullYear()-year)*12+(toay.getMonth()-month);
	chantonow.value = i;
}
</script>

<script language="javascript" src="JS/AjaxRequest.js"></script>
<style type="text/css">    
 body{    
        
      background-repeat: repeat-x;    
 }    
 </style> 
<body>
<form method="post" action="do_advise.jsp" name="adviseform" id="Form1" method="post" accept-charset="utf-8">
  <table class="b-content">
    	<tr  id="r_table">
			<td height="34" colspan="2" bgcolor="#97CBFF">
				<div align="center" class="STYLE4">
					患者信息录入									
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
    	<%
    	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    	java.util.Date currTime = new java.util.Date();
    	String curTime = formatter.format(currTime);
    	%>
    	
    	<tr  id="r_table">
			<td height="20" colspan="2" bgcolor="#97CBFF">
				<div align="center" class="STYLE4">
					个人信息									
				</div>								
			</td>
		</tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>咨询日期</div></td>
      <td class="star">
      	<input name="date" type="text" size="30" value=<%=curTime %> onfocus="HS_setDate(this)" >
      	*
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>病历号</div></td>
      <td class="star">
      	<input name="num" type="text" size="30"  >
      	*
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="name" type="text" size="10">*</div>
      </td>

      <td class="r_cell_1"><div>联系电话&nbsp;&nbsp;<input name="tel" type="text" size="15">*</div>
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>年龄&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="age" type="text" size="10">*</div>
      </td>
      <td class="r_cell_1"><div>婚否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="hun" type="radio" value="1">
	       	是
        <input type="radio" name="hun" value="0">
       		否&nbsp;*</div>
       </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>户籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="huji">
        	<option value="0">本地城市</option>
          	<option value="1">本地农村</option>
          	<option value="2">外地城市</option>
          	<option value="3">外地农村</option>
        </select>*</div></td>
        <td class="r_cell_1"><div>职业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <select name="zhiye">
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
        </select>*</div></td>
    </tr>
    <tr id="r_table">
       <td class="r_cell_1">&nbsp;</td>
       <td>
       <input type="button" name="advise" value="保存" onClick = "do_advise()"/>
        <input type="reset" name="reset" value="清空">        </td>
    </tr>
    <tr  id="r_table">
			<td height="20" colspan="2" bgcolor="#82D900">
				<div align="center" class="STYLE4">
					基本病史									
				</div>								
			</td>
		</tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>停经<input name="tingjing" type="text" size="5">天</div></td>
      <td class="r_cell_1"><div>B超显示孕
      	<select name="Bchao"  style="width:75px" >
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
        </select>周</div>
      </td>
    </tr>
	<tr  id="r_table">
      <td class="r_cell_1"><div>拟选择的流产方式</div></td>
      <td>
        <input name="niliuchan" type="radio" value="1">
	       	手术
        <input type="radio" name="niliuchan" value="2">
       		药物
       </td>
    </tr>
	<tr  id="r_table">
      <td class="r_cell_1"><div>预约流产日期</div></td>
      <td><input name="liudate" type="text" size="20" onfocus="HS_setDate(this)">
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>孕&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="yuntime" type="text" size="5">次&nbsp;*</div></td>
      <td class="r_cell_1"><div>产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="chantime" style="width:100px" onchange="chanChange(this)">
			<option value="0"></option>
        	<option value="0">0</option>
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
        </select>次&nbsp;*</div></td>
    </tr>
    <tr  id="r_table" class="dischan" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;上次生产时间<input name="chanlater" id="chanlater" type="text" size="15" 
      		onfocus="HS_setDate(this)" onchange="chanToNow(this)">*</div>
      </td>
      <td class="r_cell_1"><div>距现在 &nbsp;&nbsp;&nbsp;<input name="chantonow" id="chantonow" type="text" size="5">月 </div>
      </td>
    </tr>
    <tr id="r_table" class="dischan" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;上次生产方式</div></td>
      <td>
        <input name="birth" type="radio" value="1">
	       	自然分娩
        <input type="radio" name="birth" value="2">
       		剖宫产 &nbsp;*
       </td>
    </tr>
    <tr id="r_table" class="dischan" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;目前是否在哺乳期</div></td>
      <td>
        <input name="buru" type="radio" value="1">
	       	是
        <input type="radio" name="buru" value="0">
       		否&nbsp;*
       </td>
    </tr>
    <tr id="r_table" class="dischan" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;是否有胎盘植入/胎盘粘连史</div></td>
      <td>
        <input name="zhiru" type="radio" value="1">
	       	是
        <input type="radio" name="zhiru" value="2">
       		否
       </td>
    </tr>
    
    <tr  id="r_table">
      <td class="r_cell_1"><div>既往人工流产次数</div></td>
      <td><div><select name="liutime" onchange="liuChange(this)">
      		<option value="0"></option>
        	<option value="0">0</option>
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
          	<option value="11">10次以上</option>
        </select>*</div>
      </td>
    </tr>   
    <tr  id="r_table" class="disliu" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;上次人工流产时间
      	<input name="liulater" type="text" size="10" onfocus="HS_setDate(this)"></div>
      </td>

      <td class="r_cell_1"><div>距现在&nbsp;&nbsp;&nbsp;
      	<input name="liutonow" type="text" size="5">月</div>
      </td>
    </tr>
    <tr  id="r_table" class="disliu" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;是否在过去1年内>=2次人工流产(不含本次)</div></td>
      <td>
        <input name="liu2" type="radio" value="1">
	       	是
        <input type="radio" name="liu2" value="0">
       		否
       </td>
    </tr>
    <tr  id="r_table" class="disliu" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;是否曾有子宫穿孔</div></td>
      <td>
        <input name="zigong" type="radio" value="1">
	       	是
        <input type="radio" name="zigong" value="0">
       		否
       </td>
    </tr>
    <tr  id="r_table" class="disliu" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;是否曾有宫腔粘连</div></td>
      <td>
        <input name="zhanlian" type="radio" value="1">
	       	是
        <input type="radio" name="zhanlian" value="0">
       		否
       </td>
    </tr>
    <tr  id="r_table" class="disliu" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;是否曾有宫颈阴道裂伤</div></td>
      <td>
        <input name="lieshang" type="radio" value="1">
	       	是
        <input type="radio" name="lieshang" value="0">
       		否
       </td>
    </tr>
    <tr  id="r_table" class="disliu" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;是否曾有宫外孕</div></td>
      <td>
        <input name="gongwai" type="radio" value="1">
	       	是
        <input type="radio" name="gongwai" value="0">
       		否
       </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>既往自然流产次数</div></td>
      <td><div><select name="ziranliutime">
      		<option value="0"></option>
        	<option value="0">0</option>
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
          	<option value="11">10次以上</option>
        </select>*</div>
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>现病史</div></td>
      <td>
      	<input type="checkbox" name="history" value="0"> 吸烟每天超过15支
      	<input type="checkbox" name="history" value="1"> 高血压<br/>
		<input type="checkbox" name="history" value="2"> 心脏病 
		<input type="checkbox" name="history" value="3"> 糖尿病
		<input type="checkbox" name="history" value="4"> 肝炎<br/>
		<input type="checkbox" name="history" value="5"> 脑血管意外
		<input type="checkbox" name="history" value="6"> 深静脉血栓<br/>
		<input type="checkbox" name="history" value="7"> 乳腺癌
		<input type="checkbox" name="history" value="8" onchange="historyChange(this)"> 其他
		<input type="checkbox" name="history" value="9"> 无
		</td>
    </tr>
    <tr  id="r_table"  class="dishistory" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;其他现病史</div></td>
      <td><input name="otherhistory" type="text" size="30">
      </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>既往史</div></td>
      <td>
      	<input type="checkbox" name="exhistory" value="0">高血压
      	<input type="checkbox" name="exhistory" value="1">心脏病
		<input type="checkbox" name="exhistory" value="2">糖尿病 <br/>
		<input type="checkbox" name="exhistory" value="5">深静脉血栓
		<input type="checkbox" name="exhistory" value="4">脑血管意外<br/>
		<input type="checkbox" name="exhistory" value="3">肝炎
		<input type="checkbox" name="exhistory" value="6">乳腺癌
		<input type="checkbox" name="exhistory" value="7" onchange="exhistoryChange(this)">其他
		<input type="checkbox" name="exhistory" value=8"> 无
    </tr>
	<tr  id="r_table" class="disexhistory" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;其他既往史</div></td>
      <td><input name="otherexhistory" type="text" size="30">
      </td>
    </tr>
    <tr id="r_table">
       <td class="r_cell_1">&nbsp;</td>
       <td>
       <input type="button" name="advise" value="保存" onClick = "do_advise()"/>
        <input type="reset" name="reset" value="清空">        </td>
    </tr>
	<tr  id="r_table">
			<td height="20" colspan="2" bgcolor="#82D900">
				<div align="center" class="STYLE4">
					避孕咨询								
				</div>								
			</td>
		</tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>未来生育计划时间</div></td>
      <td>
        <select name="plan">
        	<option value="0"></option>
          	<option value="1">半年内</option>
          	<option value="2">1年内</option>
          	<option value="3">1-2年</option>
          	<option value="4">3-5年</option>
        </select></td>
    </tr>
    
	<tr  id="r_table">
      <td class="r_cell_1"><div>本次妊娠原因</div></td>
      <td>
		<select name="renshen" style="width:150px" >
			<option value="0"></option>
        	<option value="1">未采取避孕方法</option>
          	<option value="2">避孕失败</option>
          	<option value="3">意愿妊娠</option>
        </select>
       </td>
    </tr>
	<tr  id="r_table">
      <td class="r_cell_1"><div>以往使用避孕方法</div></td>
      <td>
      	<input type="checkbox" name="biyun" value="0">避孕套
      	<input type="checkbox" name="biyun" value="1">紧急避孕药
		<input type="checkbox" name="biyun" value="2">安全期<br/>
		<input type="checkbox" name="biyun" value="5">体外排精
		<input type="checkbox" name="biyun" value="4">COC
		<input type="checkbox" name="biyun" value="3">IUD
		<input type="checkbox" name="biyun" value="6">皮埋<br/>
		<input type="checkbox" name="biyun" value="8" onchange="biyunChange(this)">其他
      </td>
    </tr>
	<tr  id="r_table" class="disbiyun" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;其他避孕方式</div></td>
      <td><input name="otherbiyun" type="text" size="30">
      </td>
    </tr>
    
    
	<tr  id="r_table">
      <td class="r_cell_1"><div>本次决定流产后避孕方式</div></td>
      <td>
		<select name="nibiyun" onchange="nibiyunChange(this)">
			<option value="0"></option>
        	<option value="1">COC</option>
          	<option value="2">IUD</option>
          	<option value="3">IUS</option>
          	<option value="4">避孕套</option>
          	<option value="5">皮埋</option>
          	<option value="6">绝育</option>
          	<option value="7">其他</option>
          	<option value="8">未决定</option>
        </select>
      </td>
    </tr>
    
    <tr  id="r_table" class="disnibiyun" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;其他流产后避孕方式</div></td>
      <td><input name="othernibiyun" type="text" size="30">
      </td>
    </tr>
    <tr  id="r_table" class="disCOC" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;开始使用时间</div></td>
		<td>
		<select name="shijian" onchange="lijiChange(this)">
			<option value="0"></option>
        	<option value="1">流产当日立即</option>
          	<option value="2">流产后2周</option>
          	<option value="3">首次恢复月经</option>
          	<option value="4">流产后1个月</option>
          	<option value="5">流产后2-3月</option>
        </select>		
       </td>
    </tr> 
    <tr  id="r_table" class="disIUD" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;放置时间</div></td>
		<td>
		<select name="fangzhi" onchange="lijiChange(this)">
			<option value="0"></option>
        	<option value="1">流产当日立即</option>
          	<option value="2">流产后2周</option>
          	<option value="3">首次恢复月经</option>
          	<option value="4">流产后1个月</option>
          	<option value="5">流产后2-3月</option>
        </select>		
       </td>
    </tr>
    <tr  id="r_table" class="disliji" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;未立即使用原因</div></td>
      <td><input name="weiliji" type="text" size="30">
      </td>
    </tr>
    <tr  id="r_table" class="disCOC" style="display:none">
      <td class="r_cell_1"><div>&nbsp;&nbsp;落实处方周期</div></td>
      <td>
        <input name="chufang" type="radio" value="1">
	       	1个月
        <input type="radio" name="chufang" value="2">
       		2个月
		<input type="radio" name="chufang" value="3">
       		3个月<br/>
		<input type="radio" name="chufang" value="4">
       		3个月以上
       </td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>相关合并情况</div></td>
      <td>
      	<input type="checkbox" name="other" value="0">月经紊乱
      	<input type="checkbox" name="other" value="1">月经过多
		<input type="checkbox" name="other" value="2">痛经<br/>
		<input type="checkbox" name="other" value="5">经前期综合征
		<input type="checkbox" name="other" value="4">盆腔炎<br/>
		<input type="checkbox" name="other" value="3">宫外孕
		<input type="checkbox" name="other" value="6">子宫内膜异位症<br/>
		<input type="checkbox" name="other" value="7">痤疮
		<input type="checkbox" name="other" value="8">无
		</td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div> 是否已向患者说明可能出现的不良反应</div></td>
      <td>
        <input name="buliang" type="radio" value="1">
	       	是
        <input type="radio" name="buliang" value="2">
       		否
       </td>
    </tr>
   	<tr  id="r_table">
      <td class="r_cell_1"><div> 是否已指导患者使用</div></td>
      <td>
        <input name="zhidao" type="radio" value="1">
	       	是
        <input type="radio" name="zhidao" value="2">
       		否
       </td>
    </tr>
	
	<tr  id="r_table">
      <td class="r_cell_1"><div>其他咨询内容</div></td>
      <td><input name="otherzixun" type="text" size="30">
      </td>
    </tr>
	<tr id="r_table">
      <td class="r_cell_1"><div>咨询员署名</div></td>
      <td><input name="person" type="text" size="30">
      </td>
    </tr>
	
	 <tr id="r_table">
       <td class="r_cell_1">&nbsp;</td>
       <td>
       <input type="button" name="advise" value="保存" onClick = "do_advise()"/>
        <input type="reset" name="reset" value="清空">        </td>
    </tr>
  </table>
 </form>
</body>
</HTML>