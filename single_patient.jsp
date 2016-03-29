<%@ page contentType="text/html" autoFlush="false" buffer="3000kb" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
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
font-size: 12px;
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

	<title>患者个人信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% String method=request.getParameter("method");%>
<body onload="reWin()">
	<table class="b-content">
    <form name="form1" method="post" border="solid#456 1px">
	    <tr  id="r_table">
			<td colspan="4" >
				<div align="center" class="STYLE4">
					<img width="1335" height="33" src="Images/1.jpg"/>						
				</div>								
			</td>
		</tr>
    	<tr  id="r_table">
    		<td height="34" colspan="4">
    		<div align="center" class="STYLE4">
					<font size="2px" color="red">保护隐私是我们的责任，病人所有资料保密，任何人不得外泄或窃取！</font>								
			</div>	
			</td>
    	</tr>
    	<tr>
    		<td  colspan="4" align="right">
    			<input type="button" value=""  style=" width:60px; height:30px; border:0; background:url(Images/back.jpg) no-repeat " onClick = "do_back('<%=method%>')"/>
			</td>
    	</tr>
	<Script language="javascript">
		var Request = new Object();
		Request = GetRequest();
		var num,name;
		num = Request['num'];
		name = Request['name'];
		function do_back(method){
			var url = "";
			if(method=="patient")
				url = "patient_page.jsp?shuming=<%=request.getParameter("shuming")%>";
			else if(method=="suifang")
				url = "daisuifang_n.jsp?shuming=<%=request.getParameter("shuming")%>";
			window.location.href = url;
		}
	</Script>
	<%
	String shuming = request.getParameter("shuming");
		String num = request.getParameter("num");
		String SQL = "select * from patient_info where num='"+num.toString()+"'";
		//SQL = "select * from pre_forum_forum order by fid asc limit 5 where fid>= "+"("+"Select MAX(fid) From (Select * From pre_forum_forum order by fid in asc limit "+n.toString()+") as Class )";
		ResultSet Rs = dao.executeQuery(SQL);	
		Rs.next();
		
		String SQL1 = "select * from first_suifang where num='"+num+"'";
		ResultSet Rs1 = dao.executeQuery(SQL1);	
		String SQL3 = "select * from zhongyuan where num='"+num+"'";
		ResultSet Rs3 = dao.executeQuery(SQL3);
		String SQL6 = "select * from zhongyuan6 where num='"+num+"'";
		ResultSet Rs6 = dao.executeQuery(SQL6);
		String SQL12 = "select * from zhongyuan12 where num='"+num+"'";
		ResultSet Rs12 = dao.executeQuery(SQL12);
	%>
	<!-- 个人信息 -->
	<tr id="r_table">
			<td  colspan="4">
					<img width="1335" height="33" src="Images/2.jpg"/>							
			</td>
		</tr>
	<tr  id="r_table">
      	<td class="r_cell_1"><div>咨询日期:
      		<input name="date" type="text" size="10" value=<%=Rs.getString("date")%> readonly="true"  style="border-style:none">
      		</div>
      	</td>
      	<td class="r_cell_1"><div>病历号:
      		<input name="num" type="text" size="15" value=<%=Rs.getString("num")%> readonly="true" style="border-style:none">
      </div></td>
      	<td class="r_cell_1"><div>姓名:
      		<input name="name" type="text" size="10" value=<%=Rs.getString("name")%> readonly="true"  style="border-style:none">
      	</div></td>
      <td class="r_cell_1"><div>联系电话:
      		<input name="tel" type="text" size="15" value=<%=Rs.getString("tel")%> readonly="true" style="border-style:none">
      </div></td>
      
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>年龄:
      		<input name="age" type="text" size="10" value=<%=Rs.getString("age")%> readonly="true" style="border-style:none">
      </div></td>
      <%
			String hun;
			if(Rs.getString("hun").equals("1"))
				hun="已婚";
			else{
				hun="未婚";
			 }
		%>
      <td class="r_cell_1"><div>婚否:
      		<input name="hun" type="text" size="10" value=<%=hun%> readonly="true" style="border-style:none">
      </div></td>
      <%
			String huji;
			if(Rs.getString("huji").equals("0"))
				huji="本地城市";
			else if(Rs.getString("huji").equals("1"))
				huji="本地农村";
			else if(Rs.getString("huji").equals("2"))
				huji="外地城市";
			else if(Rs.getString("huji").equals("3"))
				huji="外地农村";
			else{
				huji="未填写";
			 }
		%>
      <td class="r_cell_1"><div>户籍:
      		<input name="huji" type="text" size="10" value=<%=huji%> readonly="true" style="border-style:none">
      </div></td>
      <%
			String zhiye;
			if(Rs.getString("zhiye").equals("0"))
				zhiye="公司职员";
			else if(Rs.getString("zhiye").equals("1"))
				zhiye="公务员";
			else if(Rs.getString("zhiye").equals("2"))
				zhiye="教师/科研人员";
			else if(Rs.getString("zhiye").equals("3"))
				zhiye="商业服务人员";
			else if(Rs.getString("zhiye").equals("4"))
				zhiye="个体经营";
			else if(Rs.getString("zhiye").equals("5"))
				zhiye="学生";
			else if(Rs.getString("zhiye").equals("6"))
				zhiye="家政服务";
			else if(Rs.getString("zhiye").equals("7"))
				zhiye="待业/退休";
			else if(Rs.getString("zhiye").equals("8"))
				zhiye="工人";
			else if(Rs.getString("zhiye").equals("9"))
				zhiye="农民";
			else if(Rs.getString("zhiye").equals("10"))
				zhiye="其他";
			else{
				zhiye="未填写";
			 }
		%>
      <td class="r_cell_1"><div>职业:
      		<input name="zhiye" type="text" size="10" value=<%=zhiye%> readonly="true" style="border-style:none">
      </div></td>
    </tr>
    <!-- 基本病史 -->
    <tr  id="r_table">
			<td height="34" colspan="4" bgcolor="#ffffff">
               <img width="1335" height="33" src="Images/jibengbingshi1335x30.jpg">							
			</td>
		</tr>
	<tr id="r_table">
	<%
			String yuanyin_t;
			if(Rs.getString("yuanyin").equals("1"))
				yuanyin_t="意愿妊娠";
			else{
				yuanyin_t="非意愿妊娠";
			 }
		%>
	 <td class="r_cell_1"><div>本次妊娠原因:</div></td>
      <td colspan="1">
      		<input name="yuanyin" type="text" size="10" value=<%=yuanyin_t%> readonly="true" style="border-style:none">
      	</td>
	<%
		if(yuanyin_t.equals("非意愿妊娠")){
			String renshen_t;
			if(Rs.getString("renshen").equals("1"))
				renshen_t="未采取避孕方法";
			else if(Rs.getString("renshen").equals("2"))
				renshen_t="避孕失败";
			 else
			 	renshen_t="未填写";
			
		%>
		 <td class="r_cell_1"><div>本次非意愿妊娠原因:</div></td>
      <td colspan="1">
      		<input name="renshen" type="text" size="10" value=<%=renshen_t%> readonly="true" style="border-style:none">
      	</td>
		
		<%		
		}
	%>	
		
	</tr>

	<tr  id="r_table">
	<%
		String tingjing;
		if(Rs.getString("tingjing").equals(""))
			tingjing="未填写";
		else
			tingjing=Rs.getString("tingjing");
	%>

      <td class="r_cell_1"><div>停经天数:
      		<input name="tingjing" type="text" size="10" value=<%=tingjing%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>B超显示孕周:
      		<input name="Bchao" type="text" size="10" value=<%=Rs.getString("Bchao")%> readonly="true" style="border-style:none">
      	</div></td>
      	</tr>
	<tr  id="r_table">
      	 <%
			String niliuchan;
			if(Rs.getString("niliuchan").equals("1"))
				niliuchan="门诊手术";
			else if(Rs.getString("niliuchan").equals("2"))
				niliuchan="门诊药物";
			else{
				niliuchan="住院手术";
			 }
		%>
      <td class="r_cell_1"><div>拟选择流产方式:
      		<input name="niliuchan" type="text" size="10" value=<%=niliuchan%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>预约流产日期:
      		<input name="liudate" type="text" size="10" value=<%=Rs.getString("liudate")%> readonly="true" style="border-style:none">
      </div></td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>怀孕次数:
      		<input name="yuntime" type="text" size="10" value=<%=Rs.getString("yuntime")%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>生产次数:
      		<input name="chantime" type="text" size="10" value=<%=Rs.getString("chantime")%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>既往人工流产次数:
      		<input name="liutime" type="text" size="10" value=<%=Rs.getString("liutime")%> readonly="true" style="border-style:none">
      </div></td>
      
    </tr>
    <%String chantime = Rs.getString("chantime");
    if(Integer.valueOf(chantime).intValue()>0){ %>
    <tr  id="r_table">
    	<td class="r_cell_1"><div>上次生产时间:
      		<input name="chanlater" type="text" size="10" value=<%=Rs.getString("chanlater")%> readonly="true" style="border-style:none">
      	</div></td>
      	<td class="r_cell_1"><div>距现在:
      		<input name="chantonow" type="text" size="1" value=<%=Rs.getString("chantonow")%> readonly="true" style="border-style:none">个月
      	</div></td>
      	<td class="r_cell_1"><div>上次生产方式:
      	<%
			String birth;
			if(Rs.getString("birth").equals("1"))
				birth="自然分娩";
			else{
				birth="剖宫产";
			 }
		%>
      		<input name="birth" type="text" size="10" value=<%=birth%> readonly="true" style="border-style:none">
      	</div></td>
      
    </tr>
    <tr  id="r_table">
    	<%
			String buru;
			if(Rs.getString("buru").equals("1"))
				buru="是";
			else{
				buru="否";
			 }
		%>
      <td class="r_cell_1"><div>是否在哺乳期:
      		<input name="buru" type="text" size="10" value=<%=buru%> readonly="true" style="border-style:none">
      	</div></td>
      	<%
			String zhiru;
			if(Rs.getString("zhiru").equals("1"))
				zhiru="是";
			else{
				zhiru="否";
			 }
		%>
      
      </tr>
      <%} %>
      <%String liutime = Rs.getString("liutime");
    if(Integer.valueOf(liutime).intValue()>0){ %>
    <tr  id="r_table">
      <td class="r_cell_1"><div>上次人工流产时间:
      		<input name="liulater" type="text" size="10" value=<%=Rs.getString("liulater")%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>距现在:
      		<input name="liutonow" type="text" size="1" value=<%=Rs.getString("liutonow")%> readonly="true" style="border-style:none">个月
      </div></td>
    <%
			String liu2;
			if(Rs.getString("liu2").equals("1"))
				liu2="是";
			else{
				liu2="否";
			 }
		%>
      <td class="r_cell_1"><div> 是否在过去1年内>=2次人工流产:
      		<input name="liu2" type="text" size="5" value=<%=liu2%> readonly="true" style="border-style:none">
      </div></td>
      <%
			String zigong;
			if(Rs.getString("zigong").equals("1"))
				zigong="是";
			else{
				zigong="否";
			 }
		%>
      
      	</tr>
    <tr  id="r_table">
      	<%
			String zhanlian;
			if(Rs.getString("zhanlian").equals("1"))
				zhanlian="是";
			else{
				zhanlian="否";
			 }
		%>
      
      <%
			String lieshang;
			if(Rs.getString("lieshang").equals("1"))
				lieshang="是";
			else{
				lieshang="否";
			 }
		%>
      
    <%
			String qitagaowei;
			if(Rs.getString("qitagaowei").equals("1"))
				qitagaowei="是";
			else{
				qitagaowei="否";
			 }
		%>
      <td class="r_cell_1"><div>是否有其他高危:
      		<input name="qitagaowei" type="text" size="10" value=<%=qitagaowei%> readonly="true" style="border-style:none">
      </div></td>
      </tr>
      <%} %>
    <tr  id="r_table">
    <%String history=Rs.getString("history");
    String history_t="  ";
    if(history.equals("9"))
    	history_t = "未选择";
    if(history.contains("1"))
    	history_t+="心肝肾疾病,";
    if(history.contains("2"))
    	history_t+="激素依赖性肿瘤,";
    if(history.contains("3"))
    	history_t+="静脉血栓,";
    if(history.contains("4"))
    	history_t+="药物过敏,";
    if(history.contains("0"))
    	history_t="无";
    %>
	
      <td class="r_cell_1"><div>现病史及既往史:</div></td>
      <td colspan="1">
      		<input name="history" type="text" size="30" value=<%=history_t%> readonly="true" style="border-style:none">
      	</td>
    <%if(history.contains("9")) {%>
      <td class="r_cell_1"><div>其他病史:</div></td>
      <td><div>
      		<input name="otherhistory" type="text" size="10" value=<%=Rs.getString("otherhistory")%> readonly="true" style="border-style:none">
      </div></td>
      <%} %>
    </tr>
  <!-- 避孕咨询 -->
	 <tr  id="r_table">
			<td colspan="4">
				<div align="center" class="STYLE4">
					<img width="1335" height="33" src="Images/4.jpg"/>						
				</div>								
			</td>
		</tr>
    <tr  id="r_table">
        <%
			String plan;
			if(Rs.getString("plan").equals("1"))
				plan="半年内";
			else if(Rs.getString("plan").equals("2"))
				plan="1年内";
			else if(Rs.getString("plan").equals("3"))
				plan="1-2年";
			else if(Rs.getString("plan").equals("4"))
				plan="3-5年";
			else{
				plan="无";
			 }
		%>
        <td><div>生育计划：
        	<input name="plan" type="text" size="10" value=<%=plan%> readonly="true" style="border-style:none">
        </div></td>
   
       <%
			String biyun = Rs.getString("biyun");
       String biyun_t="";
       if(biyun.equals("7"))
       		biyun_t = "未选择";
       if(biyun.contains("0"))
    	   biyun_t+="避孕套,";
       if(biyun.contains("1"))
    	   biyun_t+="紧急避孕药,";
       if(biyun.contains("2"))
    	   biyun_t+="安全期,";
       if(biyun.contains("3"))
    	   biyun_t+="体外排精,";
       if(biyun.contains("4"))
    	   biyun_t+="COC,";
       if(biyun.contains("5"))
    	   biyun_t+="IUD,";
       if(biyun.contains("6"))
    	   biyun_t+="皮埋,";
       %>
        <td><div>以往避孕方法：
        	<input name="biyun" type="text" size="30" value=<%=biyun_t%> readonly="true" style="border-style:none">
        	</div></td>
      <% if(biyun.contains("7")) {%>
      <td><div>其他避孕方式：<input name="otherbiyun" type="text" size="10" value=<%=Rs.getString("otherbiyun")%> readonly="true" style="border-style:none">
      </div>
      </td>
      <%} %>
    
          <%
			String nibiyun;
			if(Rs.getString("nibiyun").equals("1"))
				nibiyun="COC";
			else if(Rs.getString("nibiyun").equals("2"))
				nibiyun="IUD";
			else if(Rs.getString("nibiyun").equals("3"))
				nibiyun="IUS";
			else if(Rs.getString("nibiyun").equals("4"))
				nibiyun="避孕套";
			else if(Rs.getString("nibiyun").equals("5"))
				nibiyun="皮埋";
			else if(Rs.getString("nibiyun").equals("6"))
				nibiyun="绝育";
			else if(Rs.getString("nibiyun").equals("7"))
				nibiyun=Rs.getString("othernibiyun");
			else{
				nibiyun="未决定";
			 }
		%>
		</tr>
	    
	<tr  id="r_table">
        <td><div>流产后选择的避孕方式：
        <input name="nibiyun" type="text" size="10" value=<%=nibiyun%> readonly="true" style="border-style:none">
      </div></td>
	
		<% if(nibiyun.equals("COC")){ %>
             <%
			String shijian;
			if(Rs.getString("COCshijian").equals("1"))
				shijian="流产当日";
			else if(Rs.getString("COCshijian").equals("2"))
				shijian="流产后2周";
			else if(Rs.getString("COCshijian").equals("3"))
				shijian="首次恢复月经";
			else if(Rs.getString("COCshijian").equals("4"))
				shijian="流产后1个月";
			else{
				shijian="流产后2-3月";
			 }
		%>
        <td><div>开始使用时间：
        	<input name="shijian" type="text" size="15" value=<%=shijian%> readonly="true" style="border-style:none">
		</div></td>
       <%
			String chufang;
			if(Rs.getString("COCchufang").equals("1"))
				chufang="1个月";
			else if(Rs.getString("COCchufang").equals("2"))
				chufang="2个月";
			else if(Rs.getString("COCchufang").equals("3"))
				chufang="3个月";
			else if(Rs.getString("COCchufang").equals("4"))
				chufang="4个月";
			else if(Rs.getString("COCchufang").equals("5"))
				chufang="5个月";
			else{
				chufang="6个月";
			 }
		%>
        <td><div>落实处方周期：
        	<input name="chufang" type="text" size="15" value=<%=chufang%> readonly="true" style="border-style:none">
        </div></td>
   		<%} %>
      <% if(nibiyun.equals("IUD")||nibiyun.equals("皮埋")||nibiyun.equals("IUS")){ %>
      <%
			String fangzhi;
			if(Rs.getString("IUDfangzhi").equals("1"))
				fangzhi="流产当日";
			else if(Rs.getString("IUDfangzhi").equals("2"))
				fangzhi="流产后2周";
			else if(Rs.getString("IUDfangzhi").equals("3"))
				fangzhi="首次恢复月经";
			else if(Rs.getString("IUDfangzhi").equals("4"))
				fangzhi="流产后1个月";
			else{
				fangzhi="流产后2-3月";
			 }
		%>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=fangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%} %>
      <%if(!Rs.getString("COCshijian").equals("1")&&!Rs.getString("IUDfangzhi").equals("1")&&!Rs.getString("nibiyun").equals("7")){ %>
      <td class="r_cell_1"><div>未立即使用原因:
      		<input name="weiliji" type="text" size="15" value=<%=Rs.getString("weiliji")%> readonly="true" style="border-style:none">
      	</div></td>
      	<%} %>
      	</tr>
	    
	<tr  id="r_table">
      <%
			String other = Rs.getString("other");
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
       if(other.contains("6"))
    	   {other_t+="宫外孕史,";}
       if(other.contains("7"))
    	   {other_t+="痤疮";}
       if(other.contains("0"))
    	   {other_t="无  ";}
       %>
      
      <td class="r_cell_1"><div>其他合并情况:</div></td>
      <td colspan="2">
      	<input name="other" type="text" size="90" value=<%=other_t%>  readonly="true" style="border-style:none">
      </td>
      
    </tr>
	
	<tr id="r_table">
		<%
			String buliang;
			if(Rs.getString("buliang").equals("1"))
				buliang="是";
			else{
				buliang="否";
			 }
		%>
		
		

      <%
			String zhidao;
			if(Rs.getString("zhidao").equals("1"))
				zhidao="是";
			else{
				zhidao="否";
			 }
		%>
      <%
      		String otherzixun;
      		if(Rs.getString("otherzixun").equals("0"))
      			otherzixun = "未填写";
      		else
      			otherzixun = Rs.getString("otherzixun");
      	%>


      <td class="r_cell_1"><div>其他咨询内容：
      	<input name="other" type="text" size="15" value=<%=otherzixun%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>咨询员：
      	<input name="person" type="text" size="10" value=<%=Rs.getString("person")%> readonly="true" style="border-style:none">
      </div></td>
    </tr>
        <tr id="r_table">
       <td></td>
       <td></td>
       <td></td>
       <td align="right">
       <a href="edit.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="55" height="30" src="Images/edit.jpg"/></a>
	   </td>
    </tr>
    <% 
    if(Rs1.next()){
    	%>
    	<!-- 首次随访 -->

    <tr  id="r_table">
			<td colspan="4" >
				<div align="center" class="STYLE4">
					<img width="1335" height="33" src="Images/1z.jpg"/>							
				</div>								
			</td>

		</tr>
		<tr  id="r_table">
      <td class="r_cell_1"><div>咨询日期：
      	<input name="date" type="text" size="15" value=<%=Rs1.getString("date") %> readonly="true" style="border-style:none">
      </div></td>
      <%
			String fangshi;
			if(Rs1.getString("fangshi").equals("1"))
				fangshi="复诊";
			else if(Rs1.getString("fangshi").equals("2")){
				fangshi="电话";
			 }
			else{
				fangshi="未联系上";
			}
		%>
		

      <td class="r_cell_1"><div>随访方式：
      	<input name="fangshi" type="text" size="15" value=<%=fangshi %> readonly="true" style="border-style:none">
      </div></td>

      <td class="r_cell_1"><div>流产后出血天数：
      	<input name="name" type="text" size="10" value=<%=Rs1.getString("chuxuetianshu") %> readonly="true" style="border-style:none">
      </div></td>
      <%
			String youwubingfa;
			if(Rs1.getString("youwubingfa").equals("1"))
				youwubingfa="是";
			else{
				youwubingfa="否";
			 }
		%>
      
    </tr>    
    
    <tr  id="r_table">
    	<%if(Rs1.getString("youwubingfa").equals("1")){ %>
    	<%
    	String bingfa;
			if(Rs1.getString("bingfa").equals("1"))
				bingfa="子宫穿孔";
			else if(Rs1.getString("bingfa").equals("2")){
				bingfa="生殖道损伤";
			 }
			else if(Rs1.getString("bingfa").equals("3")){
				bingfa="人流不全";
			 }
			else if(Rs1.getString("bingfa").equals("4")){
				bingfa="大出血";
			 }
			else if(Rs1.getString("bingfa").equals("5")){
				bingfa="感染";
			 }
			else if(Rs1.getString("bingfa").equals("6")){
				bingfa="宫腔粘连";
			 }
			else{
				bingfa=Rs1.getString("qitabingfa");
			}
		%>
    	<td class="r_cell_1"><div>并发症种类：
      	<input name="bingfa" type="text" size="10" value=<%=bingfa %> readonly="true" style="border-style:none">
      </div></td>
    	<%} %>
    	<%
			String chuxue;
			if(Rs1.getString("chuxue").equals("1"))
				chuxue="少于月经";
			else if(Rs1.getString("chuxue").equals("2")){
				chuxue="与月经相似";
			 }
			else{
				chuxue="多于月经";
			}
		%>
    	


      <%
			String youwubushi;
			if(Rs1.getString("youwubushi").equals("1"))
				youwubushi="是";
			else{
				youwubushi="否";
			 }
		%>
		<%if(Rs1.getString("youwubushi").equals("0")){ 
      
      		String bushi;
			if(Rs1.getString("bushi").equals("1"))
				bushi="发热";
			else if(Rs1.getString("bushi").equals("2")){
				bushi="腹痛";
			 }
			 else if(Rs1.getString("bushi").equals("4"))
			 	bushi="无";
			 else if(Rs1.getString("bushi").equals("0"))
			 	bushi="未填写";
			else{
				bushi=Rs1.getString("qitabushi");
			}
		%>
      <td class="r_cell_1"><div>不适症状：
      	<input name="name" type="text" size="10" value=<%=bushi %> readonly="true" style="border-style:none">
      </div></td>
      
      <%} %>
      <%
      String neimo;
      neimo = Rs1.getString("neimo");
      if(Rs1.getString("neimo").equals("0"))	
      		neimo="未检查";
      	if(Rs1.getString("neimo").equals("16"))
      		neimo="未填写";
      	%>
      <td class="r_cell_1"><div>子宫内膜厚度：
      	<input name="zigongneimo" type="text" size="10" value=<%=neimo%> readonly="true" style="border-style:none">
      	</div><td>
      	
    </tr>
    <%
			String yuejinghuifu;
			if(Rs1.getString("yuejinghuifu").equals("1"))
				yuejinghuifu="是";
			else{
				yuejinghuifu="否";
			 }
		%>
    <tr  id="r_table">
      <td class="r_cell_1"><div>月经是否恢复：
      	<input name="name" type="text" size="5" value=<%=yuejinghuifu %> readonly="true" style="border-style:none">
      </div></td>
      <%if(Rs1.getString("yuejinghuifu").equals("1")){
    	  String huifushijian;
			if(Rs1.getString("huifushijian").equals("2"))
				huifushijian="流产后2周";
			else if(Rs1.getString("huifushijian").equals("3")){
				huifushijian="流产后3周";
			 }
			else if(Rs1.getString("huifushijian").equals("4")){
				huifushijian="流产后4周";
			 }
			else{
				huifushijian="流产后5周";
			}%>
      <td class="r_cell_1"><div>月经恢复时间：
      	<input name="name" type="text" size="10" value=<%=huifushijian %> readonly="true" style="border-style:none">
      </div></td>
      <%
      String yuejingxueliang;
		if(Rs1.getString("yuejingxueliang").equals("1"))
			yuejingxueliang="少于";
		else if(Rs1.getString("yuejingxueliang").equals("2")){
			yuejingxueliang="相似";
		 }
		else if(Rs1.getString("yuejingxueliang").equals("3")){
			yuejingxueliang="多于";
		 }
		else{
			yuejingxueliang="说不清";
		}
      %>
      <td class="r_cell_1"><div>月经血量与平时相比：
      	<input name="name" type="text" size="5" value=<%=yuejingxueliang %> readonly="true" style="border-style:none">
      </div></td>
      <%} %>
      <%
      String xinghuifu;
		if(Rs1.getString("xinghuifu").equals("1"))
			xinghuifu="流产后1周恢复";
		else if(Rs1.getString("xinghuifu").equals("2")){
			xinghuifu="流产后2周恢复";
		 }
		else if(Rs1.getString("xinghuifu").equals("3")){
			xinghuifu="流产后3周恢复";
		 }
		else if(Rs1.getString("xinghuifu").equals("4")){
			xinghuifu="流产后4周恢复";
		 }
		else{
			xinghuifu="未恢复";
		}
      %>
      <td class="r_cell_1"><div>性生活恢复：
      	<input name="name" type="text" size="15" value=<%=xinghuifu %> readonly="true" style="border-style:none">
      </div></td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>选择避孕方式：
        <input name="kong" type="text" size="10" value=<%=Rs1.getString("liuchanbiyun") %> readonly="true" style="border-style:none">
        </div></td>
        <%if(Rs1.getString("liuchanbiyun").equals("COC")){ 
        	String COCjianchi;
        	
        	if(Rs1.getString("COCjianchi").equals("1"))
        		COCjianchi="是";
        	else{
        		COCjianchi="否";
        	}
        	
        	%>
        <td class="r_cell_1"><div>是否仍在使用：
        <input name="kong" type="text" size="10" value=<%=COCjianchi %> readonly="true" style="border-style:none">
        </div></td>
        <%String COCjixu;
        if(Rs1.getString("COCjixuchufang").equals("1"))
        	COCjixu="是";
        else COCjixu="否";
        %>       
        
        <%
        if(COCjianchi.equals("是")){
	       String COCchufangshu="";
	       if(Rs1.getString("COCchufangshu").equals("0"))
	       		COCchufangshu="未补充";
	       	else if(Rs1.getString("COCchufangshu").equals("1"))
	       		COCchufangshu="一周期";
        	else if(Rs1.getString("COCchufangshu").equals("2"))
	       		COCchufangshu="二周期";
	       	else if(Rs1.getString("COCchufangshu").equals("3"))
	       		COCchufangshu="三周期";
	       	else if(Rs1.getString("COCchufangshu").equals("4"))
	       		COCchufangshu="四周期";
	       	else if(Rs1.getString("COCchufangshu").equals("5"))
	       		COCchufangshu="五周期";
	       	else if(Rs1.getString("COCchufangshu").equals("6"))
	       		COCchufangshu="六周期";
	       	%>
	       	<td class="r_cell_1"><div>补充落实周期：
        	<input name="kong" type="text" size="15" value=<%=COCchufangshu%> readonly="true" style="border-style:none">
        	</div></td>	

    	<%}
        else{
        	String COCyuanyin;
        	String huanyongbiyun ="";
        	if(Rs1.getString("COCyuanyin").equals("1"))
        		COCyuanyin="每天服用麻烦";
    		else if(Rs1.getString("COCyuanyin").equals("2")){
    			COCyuanyin="出现副作用";
    		 }
    		else if(Rs1.getString("COCyuanyin").equals("3")){
    			COCyuanyin="担心长期服用不安全";
    		 }
    		else if(Rs1.getString("COCyuanyin").equals("4")){
    			COCyuanyin="认为近期不可能怀孕，没必要避孕";
    		 }
    		else if(Rs1.getString("COCyuanyin").equals("5")){
    			COCyuanyin="改用其他方法";
    		 }
    		else if(Rs1.getString("COCyuanyin").equals("6")){
    			COCyuanyin="打算近期生育，不再需要避孕";
    		 }
    		else if(Rs1.getString("COCyuanyin").equals("7")){
    			COCyuanyin="不知去哪里补充购买";
    		 }
    		else if(Rs1.getString("COCyuanyin").equals("8")){
    			COCyuanyin="伴侣不满意";
    		 }
    		else{
    			COCyuanyin=Rs1.getString("qitaCOCyuanyin");
    		}
    		if(Rs1.getString("huanyongbiyun").equals("0"))
    			huanyongbiyun="未填写";
    		else if(Rs1.getString("huanyongbiyun").equals("1"))
    			huanyongbiyun="COC";
    		else if(Rs1.getString("huanyongbiyun").equals("2"))
    			huanyongbiyun="IUD";
    		else if(Rs1.getString("huanyongbiyun").equals("3"))
    			huanyongbiyun="IUS";
    		else if(Rs1.getString("huanyongbiyun").equals("4"))
    			huanyongbiyun="避孕套";
    		else if(Rs1.getString("huanyongbiyun").equals("5"))
    			huanyongbiyun="皮埋";
    		else if(Rs1.getString("huanyongbiyun").equals("6"))
    			huanyongbiyun="绝育";
    		else if(Rs1.getString("huanyongbiyun").equals("7"))
    			huanyongbiyun="其他";
    		else if(Rs1.getString("huanyongbiyun").equals("8"))
    			huanyongbiyun="无";

    		%>
    	<td class="r_cell_1"><div>未坚持使用原因：
        	<input name="kong" type="text" size="15" value=<%=COCyuanyin %> readonly="true" style="border-style:none">
        	</div></td>	
        <td class="r_cell_1"><div>换用其他避孕方式：
        	<input name="kong" type="text" size="15" value=<%=huanyongbiyun %> readonly="true" style="border-style:none">
        	</div></td>
    	<%}	}
    	else if(Rs1.getString("liuchanbiyun").equals("IUD")||Rs1.getString("liuchanbiyun").equals("皮埋")||Rs1.getString("liuchanbiyun").equals("IUS")){ %>
      	<%
			String IUDfangzhi;
			if(Rs1.getString("IUDfangzhi").equals("流产当日"))
				IUDfangzhi="流产当日";
			else if(Rs1.getString("IUDfangzhi").equals("流产后2周"))
				IUDfangzhi="流产后2周";
			else if(Rs1.getString("IUDfangzhi").equals("首次恢复月经"))
				IUDfangzhi="首次恢复月经";
			else if(Rs1.getString("IUDfangzhi").equals("流产后1个月"))
				IUDfangzhi="流产后1个月";
			else{
				IUDfangzhi="流产后2-3月";
			 }
		%>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDfangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%String IUDjianchi;
      if(Rs1.getString("IUDjianchi").equals("1"))
      	IUDjianchi="是";
      	else IUDjianchi="否";%>
      <td class="r_cell_1"><div>是否仍在使用:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDjianchi%> readonly="true" style="border-style:none">
      </div></td>
      <%if(IUDjianchi.equals("否")){ 
      	String IUDyuanyin;
      	if(Rs1.getString("IUDyuanyin").equals("1"))
      		IUDyuanyin="移位";
		else if(Rs1.getString("IUDyuanyin").equals("2"))
			IUDyuanyin="感染";
		else if(Rs1.getString("IUDyuanyin").equals("3"))
			IUDyuanyin="因症取出";
		else if(Rs1.getString("IUDyuanyin").equals("4"))
			IUDyuanyin="妊娠";
		else{
			IUDyuanyin=Rs1.getString("qitaIUDyuanyin");
		 }
      	%>
      <td class="r_cell_1"><div>未坚持使用原因:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDyuanyin%> readonly="true" style="border-style:none">
      </div></td>
      <%
      }}
      else{ %>
      <%if(Rs1.getString("yuanyigaoxiao").equals("1")){ 
      	String gaoxiaobiyun;
      	if(Rs1.getString("gaoxiaobiyun").equals("1"))
      		gaoxiaobiyun="COC";
		else if(Rs1.getString("gaoxiaobiyun").equals("2"))
			gaoxiaobiyun="IUD";
		else if(Rs1.getString("gaoxiaobiyun").equals("3"))
			gaoxiaobiyun="IUS";
		else if(Rs1.getString("gaoxiaobiyun").equals("4"))
			gaoxiaobiyun="皮埋";
		else{
			gaoxiaobiyun="绝育";
		 }%>
      <td class="r_cell_1"><div>换用高效避孕方法:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaobiyun%> readonly="true" style="border-style:none">
      </div></td>
      <%if(gaoxiaobiyun.equals("COC")){ 
      	String gaoxiaoshijian;
      	if(Rs1.getString("gaoxiaoshijian").equals("1"))
      		gaoxiaoshijian="立即";
		else if(Rs1.getString("gaoxiaoshijian").equals("2"))
			gaoxiaoshijian="下次月经第一天";
		else{
			gaoxiaoshijian="一个月后";
		 }
      	%>
      <td class="r_cell_1"><div>首次使用时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaoshijian%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>处方周期数:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=Rs1.getString("gaoxiaochufang")%> readonly="true" style="border-style:none">
      </div></td>
      <%}else{ 
      String gaoxiaofangzhi;
      if(Rs1.getString("gaoxiaofangzhi").equals("1"))
    	  gaoxiaofangzhi="立即";
		else if(Rs1.getString("gaoxiaofangzhi").equals("2"))
			gaoxiaofangzhi="下次月经";
		else if(Rs1.getString("gaoxiaofangzhi").equals("3"))
			gaoxiaofangzhi="一个月后";
		else{
			gaoxiaofangzhi="三个月后";
		 }
      %>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaofangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%}}else{
    	  String feigaoxiao;
    	  if(Rs1.getString("feigaoxiao").equals("1"))
    		  feigaoxiao="避孕套";
    		else if(Rs1.getString("feigaoxiao").equals("2"))
    			feigaoxiao="安全期";
    		else if(Rs1.getString("feigaoxiao").equals("3"))
    			feigaoxiao="体外射精";
    		else if(Rs1.getString("feigaoxiao").equals("4"))
    			feigaoxiao="紧急避孕药";
    		else{
    			feigaoxiao=Rs1.getString("qitafeigaoxiao");
    		 }
    	  %>
      <td class="r_cell_1"><div>非高效避孕方式:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=feigaoxiao%> readonly="true" style="border-style:none">
      </div></td>
      <%}} %>
    </tr>
    <tr  id="r_table">
    	
      <td class="r_cell_1" colspan="3"><div>其他咨询内容：
      	<input name="kong" type="text" size="50" value=<%=Rs1.getString("other")%> readonly="true" style="border-style:none">
      </div></td>

      <td class="r_cell_1"><div>医护人员：
      	<input name="kong" type="text" size="15" value=<%=Rs1.getString("person") %> readonly="true" style="border-style:none">
      </div></td>
    </tr>
        <tr id="r_table">
       <td></td>
       <td></td>
       <td></td>
       <td align="right">
       <!-- <a href="edit1.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="55" height="30" src="Images/edit.jpg"/></a>
	    -->
	   </td>
    </tr>
	<%} else{%>
		    <tr  id="r_table">
			<td height="34" colspan="3" bgcolor="#97CBFF">
				<div align="center" class="STYLE4">
					<font color="black">首次随访(一个月随访)</font>								
				</div>								
			</td>
			<td height="34" colspan="3" align="center"><a href="first_suifang.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient">[首次随访]</a></td>
		</tr>
	<%} %>
	
	<%if(Rs3.next()){ %>
	<!-- 三个月咨询-->
		<tr  id="r_table">
			<td colspan="4" >
				<div align="center" class="STYLE4">
					<img width="1335" height="33" src="Images/3z.jpg"/>						
				</div>								
			</td>
		</tr>
		<tr  id="r_table">
      <td class="r_cell_1"><div>咨询日期：
      	<input name="date" type="text" size="15" value=<%=Rs3.getString("date") %> readonly="true" style="border-style:none">
      </div></td>
      <%
			String fangshi;
			if(Rs3.getString("fangshi").equals("1"))
				fangshi="复诊";
			else if(Rs3.getString("fangshi").equals("2")){
				fangshi="电话";
			 }
			else{
				fangshi="未联系上";
			}
		%>
      <td class="r_cell_1"><div>随访方式：
      	<input name="fangshi" type="text" size="15" value=<%=fangshi %> readonly="true" style="border-style:none">
      </div></td>
      <!--
      <td class="r_cell_1"><div>流产后出血天数：
      	<input name="name" type="text" size="10" value=<%=Rs3.getString("chuxuetianshu") %> readonly="true" style="border-style:none">
      </div></td>
      -->
      <%
			String youwubingfa;
			if(Rs3.getString("bingfa").equals("1"))
				youwubingfa="是";
			else{
				youwubingfa="否";
			 }
		%>
      
    </tr>    
    
    <tr  id="r_table">
    	<%if(Rs3.getString("youwubingfa").equals("1")){ %>
    	<%
    	String bingfa;
			if(Rs3.getString("bingfa").equals("1"))
				bingfa="子宫穿孔";
			else if(Rs3.getString("bingfa").equals("2")){
				bingfa="生殖道损伤";
			 }
			else if(Rs3.getString("bingfa").equals("3")){
				bingfa="人流不全";
			 }
			else if(Rs3.getString("bingfa").equals("4")){
				bingfa="大出血";
			 }
			else if(Rs3.getString("bingfa").equals("5")){
				bingfa="感染";
			 }
			else if(Rs3.getString("bingfa").equals("6")){
				bingfa="宫腔粘连";
			 }
			else{
				bingfa=Rs3.getString("qitabingfa");
			}
		%>
    	<td class="r_cell_1"><div>并发症种类：
      	<input name="bingfa" type="text" size="10" value=<%=bingfa %> readonly="true" style="border-style:none">
      </div></td>
    	<%} %>
    	<%
			String chuxue;
			if(Rs3.getString("chuxue").equals("1"))
				chuxue="少于月经";
			else if(Rs3.getString("chuxue").equals("2")){
				chuxue="与月经相似";
			 }
			else{
				chuxue="多于月经";
			}
		%>
    	
      <%
			String youwubushi;
			if(Rs3.getString("youwubushi").equals("1"))
				youwubushi="是";
			else{
				youwubushi="否";
			 }
		%>
		<%if(Rs3.getString("youwubushi").equals("0")){
      		String bushi;
			if(Rs3.getString("bushi").equals("1"))
				bushi="发热";
			else if(Rs3.getString("bushi").equals("2")){
				bushi="腹痛";
			 }
			else{
				bushi=Rs3.getString("qitabushi");
			}
		%>
		<!--
      <td class="r_cell_1"><div>不适症状：
      	<input name="name" type="text" size="10" value=<%=bushi %> readonly="true" style="border-style:none">
      </div></td>
      -->
      <%} %>
      <%
      String neimo;
      neimo = Rs1.getString("neimo");
      if(Rs1.getString("neimo").equals("0"))	
      		neimo="未检查";
      	if(Rs1.getString("neimo").equals("16"))
      		neimo="未填写";
      	%>
      	<!--
      <td class="r_cell_1"><div>子宫内膜厚度：
      	<input name="zigongneimo" type="text" size="10" value=<%=neimo%> readonly="true" style="border-style:none">
      	</div><td>
      	-->
    </tr>
    <%
			String yuejinghuifu;
			if(Rs3.getString("huifu").equals("1"))
				yuejinghuifu="是";
			else{
				yuejinghuifu="否";
			 }
		%>
		
    <tr  id="r_table">
    <!--
      <td class="r_cell_1"><div>月经是否恢复：
      	<input name="name" type="text" size="5" value=<%=yuejinghuifu %> readonly="true" style="border-style:none">
      </div></td>
      -->
      <%if(Rs3.getString("huifushijian").equals("1")){
    	  String huifushijian;
			if(Rs3.getString("huifushijian").equals("2"))
				huifushijian="流产后2周";
			else if(Rs3.getString("huifushijian").equals("3")){
				huifushijian="流产后3周";
			 }
			else if(Rs3.getString("huifushijian").equals("4")){
				huifushijian="流产后4周";
			 }
			else{
				huifushijian="流产后5周";
			}%>
			<!--
      <td class="r_cell_1"><div>月经恢复时间：
      	<input name="name" type="text" size="10" value=<%=huifushijian %> readonly="true" style="border-style:none">
      </div></td>
      -->
      <%
      String yuejingxueliang;
		if(Rs3.getString("xiangbi").equals("1"))
			yuejingxueliang="少于";
		else if(Rs3.getString("xiangbi").equals("2")){
			yuejingxueliang="相似";
		 }
		else if(Rs3.getString("xiangbi").equals("3")){
			yuejingxueliang="多于";
		 }
		else{
			yuejingxueliang="说不清";
		}
      %>
      <!--
      <td class="r_cell_1"><div>月经血量与平时相比：
      	<input name="name" type="text" size="5" value=<%=yuejingxueliang %> readonly="true" style="border-style:none">
      </div></td>
      -->
      <%} %>
      <%
      String xinghuifu;
		if(Rs3.getString("xinghuifu").equals("1"))
			xinghuifu="流产后1周恢复";
		else if(Rs3.getString("xinghuifu").equals("2")){
			xinghuifu="流产后2周恢复";
		 }
		else if(Rs3.getString("xinghuifu").equals("3")){
			xinghuifu="流产后3周恢复";
		 }
		else if(Rs3.getString("xinghuifu").equals("4")){
			xinghuifu="流产后4周恢复";
		 }
		else{
			xinghuifu="未恢复";
		}
      %>
      <td class="r_cell_1"><div>性生活恢复：
      	<input name="name" type="text" size="5" value=<%=xinghuifu %> readonly="true" style="border-style:none">
      </div></td>
    </tr>
    <tr  id="r_table">
      <td class="r_cell_1"><div>选择避孕方式：
        <input name="kong" type="text" size="10" value=<%=Rs3.getString("liuchanbiyun") %> readonly="true" style="border-style:none">
        </div></td>
        <%if(Rs3.getString("liuchanbiyun").equals("COC")){ 
        	String COCjianchi;
        	
        	if(Rs3.getString("COCjianchi").equals("1"))
        		COCjianchi="是";
        	else{
        		COCjianchi="否";
        	}
        	
        	%>
        <td class="r_cell_1"><div>是否仍在使用：
        <input name="kong" type="text" size="10" value=<%=COCjianchi %> readonly="true" style="border-style:none">
        </div></td>
        <%String COCjixu;
        	String COCjixuchufang;
        if(Rs3.getString("COCjixu").equals("1"))
        	COCjixu="是";
        else COCjixu="否";
        if(Rs3.getString("COCjixuchufang").equals("1"))
        	COCjixuchufang="是";
        else
        	COCjixuchufang="否";
        %>       
        
        <%
        if(COCjianchi.equals("是")){
        	%>
        <td class="r_cell_1"><div>是否愿意继续使用：
        <input name="kong" type="text" size="10" value=<%=COCjixu%> readonly="true" style="border-style:none">
        </div></td>
        
	     <%  
    	}
        else{
        	String COCyuanyin;
        	if(Rs3.getString("COCyuanyin").equals("1"))
        		COCyuanyin="每天服用麻烦";
    		else if(Rs3.getString("COCyuanyin").equals("2")){
    			COCyuanyin="出现副作用";
    		 }
    		else if(Rs3.getString("COCyuanyin").equals("3")){
    			COCyuanyin="担心长期服用不安全";
    		 }
    		else if(Rs3.getString("COCyuanyin").equals("4")){
    			COCyuanyin="认为近期不可能怀孕，没必要避孕";
    		 }
    		else if(Rs3.getString("COCyuanyin").equals("5")){
    			COCyuanyin="改用其他方法";
    		 }
    		else if(Rs3.getString("COCyuanyin").equals("6")){
    			COCyuanyin="打算近期生育，不再需要避孕";
    		 }
    		else if(Rs3.getString("COCyuanyin").equals("7")){
    			COCyuanyin="不知去哪里补充购买";
    		 }
    		else if(Rs3.getString("COCyuanyin").equals("8")){
    			COCyuanyin="伴侣不满意";
    		 }
    		else{
    			COCyuanyin=Rs3.getString("qitaCOCyuanyin");
    		}%>
    	<td class="r_cell_1"><div>未坚持使用原因：
        	<input name="kong" type="text" size="10" value=<%=COCyuanyin %> readonly="true" style="border-style:none">
        	</div></td>	
    	<%}	}
    	else if(Rs3.getString("liuchanbiyun").equals("IUD")||Rs3.getString("liuchanbiyun").equals("皮埋")||Rs3.getString("liuchanbiyun").equals("IUS")){ %>
      	<%
			String IUDfangzhi;
			if(Rs3.getString("IUDfangzhi").equals("流产当日"))
				IUDfangzhi="流产当日";
			else if(Rs3.getString("IUDfangzhi").equals("流产后2周"))
				IUDfangzhi="流产后2周";
			else if(Rs3.getString("IUDfangzhi").equals("首次恢复月经"))
				IUDfangzhi="首次恢复月经";
			else if(Rs3.getString("IUDfangzhi").equals("流产后1个月"))
				IUDfangzhi="流产后1个月";
			else{
				IUDfangzhi="流产后2-3月";
			 }
		%>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDfangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%String IUDjianchi;
      if(Rs3.getString("IUDjianchi").equals("1"))
      	IUDjianchi="是";
      	else IUDjianchi="否";%>
      <td class="r_cell_1"><div>是否仍在使用:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDjianchi%> readonly="true" style="border-style:none">
      </div></td>
      <%if(IUDjianchi.equals("否")){ 
      	String IUDyuanyin;
      	if(Rs3.getString("IUDyuanyin").equals("1"))
      		IUDyuanyin="移位";
		else if(Rs3.getString("IUDyuanyin").equals("2"))
			IUDyuanyin="感染";
		else if(Rs3.getString("IUDyuanyin").equals("3"))
			IUDyuanyin="因症取出";
		else if(Rs3.getString("IUDyuanyin").equals("4"))
			IUDyuanyin="妊娠";
		else{
			IUDyuanyin=Rs3.getString("qitaIUDyuanyin");
		 }
      	%>
      <td class="r_cell_1"><div>未坚持使用原因:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDyuanyin%> readonly="true" style="border-style:none">
      </div></td>
      <%
      }}
      else{ %>
      <%if(Rs3.getString("yuanyigaoxiao").equals("1")){ 
      	String gaoxiaobiyun;
      	if(Rs3.getString("gaoxiaobiyun").equals("1"))
      		gaoxiaobiyun="COC";
		else if(Rs3.getString("gaoxiaobiyun").equals("2"))
			gaoxiaobiyun="IUD";
		else if(Rs3.getString("gaoxiaobiyun").equals("3"))
			gaoxiaobiyun="IUS";
		else if(Rs3.getString("gaoxiaobiyun").equals("4"))
			gaoxiaobiyun="皮埋";
		else{
			gaoxiaobiyun="绝育";
		 }%>
      <td class="r_cell_1"><div>换用高效避孕方法:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaobiyun%> readonly="true" style="border-style:none">
      </div></td>
      <%if(gaoxiaobiyun.equals("COC")){ 
      	String gaoxiaoshijian;
      	if(Rs3.getString("gaoxiaoshijian").equals("1"))
      		gaoxiaoshijian="立即";
		else if(Rs3.getString("gaoxiaoshijian").equals("2"))
			gaoxiaoshijian="下次月经第一天";
		else{
			gaoxiaoshijian="一个月后";
		 }
      	%>
      <td class="r_cell_1"><div>首次使用时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaoshijian%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>处方周期数:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=Rs3.getString("gaoxiaochufang")%> readonly="true" style="border-style:none">
      </div></td>
      <%}else{ 
      String gaoxiaofangzhi;
      if(Rs3.getString("gaoxiaofangzhi").equals("1"))
    	  gaoxiaofangzhi="立即";
		else if(Rs3.getString("gaoxiaofangzhi").equals("2"))
			gaoxiaofangzhi="下次月经";
		else if(Rs3.getString("gaoxiaofangzhi").equals("3"))
			gaoxiaofangzhi="一个月后";
		else{
			gaoxiaofangzhi="三个月后";
		 }
      %>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaofangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%}}else{
    	  String feigaoxiao;
    	  if(Rs3.getString("feigaoxiao").equals("1"))
    		  feigaoxiao="避孕套";
    		else if(Rs3.getString("feigaoxiao").equals("2"))
    			feigaoxiao="安全期";
    		else if(Rs3.getString("feigaoxiao").equals("3"))
    			feigaoxiao="体外射精";
    		else if(Rs3.getString("feigaoxiao").equals("4"))
    			feigaoxiao="紧急避孕药";
    		else{
    			feigaoxiao=Rs3.getString("qitafeigaoxiao");
    		 }
    	  %>
      <td class="r_cell_1"><div>非高效避孕方式:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=feigaoxiao%> readonly="true" style="border-style:none">
      </div></td>
      <%}} %>
      <%
      	String COCjixuchufang="";
      	if(Rs3.getString("COCjixuchufang").equals("1"))
      		COCjixuchufang="是";
      	else
      		COCjixuchufang="否";
      	%>
      	<td class="r_cell_1"><div>本次是否补充落实：
      		<input name="age" type="text" size="10" value=<%=COCjixuchufang%> readonly="true" style="border-style:none">
      </div></td>
      	<%
      		String COCchufangshu="";
      		if(COCjixuchufang.equals("是"))
      		{
      		%>
      	<td class="r_cell_1"><div>本次补充落实周期数：
      		<input name="age" type="text" size="10" value=<%=Rs3.getString("COCchufangshu")%> readonly="true" style="border-style:none">
      </div></td>
      		<%}
      		else
      		{}
      		%>

    </tr>
    <tr  id="r_table">
    <%String huanjie;
    	if(Rs3.getString("huanjie").equals("1"))
    		huanjie="是";
    	else
    		huanjie="否";
    	%>
    <td class="r_cell_1"><div>合并情况是否有所缓解：
      		<input name="age" type="text" size="10" value=<%=huanjie%> readonly="true" style="border-style:none">
      </div></td>
    <%String yiwai;
    if(Rs3.getString("yiwai").equals("1"))
    	yiwai="是";
    else yiwai="否";%>
      <td class="r_cell_1"><div>是否再次妊娠：
      		<input name="age" type="text" size="10" value=<%=yiwai%> readonly="true" style="border-style:none">
      </div></td>
      <%if(Rs3.getString("yiwai").equals("1")){ 
      String renshenshijian;
      if(Rs3.getString("renshen").equals("1"))
    	  renshenshijian="上次流产后1个月内";
		else if(Rs3.getString("renshen").equals("2"))
			renshenshijian="上次流产后2个月";
		else{
			renshenshijian="上次流产后3个月";
		 }
      String zhongzhi;
      if(Rs3.getString("zhongzhi").equals("1"))
    	  zhongzhi="是";
		else{
			zhongzhi="否";
		 }
      %>
      <td class="r_cell_1" colspan="1"><div>妊娠时间：
      		<input name="num" type="text" size="30" value=<%=renshenshijian%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>是否终止：
      		<input name="num" type="text" size="10" value=<%=zhongzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%} %>
    </tr>
        <tr id="r_table">
       <td></td>
       <td></td>
       <td></td>
       <td align="right">
       <!-- <a href="edit3.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="55" height="30" src="Images/edit.jpg"/></a>
	   </td> -->
    </tr>
    <%} else{%>
		    <tr  id="r_table">
			<td height="34" colspan="3" bgcolor="#97CBFF">
				<div align="center" class="STYLE4">
					<font color="black">中远期随访(三个月)</font>								
				</div>								
			</td>
			<td height="34" colspan="3" align="center"><a href="zhongyuan.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient">[三个月随访]</a></td>
		</tr>
	<%} %>
	<%if(Rs6.next()){ %>
	<!-- 六个月随访 -->
		<tr  id="r_table">
			<td colspan="4">
				<div align="center" class="STYLE4">
					<img width="1335" height="33" src="Images/6z.jpg"/>				
				</div>								
			</td>
		</tr>
		<tr  id="r_table">
		<td class="r_cell_1"><div>咨询日期：
      	<input name="date" type="text" size="15" value=<%=Rs6.getString("date") %> readonly="readonly" style="border-style:none">
      </div></td>
      <%
			String fangshi;
			if(Rs6.getString("fangshi").equals("1"))
				fangshi="复诊";
			else if(Rs6.getString("fangshi").equals("2")){
				fangshi="电话";
			 }
			else{
				fangshi="未联系上";
			}
		%>
      <td class="r_cell_1"><div>随访方式：
      	<input name="fangshi" type="text" size="15" value=<%=fangshi %> readonly="true" style="border-style:none">
      </div></td>

    </tr>    
    <tr  id="r_table">
      <td class="r_cell_1"><div>选择避孕方式：
        <input name="kong" type="text" size="10" value=<%=Rs6.getString("liuchanbiyun") %> readonly="true" style="border-style:none">
        </div></td>
        <%if(Rs6.getString("liuchanbiyun").equals("COC")){ 
        	String COCjianchi;
        	
        	if(Rs6.getString("COCjianchi").equals("1"))
        		COCjianchi="是";
        	else{
        		COCjianchi="否";
        	}
        	
        	%>
        <td class="r_cell_1"><div>是否仍在使用：
        <input name="kong" type="text" size="10" value=<%=COCjianchi %> readonly="true" style="border-style:none">
        </div></td>
        <%
		String COCjixu = new String();
        if(Rs6.getString("COCjixu").equals("1"))
        	COCjixu="是";
        else COCjixu="否";
        %>  
        <%
        String COCqudao = "";
        
        if(Rs6.getString("COCqudao").equals("1"))  
        	COCqudao="医院";
        else if(Rs6.getString("COCqudao").equals("2"))   
        	COCqudao="药店";
        else
        	COCqudao="其他";
        
        %>
        
        <%
		String COCjixuchufang = new String();
        if(COCjianchi.equals("是")){
        	%>
        	<td class="r_cell_1"><div>后续补充药物渠道：
        <input name="kong" type="text" size="10" value=<%=COCqudao%> readonly="true" style="border-style:none">
        </div></td>
        	<td class="r_cell_1"><div>是否愿意继续使用：
        <input name="kong" type="text" size="10" value=<%=COCjixu %> readonly="true" style="border-style:none">
        </div></td>
        <%
    	}
        else{
        	String COCyuanyin;
        	if(Rs6.getString("COCyuanyin").equals("1"))
        		COCyuanyin="每天服用麻烦";
    		else if(Rs6.getString("COCyuanyin").equals("2")){
    			COCyuanyin="出现副作用";
    		 }
    		else if(Rs6.getString("COCyuanyin").equals("3")){
    			COCyuanyin="担心长期服用不安全";
    		 }
    		else if(Rs6.getString("COCyuanyin").equals("4")){
    			COCyuanyin="认为近期不可能怀孕，没必要避孕";
    		 }
    		else if(Rs6.getString("COCyuanyin").equals("5")){
    			COCyuanyin="改用其他方法";
    		 }
    		else if(Rs6.getString("COCyuanyin").equals("6")){
    			COCyuanyin="打算近期生育，不再需要避孕";
    		 }
    		else if(Rs6.getString("COCyuanyin").equals("7")){
    			COCyuanyin="不知去哪里补充购买";
    		 }
    		else if(Rs6.getString("COCyuanyin").equals("8")){
    			COCyuanyin="伴侣不满意";
    		 }
    		else{
    			COCyuanyin=Rs6.getString("qitaCOCyuanyin");
    		}%>
    	<td class="r_cell_1"><div>未坚持使用原因：
        	<input name="kong" type="text" size="15" value=<%=COCyuanyin %> readonly="true" style="border-style:none">
        	</div></td>	
    	<%}	}
    	else if(Rs6.getString("liuchanbiyun").equals("IUD")||Rs6.getString("liuchanbiyun").equals("皮埋")||Rs6.getString("liuchanbiyun").equals("IUS")){ %>
      	<%
			String IUDfangzhi;
			if(Rs6.getString("IUDfangzhi").equals("流产当日"))
				IUDfangzhi="流产当日";
			else if(Rs6.getString("IUDfangzhi").equals("流产后2周"))
				IUDfangzhi="流产后2周";
			else if(Rs6.getString("IUDfangzhi").equals("首次恢复月经"))
				IUDfangzhi="首次恢复月经";
			else if(Rs6.getString("IUDfangzhi").equals("流产后1个月"))
				IUDfangzhi="流产后1个月";
			else{
				IUDfangzhi="流产后2-3月";
			 }
		%>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDfangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%String IUDjianchi;
      if(Rs6.getString("IUDjianchi").equals("1"))
      	IUDjianchi="是";
      	else IUDjianchi="否";%>
      <td class="r_cell_1"><div>是否仍在使用:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDjianchi%> readonly="true" style="border-style:none">
      </div></td>
      <%if(IUDjianchi.equals("否")){ 
      	String IUDyuanyin;
      	if(Rs6.getString("IUDyuanyin").equals("1"))
      		IUDyuanyin="移位";
		else if(Rs6.getString("IUDyuanyin").equals("2"))
			IUDyuanyin="感染";
		else if(Rs6.getString("IUDyuanyin").equals("3"))
			IUDyuanyin="因症取出";
		else if(Rs6.getString("IUDyuanyin").equals("4"))
			IUDyuanyin="妊娠";
		else{
			IUDyuanyin=Rs6.getString("qitaIUDyuanyin");
		 }
      	%>
      <td class="r_cell_1"><div>未坚持使用原因:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDyuanyin%> readonly="true" style="border-style:none">
      </div></td>
      <%
      }}
      else{ %>
      <%if(Rs6.getString("yuanyigaoxiao").equals("1")){ 
      	String gaoxiaobiyun;
      	if(Rs6.getString("gaoxiaobiyun").equals("1"))
      		gaoxiaobiyun="COC";
		else if(Rs6.getString("gaoxiaobiyun").equals("2"))
			gaoxiaobiyun="IUD";
		else if(Rs6.getString("gaoxiaobiyun").equals("3"))
			gaoxiaobiyun="IUS";
		else if(Rs6.getString("gaoxiaobiyun").equals("4"))
			gaoxiaobiyun="皮埋";
		else{
			gaoxiaobiyun="绝育";
		 }%>
      <td class="r_cell_1"><div>换用高效避孕方法:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaobiyun%> readonly="true" style="border-style:none">
      </div></td>
      <%if(gaoxiaobiyun.equals("COC")){ 
      	String gaoxiaoshijian;
      	if(Rs6.getString("gaoxiaoshijian").equals("1"))
      		gaoxiaoshijian="立即";
		else if(Rs6.getString("gaoxiaoshijian").equals("2"))
			gaoxiaoshijian="下次月经第一天";
		else{
			gaoxiaoshijian="一个月后";
		 }
      	%>
      <td class="r_cell_1"><div>首次使用时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaoshijian%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>处方周期数:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=Rs6.getString("gaoxiaochufang")%> readonly="true" style="border-style:none">
      </div></td>
      <%}else{ 
      String gaoxiaofangzhi;
      if(Rs6.getString("gaoxiaofangzhi").equals("1"))
    	  gaoxiaofangzhi="立即";
		else if(Rs6.getString("gaoxiaofangzhi").equals("2"))
			gaoxiaofangzhi="下次月经";
		else if(Rs6.getString("gaoxiaofangzhi").equals("3"))
			gaoxiaofangzhi="一个月后";
		else{
			gaoxiaofangzhi="三个月后";
		 }
      %>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaofangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%}}else{
    	  String feigaoxiao;
    	  if(Rs6.getString("feigaoxiao").equals("1"))
    		  feigaoxiao="避孕套";
    		else if(Rs6.getString("feigaoxiao").equals("2"))
    			feigaoxiao="安全期";
    		else if(Rs6.getString("feigaoxiao").equals("3"))
    			feigaoxiao="体外射精";
    		else if(Rs6.getString("feigaoxiao").equals("4"))
    			feigaoxiao="紧急避孕药";
    		else{
    			feigaoxiao=Rs6.getString("qitafeigaoxiao");
    		 }
    	  %>
      <td class="r_cell_1"><div>非高效避孕方式:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=feigaoxiao%> readonly="true" style="border-style:none">
      </div></td>
      <%}} %>
    </tr>
    <tr  id="r_table">
    <%String yiwai;
    if(Rs6.getString("yiwai").equals("1"))
    	yiwai="是";
    else yiwai="否";%>
      <td class="r_cell_1"><div>是否再次妊娠：
      		<input name="age" type="text" size="10" value=<%=yiwai%> readonly="true" style="border-style:none">
      </div></td>
      <%if(Rs6.getString("yiwai").equals("1")){ 
      String yiyuanrenshen;
      if(Rs6.getString("yiyuanrenshen").equals("1"))
    	  yiyuanrenshen="是";
		else{
			yiyuanrenshen="否";
		 }
      String zhongzhi;
      if(Rs6.getString("zhongzhi").equals("1"))
    	  zhongzhi="是";
		else{
			zhongzhi="否";
		 }
		 String renshen="";
		 if(Rs6.getString("renshen").equals("1"))
		 	renshen="上次流产后1个月";
		 else if(Rs6.getString("renshen").equals("2"))
		 	renshen="上次流产后2个月";
		 else if(Rs6.getString("renshen").equals("3"))
		 	renshen="上次流产后3个月";
		 else if(Rs6.getString("renshen").equals("4"))
		 	renshen="上次流产后4个月";
		 else if(Rs6.getString("renshen").equals("5"))
		 	renshen="上次流产后5个月";
		 else if(Rs6.getString("renshen").equals("6"))
		 	renshen="上次流产后6个月";
      %>
      <td class="r_cell_1" colspan="1"><div>妊娠时间：
      		<input name="num" type="text" size="15" value=<%=renshen%> readonly="true" style="border-style:none">
      </div></td>

      <td class="r_cell_1" colspan="1"><div>是否为意愿妊娠：
      		<input name="num" type="text" size="10" value=<%=yiyuanrenshen%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>是否终止：
      		<input name="num" type="text" size="10" value=<%=zhongzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%} %>
    </tr>
        <tr id="r_table">
       <td></td>
       <td></td>
       <td></td>
       <td align="right">
       <!-- <a href="edit6.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="55" height="30" src="Images/edit.jpg"/></a>
	   </td> -->
    </tr>
    <%} else{%>
		    <tr  id="r_table">
			<td height="34" colspan="3" bgcolor="#97CBFF">
				<div align="center" class="STYLE4">
					<font color="black">中远期随访(六个月)</font>								
				</div>								
			</td>
			<td height="34" colspan="3" align="center"><a href="zhongyuan6.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient">[六个月随访]</a></td>
		</tr>
	<%} %>
	<%if(Rs12.next()){ %>
		<tr  id="r_table">
			<td colspan="4">
				<div align="center" class="STYLE4">
					<img width="1335" height="33" src="Images/12z.jpg"/>						
				</div>								
			</td>
		</tr>
		<tr  id="r_table">
		<td class="r_cell_1"><div>咨询日期：
      	<input name="date" type="text" size="15" value=<%=Rs12.getString("date") %> readonly="readonly" style="border-style:none">
      </div></td>
      <%
			String fangshi;
			if(Rs12.getString("fangshi").equals("1"))
				fangshi="复诊";
			else if(Rs12.getString("fangshi").equals("2")){
				fangshi="电话";
			 }
			else{
				fangshi="未联系上";
			}
		%>
      <td class="r_cell_1"><div>随访方式：
      	<input name="fangshi" type="text" size="15" value=<%=fangshi %> readonly="true" style="border-style:none">
      </div></td>

    </tr>    
    <tr  id="r_table">
      <td class="r_cell_1"><div>选择避孕方式：
        <input name="kong" type="text" size="10" value=<%=Rs12.getString("liuchanbiyun") %> readonly="true" style="border-style:none">
        </div></td>
        <%if(Rs12.getString("liuchanbiyun").equals("COC")){ 
        	String COCjianchi;
        	
        	if(Rs12.getString("COCjianchi").equals("1"))
        		COCjianchi="是";
        	else{
        		COCjianchi="否";
        	}
        	
        	%>
        <td class="r_cell_1"><div>是否仍在使用：
        <input name="kong" type="text" size="10" value=<%=COCjianchi %> readonly="true" style="border-style:none">
        </div></td>
        <%String COCjixu;
        if(Rs12.getString("COCjixu").equals("1"))
        	COCjixu="是";
        else COCjixu="否";
        %>      

         <%
        String COCqudao = "";
        
        if(Rs12.getString("COCqudao").equals("1"))  
        	COCqudao="医院";
        else if(Rs12.getString("COCqudao").equals("2"))   
        	COCqudao="药店";
        else
        	COCqudao="其他";
        
        %> 
        
        <%
        if(COCjianchi.equals("是")){
        	%>
        	<td class="r_cell_1"><div>后续补充药物渠道：
        <input name="kong" type="text" size="10" value=<%=COCqudao%> readonly="true" style="border-style:none">
        </div></td>
        	<td class="r_cell_1"><div>是否愿意继续使用：
        <input name="kong" type="text" size="10" value=<%=COCjixu %> readonly="true" style="border-style:none">
        </div></td>
	      <%  
    	}
        else{
        	String COCyuanyin;
        	if(Rs12.getString("COCyuanyin").equals("1"))
        		COCyuanyin="每天服用麻烦";
    		else if(Rs12.getString("COCyuanyin").equals("2")){
    			COCyuanyin="出现副作用";
    		 }
    		else if(Rs12.getString("COCyuanyin").equals("3")){
    			COCyuanyin="担心长期服用不安全";
    		 }
    		else if(Rs12.getString("COCyuanyin").equals("4")){
    			COCyuanyin="认为近期不可能怀孕，没必要避孕";
    		 }
    		else if(Rs12.getString("COCyuanyin").equals("5")){
    			COCyuanyin="改用其他方法";
    		 }
    		else if(Rs12.getString("COCyuanyin").equals("6")){
    			COCyuanyin="打算近期生育，不再需要避孕";
    		 }
    		else if(Rs12.getString("COCyuanyin").equals("7")){
    			COCyuanyin="不知去哪里补充购买";
    		 }
    		else if(Rs12.getString("COCyuanyin").equals("8")){
    			COCyuanyin="伴侣不满意";
    		 }
    		else{
    			COCyuanyin=Rs12.getString("qitaCOCyuanyin");
    		}%>
    	<td class="r_cell_1"><div>未坚持使用原因：
        	<input name="kong" type="text" size="10" value=<%=COCyuanyin %> readonly="true" style="border-style:none">
        	</div></td>	
    	<%}	}
    	else if(Rs12.getString("liuchanbiyun").equals("IUD")||Rs12.getString("liuchanbiyun").equals("皮埋")||Rs12.getString("liuchanbiyun").equals("IUS")){ %>
      	<%
			String IUDfangzhi;
			if(Rs12.getString("IUDfangzhi").equals("流产当日"))
				IUDfangzhi="流产当日";
			else if(Rs12.getString("IUDfangzhi").equals("流产后2周"))
				IUDfangzhi="流产后2周";
			else if(Rs12.getString("IUDfangzhi").equals("首次恢复月经"))
				IUDfangzhi="首次恢复月经";
			else if(Rs12.getString("IUDfangzhi").equals("流产后1个月"))
				IUDfangzhi="流产后1个月";
			else{
				IUDfangzhi="流产后2-3月";
			 }
		%>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDfangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%String IUDjianchi;
      if(Rs12.getString("IUDjianchi").equals("1"))
      	IUDjianchi="是";
      	else IUDjianchi="否";%>
      <td class="r_cell_1"><div>是否仍在使用:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDjianchi%> readonly="true" style="border-style:none">
      </div></td>
      <%if(IUDjianchi.equals("否")){ 
      	String IUDyuanyin;
      	if(Rs12.getString("IUDyuanyin").equals("1"))
      		IUDyuanyin="移位";
		else if(Rs12.getString("IUDyuanyin").equals("2"))
			IUDyuanyin="感染";
		else if(Rs12.getString("IUDyuanyin").equals("3"))
			IUDyuanyin="因症取出";
		else if(Rs12.getString("IUDyuanyin").equals("4"))
			IUDyuanyin="妊娠";
		else{
			IUDyuanyin=Rs12.getString("qitaIUDyuanyin");
		 }
      	%>
      <td class="r_cell_1"><div>未坚持使用原因:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=IUDyuanyin%> readonly="true" style="border-style:none">
      </div></td>
      <%
      }}
      else{ %>
      <%if(Rs12.getString("yuanyigaoxiao").equals("1")){ 
      	String gaoxiaobiyun;
      	if(Rs12.getString("gaoxiaobiyun").equals("1"))
      		gaoxiaobiyun="COC";
		else if(Rs12.getString("gaoxiaobiyun").equals("2"))
			gaoxiaobiyun="IUD";
		else if(Rs12.getString("gaoxiaobiyun").equals("3"))
			gaoxiaobiyun="IUS";
		else if(Rs12.getString("gaoxiaobiyun").equals("4"))
			gaoxiaobiyun="皮埋";
		else{
			gaoxiaobiyun="绝育";
		 }%>
      <td class="r_cell_1"><div>换用高效避孕方法:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaobiyun%> readonly="true" style="border-style:none">
      </div></td>
      <%if(gaoxiaobiyun.equals("COC")){ 
      	String gaoxiaoshijian;
      	if(Rs12.getString("gaoxiaoshijian").equals("1"))
      		gaoxiaoshijian="立即";
		else if(Rs12.getString("gaoxiaoshijian").equals("2"))
			gaoxiaoshijian="下次月经第一天";
		else{
			gaoxiaoshijian="一个月后";
		 }
      	%>
      <td class="r_cell_1"><div>首次使用时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaoshijian%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>处方周期数:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=Rs12.getString("gaoxiaochufang")%> readonly="true" style="border-style:none">
      </div></td>
      <%}else{ 
      String gaoxiaofangzhi;
      if(Rs12.getString("gaoxiaofangzhi").equals("1"))
    	  gaoxiaofangzhi="立即";
		else if(Rs12.getString("gaoxiaofangzhi").equals("2"))
			gaoxiaofangzhi="下次月经";
		else if(Rs12.getString("gaoxiaofangzhi").equals("3"))
			gaoxiaofangzhi="一个月后";
		else{
			gaoxiaofangzhi="三个月后";
		 }
      %>
      <td class="r_cell_1"><div>放置时间:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=gaoxiaofangzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%}}else{
    	  String feigaoxiao;
    	  if(Rs12.getString("feigaoxiao").equals("1"))
    		  feigaoxiao="避孕套";
    		else if(Rs12.getString("feigaoxiao").equals("2"))
    			feigaoxiao="安全期";
    		else if(Rs12.getString("feigaoxiao").equals("3"))
    			feigaoxiao="体外射精";
    		else if(Rs12.getString("feigaoxiao").equals("4"))
    			feigaoxiao="紧急避孕药";
    		else{
    			feigaoxiao=Rs12.getString("qitafeigaoxiao");
    		 }
    	  %>
      <td class="r_cell_1"><div>非高效避孕方式:
      		<input name="IUDfangzhi" type="text" size="15" value=<%=feigaoxiao%> readonly="true" style="border-style:none">
      </div></td>
      <%}} %>
    </tr>
    <tr  id="r_table">
    <%String yiwai;
    if(Rs12.getString("yiwai").equals("1"))
    	yiwai="是";
    else yiwai="否";%>
      <td class="r_cell_1"><div>是否再次妊娠：
      		<input name="age" type="text" size="10" value=<%=yiwai%> readonly="true" style="border-style:none">
      </div></td>
      <%if(Rs12.getString("yiwai").equals("1")){ 
      String yiyuanrenshen;
      if(Rs12.getString("yiyuanrenshen").equals("1"))
    	  yiyuanrenshen="是";
		else{
			yiyuanrenshen="否";
		 }
      String zhongzhi;
      if(Rs12.getString("zhongzhi").equals("1"))
    	  zhongzhi="是";
		else{
			zhongzhi="否";
		 }
		 String renshen="";
		 if(Rs12.getString("renshen").equals("1"))
		 	renshen="上次流产后3个月";
		 else if(Rs12.getString("renshen").equals("2"))
		 	renshen="上次流产后6个月";
		 else if(Rs12.getString("renshen").equals("3"))
		 	renshen="上次流产后一年内";
		 
      %>
      <td class="r_cell_1" colspan="1"><div>妊娠时间：
      		<input name="num" type="text" size="15" value=<%=renshen%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1" colspan="1"><div>是否为意愿妊娠：
      		<input name="num" type="text" size="10" value=<%=yiyuanrenshen%> readonly="true" style="border-style:none">
      </div></td>
      <td class="r_cell_1"><div>是否终止：
      		<input name="num" type="text" size="10" value=<%=zhongzhi%> readonly="true" style="border-style:none">
      </div></td>
      <%} %>
    </tr>
        <tr id="r_table">
       <td></td>
       <td></td>
       <td></td>
       <!--  <td align="right">
       <a href="edit12.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>"><img width="55" height="30" src="Images/edit.jpg"/></a>
	   </td>-->
    </tr>
    <%} else{%>
		    <tr  id="r_table">
			<td height="34" colspan="3" bgcolor="#97CBFF">
				<div align="center" class="STYLE4">
					<font color="black">中远期随访(十二个月)</font>								
				</div>								
			</td>
			<td height="34" colspan="3" align="center"><a href="zhongyuan12.jsp?num=<%=Rs.getString("num")%>&shuming=<%=shuming%>&method=patient">[十二个月随访]</a></td>
		</tr>
	<%} %>
 
	</form>
<%
	dao.closeConnection();
%>
</table>
				
</body>
</html>