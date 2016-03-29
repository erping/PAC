<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="selectall" scope="page" class="PAC.ConnDB"></jsp:useBean>
<%  int CountPage = 0;
	int CurrPage = 1;
	int PageSize = 10;
	int CountRow = 0;
	//request.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("utf-8");
	String dateBegin="";
	if(request.getParameter("dateBegin")!=null){
		dateBegin=request.getParameter("dateBegin");
		selectall.dateBegin = dateBegin;}
	String dateEnd="";
	
	if(request.getParameter("dateEnd")!=null){
		dateEnd=request.getParameter("dateEnd");
		selectall.dateEnd = dateEnd;}
	%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%String shuming = request.getParameter("shuming"); %>
		<title>患者信息列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

 		<link rel="stylesheet" href="public/css/reset.css" type="text/css">
        <link rel="stylesheet" href="public/css/default.css" type="text/css">
        <link rel="stylesheet" href="public/css/style.css" type="text/css">

        <link type="text/css" rel="stylesheet" href="libraries/syntaxhighlighter/public/css/shCoreDefault.css">

        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/XRegExp.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shCore.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shLegacy.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shBrushJScript.js"></script>
        <script type="text/javascript" src="libraries/syntaxhighlighter/public/javascript/shBrushXml.js"></script>

        <script type="text/javascript">
            SyntaxHighlighter.defaults['toolbar'] = false;
            SyntaxHighlighter.all();
        </script>
<style type="text/css">
<!--
body,table{
    font-size:16px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
}
td{
    height:22px;
}
h1,h2,h3{
    font-size:14px;
    margin:0;
    padding:0;
}

.title { background: #FFF; border: 1px solid #9DB3C5; padding: 1px; width:90%;margin:20px auto; }
    .title h1 { line-height: 31px; text-align:center;  background: #2F589C url(th_bg2.gif); background-repeat: repeat-x; background-position: 0 0; color: #FFF; }
        .title th, .title td { border: 1px solid #CAD9EA; padding: 5px; }


table.t1{
    border:1px solid #cad9ea;
}
table.t1 th {
    background-image: url(th_bg1.gif);
    background-repeat::repeat-x;
    height:40px;
    font-size: 16px;
	font-weight: bold;
}
table.t1 td,table.t1 th{
    border:1px solid #cad9ea;
    padding:0 1em 0;
}
table.t1 tr.a1{
    background-color:#f5fafe;
}



table.t2{
    border:1px solid #9db3c5;
}
table.t2 th {
    background-image: url(th_bg2.gif);
    background-repeat::repeat-x;
    height:30px;
    color:#aaaaaa;
}
table.t2 td{
    border:1px dotted #cad9ea;
    padding:0 2px 0;
}
table.t2 th{
    border:1px solid #a7d1fd;
    padding:0 2px 0;
}
table.t2 tr.a1{
    background-color:#e8f3fd;
}



table.t3{
    border:1px solid #fc58a6;
    color:#720337;
}
table.t3 th {
    background-image: url(th_bg3.gif);
    background-repeat::repeat-x;
    height:30px;
    color:#35031b;
}
table.t3 td{
    border:1px dashed #feb8d9;
    padding:0 1.5em 0;
}
table.t3 th{
    border:1px solid #b9f9dc;
    padding:0 2px 0;
}
table.t3 tr.a1{
    background-color:#fbd8e8;
}
.input_on{ 
padding:2px 8px 0pt 3px; 
height:18px; 
border:1px solid #999; 
background-color:#FFFFCC; 
} 
.input_off{ 
padding:2px 8px 0pt 3px; 
height:18px; 
border:1px solid #CCC; 
background-color:#FFF; 
} 
.input_move{ 
padding:2px 8px 0pt 3px; 
height:18px; 
border:1px solid #999; 
background-color:#FFFFCC; 
} 
.input_out{ 
/*height:16px;默认高度*/ 
padding:2px 8px 0pt 3px; 
height:18px; 
border:1px solid #CCC; 
background-color:#FFF; 
} 

a.Channel1:link {color: #ff0000;text-decoration: underline;} /*未访问的链接 */
a.Channel1:visited {color: #ff0000;text-decoration: underline;} /*已访问的链接*/
a.Channel1:hover{color: #ff0000;text-decoration: underline;} /*鼠标在链接上 */
a.Channel1:active {color: #ff0000;text-decoration:underline;} /*点击激活链接*/
-->
</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
<script type="text/javascript">
    function ApplyStyle(s){
        document.getElementById("mytab").className=s.innerText;
    }
</script>
<script language="javascript">
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
alertFram.style.marginTop = -75+document.documentElement.scrollTop+"px";
alertFram.style.width = "400px";
alertFram.style.height = "225px";
alertFram.style.background = "#ccc";
alertFram.style.textAlign = "center";
alertFram.style.lineHeight = "20px";
alertFram.style.zIndex = "10001";
strHtml   = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";
strHtml += " <li style=\"background-image:url(Images/alert.png);text-align:center;font-size:12px;height:223px;border-left:0px solid #F9CADE;border-right:0px solid #F9CADE;\"><br/><br/>"+txt+"<br/><br/><input type=\"image\" id=\"do_OK\" src=\"Images/sure.jpg\" onClick=\"doOk()\"/></li>\n";
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

function do_search(){
	
	var searchform = document.search;
	var dateBegin = searchform.dateBegin.value;
	var dateEnd = searchform.dateEnd.value;
	var gaowei = searchform.gaowei.value;
	var search = searchform.search.value;
	var shuming  = "<%=shuming%>";
	/*
	if(search!="")
	{
		*/
		var url = "patient_page.jsp?dateBegin="+dateBegin+"&dateEnd="+dateEnd+"&gaowei="+gaowei
				+"&search="+search+"&shuming="+shuming;
		window.location.href = url;
		/*
	}
	else{
		alert("请输入搜索条件");
	}*/
}
</script>
<body>


	    <table border="0" align="center" cellpadding="0" cellspacing="0" >
          <tr>
            <td align="center" valign="top">
		
			  <table  border="0" cellpadding="0" cellspacing="0"
				bordercolor="#FFFFFF" bordercolordark="#999999"
				bordercolorlight="#FFFFFF">
				<tr>
					<td colspan="2">

					
  <form name="search"  method="post" accept-charset="utf-8">
  <table class="b-content">
    	<tr  id="r_table">
			<td height="34" colspan="5" bgcolor="#97CBFF">
				<img width="601" height="29" src="Images/search2.jpg"/>								
			</td>
		</tr>

    	
    <tr  id="r_table" height="40">
      <td><div><input name="dateBegin" type="text" size="15" id="datepicker-example1">至</div>
      </td>
      <td><div><input name="dateEnd" type="text" size="15" id="datepicker-example14">&nbsp;&nbsp;&nbsp;</div>
      </td>
      <td><div><select name="gaowei" >
      		<option value="3"></option>
          	<option value="1">高危</option>
          	<option value="2">重点</option>
          	<option value="0">普通</option>
        </select></div>
      </td>
      <td><div><input name="search" type="text" size="15"></div>
      </td>
      <td>
      <input type="image" name="advise" width="55" height="30" src="Images/search.jpg" onClick="do_search()"/>
        </td>
    </tr>

  </table>
 </form>

<div >
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="advise.jsp?shuming=<%=shuming%>"><img width="121" height="42" src="Images/xinjianzixun3.jpg"/></a>
</div>
<div class="title">
    <img width="1229" height="48" src="Images/list.jpg"/>	
</div>
<form action="patient_page.jsp" method="post" name="frm" onSubmit="checkdel(frm.delid,frm)">
<table width="90%" id="mytab"  border="1" class="t1">
  <thead>
  	<th width="10%">流产日期</th>
  	<th width="5%">高危</th>
    <th width="5%">重点</th>
    <th width="10%">病历号</th>
    <th width="10%">患者姓名</th>
    <th width="10%">电话</th>
    <th width="10%">首次随访</th>
    <th width="10%">三个月随访</th>
	<th width="10%">六个月随访</th>
	<th width="10%">十二个月随访</th>
    
  </thead>
<%	request.setCharacterEncoding("utf-8");
	String StrPage = request.getParameter("Page");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	  java.util.Date currTime = new java.util.Date();
	  String curTime = formatter.format(currTime);
	if(StrPage==null){
		CurrPage = 1;
	}else{
		CurrPage = Integer.parseInt(StrPage);
	}
  	
	dateBegin="";
	if(request.getParameter("dateBegin")!=null){
		dateBegin=request.getParameter("dateBegin");}
	dateEnd="";
	if(request.getParameter("dateEnd")!=null){
		dateEnd=request.getParameter("dateEnd");}
	String gaowei="";
	if(request.getParameter("gaowei")!=null){
		gaowei=request.getParameter("gaowei");}
	String search="";
	if(request.getParameter("search")!=null){
		search=request.getParameter("search");}
  	String SQL1= "";
  	/*
  	if(dateBegin!="")
  		SQL1+=" liudate>='"+dateBegin+"' and ";
  	if(dateEnd!="")
  		SQL1+=" liudate<='"+dateEnd+"' and ";
  	if(gaowei.equals("1"))
  		SQL1+=" gaowei='"+gaowei+"' and ";
  	else if(gaowei.equals("2"))
  		SQL1+=" gaowei>1 and ";
  	else if(gaowei.equals("0")){
  		SQL1+=" gaowei='0' and ";
  	}
  	if(search!=""){
  		SQL1+="( name like '%"+search+"%' or num like '%"+search+"%' or tel like '%"+search+"%' ) ";}
  	*/
  	// 修改查询语句，支持模糊搜索
  	if(dateBegin!="")
  	{
  		SQL1+=" liudate>='"+dateBegin+"' and ";
  		SQL1+="  liudate<='"+dateEnd+"'  ";
  		if(gaowei.equals("1"))
  			SQL1+="and gaowei>1 ";
  		//	SQL1+=" and gaowei='"+gaowei+"'  ";
  		else if(gaowei.equals("2"))
  			SQL1+="and gaowei=1 ";
  		//	SQL1+="and gaowei='"+gaowei+"' ";
  		//	SQL1+="and  gaowei>1 ";
  		else if(gaowei.equals("0"))
  			SQL1+=" and gaowei='0' ";
  		if(search!="")
  			SQL1+=" and ( name like '%"+search+"%' or num like '%"+search+"%' or tel like '%"+search+"%' ) ";
	}
	else if(gaowei!="")
	{
		if(gaowei.equals("1"))
  			SQL1+=" gaowei>1 ";
  		else if(gaowei.equals("2"))
  			SQL1+=" gaowei=1 ";
  		else if(gaowei.equals("0"))
  			SQL1+=" gaowei='0' ";
		if(search!="")
			SQL1+=" ( name like '%"+search+"%' or num like '%"+search+"%' or tel like '%"+search+"%' ) ";
	}
	else
	{
		if(search!="")
  			SQL1+=" ( name like '%"+search+"%' or num like '%"+search+"%' or tel like '%"+search+"%' ) ";
	
	}
  	
  	String SQL="select * from patient_info ";
  	String SQL2="select * from patient_info ";
  	if(!SQL1.equals(""))
  	{
  		SQL2+= " where "+SQL1;
  	}else {
  		SQL2+=" ";
  	}
  	System.out.println(SQL2);
	ResultSet Rs = selectall.executeQuery(SQL2);
	Rs.last();
	int i=0;
	CountRow = Rs.getRow();
	CountPage = (CountRow/PageSize);
	if(CountRow%PageSize>0)
		CountPage++;
	Integer n = (CurrPage-1)*PageSize+1;
	
	
	if(!SQL1.equals(""))
  	{
  		SQL+= " where "+SQL1;
  	}else {
  		SQL+=" ";
  	}
	
	if(CurrPage==CountPage){
		SQL += "order by liudate desc,gaowei desc limit "+PageSize*(CurrPage-1)+","+CountRow;
	}
	else{
		SQL += "order by liudate desc,gaowei desc limit "+PageSize*(CurrPage-1)+","+CurrPage*PageSize;
	}
	//SQL += " order by liudate desc,gaowei desc limit "+PageSize;
	//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
	System.out.println(SQL);
	Rs = selectall.executeQuery(SQL);
	while(Rs.next()){ 	
%>
<tr class="a1">
	<td nowrap><%=Rs.getString("liudate")%></td>
	<td align="center">
	<%if(Rs.getString("gaowei").equals("2")){ %>
			<img width="14" height="19" src="Images/smalll.jpg"/>
			<%}
				else if(Rs.getString("gaowei").equals("3")){ %>
			<img width="14" height="19" src="Images/smalll.jpg"/><img width="14" height="19" src="Images/smalll.jpg"/>
			<%} 
				else if(Integer.valueOf(Rs.getString("gaowei").toString()).intValue()>=4){ %>
			<img width="14" height="19" src="Images/smalll.jpg"/><img width="14" height="19" src="Images/smalll.jpg"/><img width="14" height="19" src="Images/smalll.jpg"/>
			<%} %>
	</td>
	<td align="center">
	<%if(Rs.getString("gaowei").equals("1")){ %>
	<img width="14" height="19" src="Images/smalll.jpg"/>
	<%} %></td>
	<td nowrap><a href="single_patient.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient" ><%=Rs.getString("num")%></a></td>
	<td nowrap><%=Rs.getString("name")%></td>
	<td nowrap><%=Rs.getString("tel")%></td>
	<%
	String complete = "select * from daisuifang where num='"+Rs.getString("num")+"' and time='"+1+"'";
	ResultSet rs_c = selectall.executeQuery(complete);
	rs_c.next();
	if(rs_c.getString("complete").equals("0")){ %>
	<td align="center" style="color:red"><a class="Channel1" href="first_suifang.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient"><%=rs_c.getString("begin") %></a></td>
	<%}else if(rs_c.getString("complete").equals("1")){ %>
	<td align="center" style="color:red"><a class="Channel1" href="first_suifang.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient"><%=rs_c.getString("begin") %>未联系上</a></td>
	<%}else if(rs_c.getString("end").compareTo(curTime)<0){ %>
	<td align="center">失访</td>
	<%}else{ %>
	<td align="center"><%=rs_c.getString("complete") %></td>
	<%} %>
	<%
	String complete3 = "select * from daisuifang where num='"+Rs.getString("num")+"' and time='"+3+"'";
	ResultSet rs_c3 = selectall.executeQuery(complete3);
	rs_c3.next();
	if(rs_c3.getString("complete").equals("0")){ %>
	<td align="center"  style="color:red"><a class="Channel1" href="zhongyuan.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient"><%=rs_c3.getString("begin") %></a></td>
	<%}else if(rs_c3.getString("complete").equals("1")){ %>
	<td align="center"  style="color:red"><a class="Channel1" href="zhongyuan.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient"><%=rs_c3.getString("begin") %>未联系上</a></td>
	<%}else if(rs_c3.getString("end").compareTo(curTime)<0){ %>
	<td align="center">失访</td>
	<%}else{ %>
	<td align="center"><%=rs_c3.getString("complete") %></td>
	<%} %>
	<%
	String complete6 = "select * from daisuifang where num='"+Rs.getString("num")+"' and time='"+6+"'";
	ResultSet rs_c6 = selectall.executeQuery(complete6);
	rs_c6.next();
	if(rs_c6.getString("complete").equals("0")){ %>
	<td align="center"  style="color:red"><a class="Channel1" href="zhongyuan6.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient"><%=rs_c6.getString("begin") %></a></td>
	<%}else if(rs_c6.getString("complete").equals("1")){ %>
	<td align="center"  style="color:red"><a class="Channel1" href="zhongyuan6.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient"><%=rs_c6.getString("begin") %>未联系上</a></td>
	<%}else if(rs_c6.getString("end").compareTo(curTime)<0){ %>
	<td align="center">失访</td>
	<%}else{ %>
	<td align="center"><%=rs_c6.getString("complete") %></td>
	<%} %>
	<%
	String complete12 = "select * from daisuifang where num='"+Rs.getString("num")+"' and time='"+12+"'";
	ResultSet rs_c12 = selectall.executeQuery(complete12);
	rs_c12.next();
	if(rs_c12.getString("complete").equals("0")){ %>
	<td align="center"  style="color:red"><a class="Channel1" href="zhongyuan12.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient"><%=rs_c12.getString("begin") %></a></td>
	<%}else if(rs_c12.getString("complete").equals("1")){ %>
	<td align="center"  style="color:red"><a class="Channel1" href="zhongyuan12.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient"><%=rs_c12.getString("begin") %>未联系上</a></td>
	<%}else if(rs_c12.getString("end").compareTo(curTime)<0){ %>
	<td align="center">失访</td>
	<%}else{ %>
	<td align="center"><%=rs_c12.getString("complete") %></td>
	<%} %>
	
</tr>
<%
	}
	selectall.closeConnection();
%>
<tr class="a1">
	<td colspan="10" align="center">
	<div>
		[<%=CurrPage%>/<%=CountPage%>] 每页10条 共<%=CountRow%>条记录
	</div>
	</td>

	</tr>
	<tr class="a1">
		<td colspan="10" align="center">
		<div align="center">
			<a href="patient_page.jsp?shuming=<%=shuming%>&dateBegin=<%=dateBegin%>&dateEnd=<%=dateEnd%>&gaowei=<%=gaowei%>&search=<%=search%>"><img width="100" height="20" src="Images/top.jpg"/></a>
			<%	
								if (CurrPage > 1) {
							%>
							<a href="patient_page.jsp?Page=<%=CurrPage-1%>&dateBegin=<%=dateBegin%>&dateEnd=<%=dateEnd%>&gaowei=<%=gaowei%>&search=<%=search%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/front.jpg"/></a>
							<%
								}
							%>
							<%
								if (CurrPage < CountPage) {
							%>
							<a href="patient_page.jsp?Page=<%=CurrPage + 1%>&dateBegin=<%=dateBegin%>&dateEnd=<%=dateEnd%>&gaowei=<%=gaowei%>&search=<%=search%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/next.jpg"/></a>
							<%
								}
							%>
							<a href="patient_page.jsp?Page=<%=CountPage%>&dateBegin=<%=dateBegin%>&dateEnd=<%=dateEnd%>&gaowei=<%=gaowei%>&search=<%=search%>&shuming=<%=shuming%>"><img width="100" height="20" src="Images/last.jpg"/></a>
		</div>
		</td>
		
	</tr>
 </table>
</form> 
 </td>
	</tr>
</table>
		</td>
</table>
<br/><br/>
<table width="1200">
	<tr >
		<td align="right"><a href="test2.jsp?shuming=<%=shuming%>"><img width="60" height="30" src="Images/back.jpg"/></a></td>
	</tr>
</table>
 	<script type="text/javascript" src="public/javascript/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="public/javascript/zebra_datepicker.src.js"></script>
        <script type="text/javascript" src="public/javascript/core.js"></script>
</body>
</html>
