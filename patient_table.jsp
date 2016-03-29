<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>精美的表格样式</title>
<style type="text/css">
<!--
body,table{
    font-size:12px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
}
td{
    height:20px;
}
h1,h2,h3{
    font-size:12px;
    margin:0;
    padding:0;
}

.title { background: #FFF; border: 1px solid #9DB3C5; padding: 1px; width:90%;margin:20px auto; }
    .title h1 { line-height: 31px; text-align:center;  background: #2F589C url(th_bg2.gif); background-repeat: repeat-x; background-position: 0 0; color: #FFF; }
        .title th, .title td { border: 1px solid #CAD9EA; padding: 5px; }


/*这个是借鉴一个论坛的样式*/
table.t1{
    border:1px solid #cad9ea;
    color:#666;
}
table.t1 th {
    background-image: url(th_bg1.gif);
    background-repeat::repeat-x;
    height:30px;
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
    color:#666;
}
table.t2 th {
    background-image: url(th_bg2.gif);
    background-repeat::repeat-x;
    height:30px;
    color:#fff;
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

-->
</style>
<script type="text/javascript">
    function ApplyStyle(s){
        document.getElementById("mytab").className=s.innerText;
    }
</script>
</head>

<body>
<div class="title">
    <h1>大家好，CSS与表格的结合示例</h1>
    <table><tr><td>
        点击链接切换样式：<a href="javascript:;" onclick="ApplyStyle(this)">t1</a>
        <a href="javascript:;" onclick="ApplyStyle(this)">t2</a>
        <a href="javascript:;" onclick="ApplyStyle(this)">t3</a>
    </td></tr></table>
</div>
<table width="90%" id="mytab"  border="1" class="t1">
  <thead>
    <th width="10%">网名</th>
    <th width="30%">博客</th>
    <th width="20%">电邮</th>
    <th width="30%">网络硬盘</th>
    <th width="10%">QQ</th>
  </thead>
  <tr class="a1">
    <td>wallimn</td>
    <td>http://blog.csdn.net/wallimn</td>
    <td>wallimn@tom.com</td>
    <td>http://wallimn.ys168.com</td>
    <td>54871876</td>
  </tr>
  <tr>
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr class="a1">
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr>
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr class="a1">
    <td>wallimn</td>
    <td>http://blog.csdn.net/wallimn</td>
    <td>wallimn@tom.com</td>
    <td>http://wallimn.ys168.com</td>
    <td>54871876</td>
  </tr>
  <tr>
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr class="a1">
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
  <tr>
    <td>长三江</td>
    <td>村在</td>
    <td>北京天安门</td>
    <td>东四十条</td>
    <td>21345678</td>
  </tr>
</table>

</body>
</html>