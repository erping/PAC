<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="PAC.ConnDB" scope="page"/>
<html>
<head>
<title>
患者信息显示图表
</title>
</head>
<body bgcolor="#ffffff">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="16%">&nbsp;</td>
    <td width="68%"><table width="100%" bgcolor="#FFCCCC"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="96%">&nbsp;</td>
        <td width="2%">&nbsp;</td>
      </tr>
      <tr align="center">
        <td colspan="3">患者信息量统计</td>
        </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%"  border="1" cellspacing="0" cellpadding="4">
          <tr align="center" bgcolor="#CCFFCC">
            <td>序号</td>
            <td>日期</td>
            <td>统计模块</td>
            <td>0-4</td>
            <td>5-8</td>
            <td>9-12</td>
            <td>13-16</td>
            <td>17-20</td>
            <td>21-24</td>
            <td>图表统计</td>
          </tr>
          <%
          String sql="select * from patient_info order by age";
          ResultSet rs=db.executeQuery(sql);
          try{
            int i=0;
            while(rs.next()){
              i+=1;
          %>
          <tr align="center" bgcolor="#CCFF66">
            <td bgcolor="#CCFFCC"><%=i %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
            <td><%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
            <td><a href="statistics.jsp?id=<%=rs.getString(1) %>">查看</a></td>
          </tr>
          <%
            }
          }catch(Exception e){
          }
          db.closeConnection();
          %>
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
    </table></td>
    <td width="16%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
