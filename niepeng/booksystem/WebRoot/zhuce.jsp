<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zhuce.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <style type="text/css">
  #image{
  	width:480px;
  	height:540px;
  	position:absolute;
  	top:50px;
  	left:150px;
  	background:url(images/bb.png);
  }
  #main{
	width:400px;
	height:500px;
	position:absolute ;
	top:110px;
	left:680px;
  }
#main ul{
	list-style: none;
}
#main ul li.a{
	font-size:30px;
	line-height:50px;
}
#main ul li.b{
	line-height:30px;
}
#main ul li.c{
	font-size:35px;
}
#main ul li{
	line-height:50px;
}
  </style>
 </head>

 <body bgcolor="#F7F7F7">
  <div id="image"></div>
  <div id="main">
  <form action="helpRegister" name=form>
  <ul>
  <li class="a"><font color="blue">用户注册</font></li>
  <li><hr width="80%" size="3" align="left" color="#E1E1E1"></li>
  </li>
  <li>用&nbsp;户&nbsp;名：<input type="text" name="username" style="width:190px;height:25px;"></li>
  <li>创建密码：<input type="password" name="psd" style="width:190px;height:25px;"> </li>
  <li>真实姓名：<input type="text" name="name" style="width:190px;height:25px;"> </li>
  <li>联系电话：<input type="text" name="usertele" style="width:190px;height:25px;"></li>
  <li class="c"><input type="submit" name="g" value="确&nbsp;定&nbsp;注&nbsp;册" style="width:270px;height:40px;"></li>
  <li class="c"><input type="reset" name="g" value="重&nbsp;新&nbsp;注&nbsp;册" style="width:270px;height:40px;"></li>
  </ul>
  </form>
  </div>
 </body>
</html>

