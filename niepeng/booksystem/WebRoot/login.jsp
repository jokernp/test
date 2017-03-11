<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html;charset=GBK" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<style type="text/css">
	#main{
	width:550px;
	height:306px;
	margin-top:90px;
	margin-left:120px;
	
	}
	#pic{
	width:600px;
	height:380px;
	margin-top:50px;
	
	background:url(images/13.jpg);
	
	}
	#image{
	width:310px;
	height:300px;
	position: fixed;
	top:230px;
	left:700px;
	
	background:url(images/denglu.jpg);
	}
	
	 #login{
  	width:280px;
  	height:180px;
  	
  	}
  	#login ul{
	margin: 0px; 
	padding: 0px; 
	margin-left:20px;
	margin-top:30px;
	}
	#login ul li{
	list-style:none;
	line-height:50px;
	font-size:16px;
	background:none;
	}
	#login ul li.a{
	font-size:30px;
	}
	</style>

  </head>
  
  <body>
	<div style="text-align: center;">
	<font size="36"> 
	图书管理系统 
	</font>
	</div>
	<div id="main">
	<div id="pic"></div>
	<div id="image">
	 <div id="login">
<ul>
<li class="a">用户登录</li>
  <form action="helpLogin" method="post" style="background:none;">
  <li>用 户 名：<input type="text" name="username" style="height:34px;background:none;"> </li>
  <li>用户密码：<input type="password" name="psd" style="height:34px;background:none;"></li>
  <li><input type="submit" name="tijiao" value="登   录" style="width:150px;height:40px;">
<a href="zhuce.jsp" target="content"> 新用户注册</a>
  </li>
  <center><a href="helpTiaozhuan">游客登录</a></center>
  </form>
  </ul>
</div>
	</div>
	</div>
	
   
  </body>
</html>
