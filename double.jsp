<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
 <meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
 <meta http-equiv="expires" content="0">    
 
 <%
  /*
   �����˵���ʽ�������ajax��������ҳ����ʾ�ĸ��Ѻã�����ʹ��javascript��ʾ
   �Ѿ�����ͨ���������밴������
   
  */
  
  /*-------------------------Method----------------------------*/
  
  /*��һ���˵� ��װ��Map���ϣ�����ҳ��ȡֵ*/
  Map<String,String> mapOne = new HashMap<String,String>();
  mapOne.put("choose","choose");
  mapOne.put("A","A");
  mapOne.put("B","B");
 %>
 
 <!-- ��javascript������ɶ��������˵� -->
 <script type="text/javascript">
  /*�����������飬�Ա���𣬾��������Ӧ����ͨ��ײ㷵��һ��list*/
  var one = new Array("white","red","yellow");
  var two = new Array("black","blue","gray");

  /*�ú�����ƶ�����������*/
  function specieSelChange(selBox)
  {
   /*
    ��Щ�����Ҫ����ݿ���ȡ����û��������ݿ⣬�����Լ��ⶨ��ݣ���ݷ�װ��ݾ��������
    ���ǵڶ����˵�����Ҫ�����Ĳ˵�
   */
   var str = null;
   
   var s = null;
   
   if(selBox.value == "choose")
   {
   }
   
   
   else if(selBox.value == "A")
   {
   	str = "二级";
   	s = "输入";
  	str += "<select>";
    for(var i = 0; i < one.length; i ++)
    {
     str += "二级联动下拉框:" + "<option>" + one[i] + "</option>";
    }
    s += "<a>" + 1 + "<input>" + "</input>" + "</a>";
    str += "</select>";

   }
   else if(selBox.value == "B")
   {
  	str = "二级";
   	s = "输入";
   	str += "<select>";
    for(var i = 0; i < two.length; i ++)
    {
     str += "二级联动下拉框:" + "<option>" + two[i] + "</option>";
    }
     s += "<a>" + 2 + "<input>" + "</input>" + "</a>";
     str += "</select>";
   }

   document.all('Linkage').innerHTML = str;
   document.all('Linkinput').innerHTML = s;
  }
 </script>
 
  </head>
  
  <body>
  
    <!-- 页面开始解析数据   首先是第一个下拉框-->
    <table border="0" align="center" style="font-size: 12px;">
     <tr>
      <td>type:</td>
      <td>
       <!-- 页面使用循环取出数据 如果需要更标准，请使用jstl标签，或者struts标签 -->
       <select id="SpecieSel" onchange="specieSelChange(this)">
       <%
        Iterator it = mapOne.entrySet().iterator();
        while(it.hasNext()){
         Map.Entry entry = (Map.Entry)it.next();
       %>
         <option value="<%=(String)entry.getKey() %>">
          <%=(String)entry.getValue() %>
         </option>
       <%} %>
       </select>
      </td>
     </tr>
     <!-- 第二个下拉框，开始执行二级联动 -->
     <tr>
      <td>
       
      </td>
      <td id="Linkage">
       <!-- 该下拉框，使用自动生成 -->
       
      </td>
      </tr>
      <tr>
      <td id="Linkinput">
      
      	
      </td>
     </tr>
    </table>
  </body>
</html>
