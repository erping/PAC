<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<title>navigation</title>
</head>
<style>
*{ margin:0; padding:0;}
.con{ height:40px; width:100%; overflow:hidden; position:relative; background:#9fc;}
.nav_u{ height:26px; font:22px/26px "宋体"; font-style:italic; font-weight:bold; color:#333; position:relative;}
.nav_d{ height:14px; font:12px/12px "宋体"; color:#333; position:relative;}
.pos{position:relative; left:200px;}
.con a{ text-decoration:none; display:block; color:#666}
.nav_ub{ width:100%; height:26px; position:absolute; top:0px;  background:#fff;}
.nav_db{ width:100%; height:14px; position:absolute; bottom:0px; background:#fff;}
</style>
<script src="jquery-1.3.2.min.js"></script>
<script>
$(document).ready(function(){
	$(".con").prepend('<div class="nav_ub"></div><div class="nav_db"></div>')
	$(".con").hover(function(){
		$(this).children(".nav_ub").stop().animate({top:-26},300);
		$(this).find(".pos").stop().animate({left:220},250);
		$(this).children(".nav_db").stop().animate({bottom:-14},300);
		$(this).find(".pos").stop().animate({left:220},250);
	},function(){
		$(this).children(".nav_ub").stop().animate({top:0},300);
		$(this).find(".pos").stop().animate({left:200},250);
		$(this).children(".nav_db").stop().animate({bottom:0},300);
		$(this).find(".pos").stop().animate({left:200},250);
	});
})
</script>
<body>
	<div class="con">
        <div class="nav_u"><a class="pos" href="#">病人信息录入</a></div>
        <div class="nav_d"><a class="pos" href="#">aaaaa</a></div>
    </div>
    <div class="con">
    	<div class="nav_u"><a class="pos" href="#">当日待随访名单</a></div>
        <div class="nav_d"><a class="pos" href="#">bbbbb</a></div>
    </div>
    <div class="con">
    	<div class="nav_u"><a class="pos" href="#">病人列表</a></div>
        <div class="nav_d"><a class="pos" href="#">ccccc</a></div>
    </div>
    <div class="con">
    	<div class="nav_u"><a class="pos" href="#">统计信息</a></div>
        <div class="nav_d"><a class="pos" href="#">aabbcc</a></div>
    </div>
</body>
</html>