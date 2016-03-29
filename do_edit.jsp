<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
	System.out.println("testname:"+name);
dao.name = name;
String date=request.getParameter("date");
dao.date = date;
String tel=request.getParameter("tel");
dao.tel = tel;
String num=request.getParameter("num");
dao.num = num;
String age=request.getParameter("age");
dao.age = age;
String hun=request.getParameter("hun");
dao.hun = hun;
String huji=request.getParameter("huji");
dao.huji = huji;
String zhiye=request.getParameter("zhiye");
dao.zhiye = zhiye;

String shuming=request.getParameter("shuming");
dao.shuming = shuming;

String yuanyin=request.getParameter("yuanyin");
dao.yuanyin = yuanyin;
String tingjing=request.getParameter("tingjing");
dao.tingjing = tingjing;
String Bchao=request.getParameter("Bchao");
dao.Bchao = Bchao;
String niliuchan=request.getParameter("niliuchan");
dao.niliuchan = niliuchan;
String liudate=request.getParameter("liudate");
dao.liudate = liudate;
String yuntime=request.getParameter("yuntime");
dao.yuntime = yuntime;
String chantime=request.getParameter("chantime");
dao.chantime = chantime;
String birth=request.getParameter("birth");
//System.out.println("birth="+birth);
if(birth==""){
dao.birth = "0";}
else dao.birth = birth;
String chanlater=request.getParameter("chanlater");
if(chanlater==""){
	dao.chanlater = "0";
}else dao.chanlater = chanlater;
String chantonow=request.getParameter("chantonow");
if(chantonow==""){
	dao.chantonow = "0";
}else dao.chantonow = chantonow;
String liutime=request.getParameter("liutime");
if(liutime==""){
	dao.liutime = "0";
}else dao.liutime = liutime;
String liulater=request.getParameter("liulater");
if(liulater==""){
	dao.liulater = "0";
}else dao.liulater = liulater;
String liutonow=request.getParameter("liutonow");
if(liutonow==""){
	dao.liutonow = "0";
}else dao.liutonow = liutonow;
String poutime=request.getParameter("poutime");
if(poutime==""){
	dao.poutime = "0";
}else dao.poutime = poutime;
String moci=request.getParameter("moci");
if(moci==""){
	dao.moci = "0";
}else dao.moci = moci;
String buru=request.getParameter("buru");
if(buru==""){
dao.buru = "0";}
else dao.buru = buru;
String zhiru=request.getParameter("zhiru");
if(zhiru==""){
dao.zhiru = "0";}
else dao.zhiru = zhiru;
String liu2=request.getParameter("liu2");
if(liu2==""){
dao.liu2 = "0";}
else dao.liu2 = liu2;
String zigong=request.getParameter("zigong");
if(zigong==""){
dao.zigong = "0";}
else dao.zigong = zigong;
String zhanlian=request.getParameter("zhanlian");
if(zhanlian==""){
dao.zhanlian = "0";}
else dao.zhanlian = zhanlian;
String lieshang=request.getParameter("lieshang");
if(lieshang==""){
dao.lieshang = "0";}
else dao.lieshang = lieshang;
String qitagaowei=request.getParameter("qitagaowei");
if(qitagaowei==""){
dao.qitagaowei = "0";}
else dao.qitagaowei = qitagaowei;
String history=request.getParameter("history");
dao.history = history;
String otherhistory=request.getParameter("otherhistory");
if(otherhistory==""){
dao.otherhistory = "0";}
else dao.otherhistory = otherhistory;
String gaowei=request.getParameter("gaowei");
dao.gaowei = gaowei;
String plan=request.getParameter("plan");
dao.plan = plan;
String renshen=request.getParameter("renshen");
if(renshen==""){
dao.renshen = "2";}
String biyun=request.getParameter("biyun");
dao.biyun = biyun;
String otherbiyun=request.getParameter("otherbiyun");
if(otherbiyun==""){
dao.otherbiyun = "0";}
else dao.otherbiyun = otherbiyun;
String nibiyun=request.getParameter("nibiyun");
dao.nibiyun = nibiyun;
String othernibiyun=request.getParameter("othernibiyun");
if(othernibiyun==""){
dao.othernibiyun = "0";}
else dao.othernibiyun = othernibiyun;
String COCshijian=request.getParameter("COCshijian");
if(COCshijian==""){
dao.COCshijian = "0";}
else dao.COCshijian = COCshijian;
String COCzhonglei=request.getParameter("COCzhonglei");
if(COCzhonglei==""){
dao.COCzhonglei = "0";}
else dao.COCzhonglei = COCzhonglei;
String IUDfangzhi=request.getParameter("IUDfangzhi");
if(IUDfangzhi==""){
dao.IUDfangzhi = "0";}
else dao.IUDfangzhi = IUDfangzhi;
String weiliji=request.getParameter("weiliji");
if(weiliji==""){
dao.weiliji = "0";}
else dao.weiliji = weiliji;
String COCchufang=request.getParameter("COCchufang");
if(COCchufang==""){
dao.COCchufang = "0";}
else dao.COCchufang = COCchufang;
String pinlv=request.getParameter("pinlv");
if(pinlv==""){
	dao.pinlv = "0";}
else dao.pinlv = pinlv;
String other=request.getParameter("other");
dao.other = other;
String buliang=request.getParameter("buliang");
dao.buliang = buliang;
String zhidao=request.getParameter("zhidao");
dao.zhidao = zhidao;
String otherzixun=request.getParameter("otherzixun");
if(otherzixun==""){
dao.otherzixun = "0";}
else dao.otherzixun = otherzixun;
String person=request.getParameter("person");
if(person.equals("")){
		person="admin";
		dao.person = "admin";
	}else dao.person = person;
String yisheng=request.getParameter("yisheng");
dao.yisheng = yisheng;
String luoshi=request.getParameter("luoshi");
dao.luoshi = luoshi; 
String shijibiyun=request.getParameter("shijibiyun");
if(shijibiyun==""){
dao.shijibiyun = "0";}
else dao.shijibiyun = shijibiyun;
String COCshijishijian=request.getParameter("COCshijishijian");
if(COCshijishijian==""){
dao.COCshijishijian = "0";}
else dao.COCshijishijian = COCshijishijian;
String IUDshijifangzhi=request.getParameter("IUDshijifangzhi");
if(IUDshijifangzhi==""){
dao.IUDshijifangzhi = "0";}
else dao.IUDshijifangzhi = IUDshijifangzhi;
String COCjianyichufang=request.getParameter("COCjianyichufang");
if(COCjianyichufang==""){
dao.COCjianyichufang = "0";}
else dao.COCjianyichufang = COCjianyichufang;
%>
<script language="javascript">   
function init(){
	window.setInterval("jump()",200);   
} 
function jump(){
	window.location.replace("patient_page.jsp?shuming=<%=person%>");   
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>用户信息录入</title>
</head>
<body>
<center>
       <table style="margin-top:200" width="250" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
         <tr bgcolor="lightgrey" height="30">
            <td align="center">录入状况</td>
         </tr>
         <tr height="50">
            <td align="center">'录入成功，马上转向'
            </td>
         </tr>
       </table>
           
              <script type="text/javascript">
              var mark1 = <%=dao.update_single()%>;
              var mark2 = <%=dao.do_normal()%>;
              var mark3 = <%=dao.do_advise()%>;
              var mark = <%=dao.update_daisuifang()%>;
              if(mark){
              init();
              }
              </script> 
       <a href="patient_page.jsp?shuming=<%=person%>">[返回]</a>
   </center>
</body>
</html>