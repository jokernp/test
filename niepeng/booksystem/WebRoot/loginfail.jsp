<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="mybean.data.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'localfail.jsp' starting page</title>
    
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
  	margin-top:100px;
  	margin-left:160px;
	width:396px;
	height:312px;

	background:url(images/9.png);
  }
  #fail{
  	width:340px;
  	height:220px;
  	top:160px;
  	left:580px;
  	position:absolute ;
  
  }
  </style>
	<% Login login=null;
login=(Login)session.getAttribute("login"); %>

  </head>
  
  <body>
  
  <div id="image"></div>
  <div id="fail">
  <center>
  <h1><font color="blue">登录失败</font></h1>
  <h4><%=login.getBackNews() %></h4>
  <h4>没注册？？？<a href="zhuce.jsp" >去注册</a></h4>
  <h4>用户名错误or密码错误？？？<a href="login.jsp">重新登录</a></h4>
  </center>
  </div>
 
  </body>
</html>
