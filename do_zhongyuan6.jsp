<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*,java.lang.*" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" scope="page" class="PAC.ConnDB"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<%
	request.setCharacterEncoding("utf-8");
  	String name=request.getParameter("name");
	dao.name = name;
	String date=request.getParameter("date");
	dao.date = date;
	String num=request.getParameter("num");
	dao.num = num;
	String tel=request.getParameter("tel");
	dao.tel = tel;
	String fangshi=request.getParameter("fangshi");
	dao.fangshi = fangshi;
	String liuchanbiyun=request.getParameter("liuchanbiyun");
	if(liuchanbiyun==""){
		dao.liuchanbiyun = "0";
	}else dao.liuchanbiyun = liuchanbiyun;
	String COCshijian=request.getParameter("COCshijian");
	if(COCshijian==""){
		dao.COCshijian = "0";
	}else dao.COCshijian = COCshijian;
	String COCchufang=request.getParameter("COCchufang");
	if(COCchufang==""){
		dao.COCchufang = "0";
	}else dao.COCchufang = COCchufang;
	String COCjianchi=request.getParameter("COCjianchi");
	if(COCjianchi==""){
		dao.COCjianchi = "0";
	}else dao.COCjianchi = COCjianchi;
	String COCjixu=request.getParameter("COCjixu");
	if(COCjixu==""){
		dao.COCjixu = "0";
	}else dao.COCjixu = COCjixu;
	String COCqudao=request.getParameter("COCqudao");
	if(COCqudao==""){
		dao.COCqudao = "0";
	}else dao.COCqudao = COCqudao;
	String COCyuanyin=request.getParameter("COCyuanyin");
	if(COCyuanyin==""){
		dao.COCyuanyin = "0";
	}else dao.COCyuanyin = COCyuanyin;
	String qitaCOCyuanyin=request.getParameter("qitaCOCyuanyin");
	if(qitaCOCyuanyin==""){
		dao.qitaCOCyuanyin = "0";
	}else dao.qitaCOCyuanyin = qitaCOCyuanyin;
	String IUDfangzhi=request.getParameter("IUDfangzhi");
	if(IUDfangzhi==""){
		dao.IUDfangzhi = "0";
	}else dao.IUDfangzhi = IUDfangzhi;
	String IUDjianchi=request.getParameter("IUDjianchi");
	if(IUDjianchi==""){
		dao.IUDjianchi = "0";
	}else dao.IUDjianchi = IUDjianchi;
	String IUDyuanyin=request.getParameter("IUDyuanyin");
	if(IUDyuanyin==""){
		dao.IUDyuanyin = "0";
	}else dao.IUDyuanyin = IUDyuanyin;
	String qitaIUDyuanyin = request.getParameter("qitaIUDyuanyin");
	if(qitaIUDyuanyin==""){
		dao.qitaIUDyuanyin = "0";
	}else dao.qitaIUDyuanyin = qitaIUDyuanyin;
	String huanyongbiyun = request.getParameter("huanyongbiyun");
	if(huanyongbiyun==""){
		dao.huanyongbiyun = "0";
	}else dao.huanyongbiyun = huanyongbiyun;
	String huanyongCOC = request.getParameter("huanyongCOC");
	if(huanyongCOC==""){
		dao.huanyongCOC = "0";
	}else dao.huanyongCOC = huanyongCOC;
	String huanyongIUD = request.getParameter("huanyongIUD");
	if(huanyongIUD==""){
		dao.huanyongIUD = "0";
	}else dao.huanyongIUD = huanyongIUD;
	String huanyongCOCchufang = request.getParameter("huanyongCOCchufang");
	if(huanyongCOCchufang==""){
		dao.huanyongCOCchufang = "0";
	}else dao.huanyongCOCchufang = huanyongCOCchufang;
	String yuanyigaoxiao = request.getParameter("yuanyigaoxiao");
	if(yuanyigaoxiao==""){
		dao.yuanyigaoxiao = "0";
	}else dao.yuanyigaoxiao = yuanyigaoxiao;
	String gaoxiaobiyun = request.getParameter("gaoxiaobiyun");
	if(gaoxiaobiyun==""){
		dao.gaoxiaobiyun = "0";
	}else dao.gaoxiaobiyun = gaoxiaobiyun;
	String gaoxiaozhonglei = request.getParameter("gaoxiaozhonglei");
	if(gaoxiaozhonglei==""){
		dao.gaoxiaozhonglei = "0";
	}else dao.gaoxiaozhonglei = gaoxiaozhonglei;
	String gaoxiaoshijian = request.getParameter("gaoxiaoshijian");
	if(gaoxiaoshijian==""){
		dao.gaoxiaoshijian = "0";
	}else dao.gaoxiaoshijian = gaoxiaoshijian;
	String gaoxiaochufang = request.getParameter("gaoxiaochufang");
	if(gaoxiaochufang==""){
		dao.gaoxiaochufang = "0";
	}else dao.gaoxiaochufang = gaoxiaochufang;
	String gaoxiaofangzhi = request.getParameter("gaoxiaofangzhi");
	if(gaoxiaofangzhi==""){
		dao.gaoxiaofangzhi = "0";
	}else dao.gaoxiaofangzhi = gaoxiaofangzhi;
	String feigaoxiao = request.getParameter("feigaoxiao");
	if(feigaoxiao==""){
		dao.feigaoxiao = "0";
	}else dao.feigaoxiao = feigaoxiao;
	String qitafeigaoxiao = request.getParameter("qitafeigaoxiao");
	if(qitafeigaoxiao==""){
		dao.qitafeigaoxiao = "0";
	}else dao.qitafeigaoxiao = qitafeigaoxiao;
	String yiwai=request.getParameter("yiwai");
	if(yiwai==""){
		dao.yiwai = "0";
	}else dao.yiwai = yiwai;
	String renshen=request.getParameter("renshen");
	if(renshen==""){
		dao.renshen = "0";
	}else dao.renshen = renshen;
	String yiyuanrenshen=request.getParameter("yiyuanrenshen");
	if(yiyuanrenshen==""){
		dao.renshen = "0";
	}else dao.yiyuanrenshen = yiyuanrenshen;
	String zhongzhi=request.getParameter("zhongzhi");
	if(zhongzhi==""){
		dao.zhongzhi = "0";
	}else dao.zhongzhi = zhongzhi;
	String person=request.getParameter("person");
	if(person.equals("")){
		person = "admin";
		dao.person = "admin";
	}else dao.person = person;
	String method=request.getParameter("method");
%>
<script language="javascript">   
function init(){
	window.setInterval("jump()",0);   
} 
function jump(){
	var url = "";
	var method = '<%=method%>';
	if(method=="patient")
		url = "patient_page.jsp?shuming=<%=person%>";
	else if(method=="suifang")
		url = "daisuifang_n6.jsp?shuming=<%=person%>";
	//window.location.href = url;
	window.location.replace(url);   
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
           <%if(dao.fangshi.equals("0"))
           		{
        	   		dao.set_unconnect("6");
           		}
           else{
        	   dao.executeInsert_zhongyuan6();
        	   dao.set_complete("6");
           }%>
              <script type="text/javascript">
              jump();
              </script> 
       <a href="daisuifang_n6.jsp?shuming=<%=person%>&method=suifang">[点击继续]</a>
   </center>
</body>
</html>