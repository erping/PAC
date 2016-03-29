<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
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
padding-top: 10px;
padding-bottom: 3px;
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
margin-right: 10px;
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
	 if (typeof(date)=="string"){var date = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2])}
	 if (typeof(date)=="object"){var date = date}
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
	 if (year%4==0){enddate[1]="29"}
	 if (date>enddate[month]){returnDate = enddate[month]}else{returnDate = date}
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

	 var now;
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
		var loader=new net.AjaxRequest("checkName.jsp?num="+str+"&nocache="+new Date().getTime(),deal,onerror,"GET");
	}	
}
//验证用户名
</script>
<script language="javascript" src="JS/AjaxRequest.js"></script>

<% String name=request.getParameter("shuming");%>
	<frameset cols="15%,*" >
             <frame name="left" src="left.jsp?shuming=<%=name%>"/> 
             <frame name="right" src="setting2.jsp?shuming=<%=name%>"/>
                </frameset>   
                <body>
</body>
</HTML>