<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="mybean.data.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <%
 Login login=(Login)session.getAttribute("login"); 
%>
	<link href="frame.css" rel="Stylesheet" type="text/css" />
	<link href="menu.css" rel="Stylesheet" type="text/css" />
	

  <style type="text/css">
body
{
margin: 0;
padding: 0;
border: 0;
overflow: hidden;
height: 100%;
max-height: 1000px;
border:1px solid black;
}
</style>
<script language="javascript" type="text/javascript">
function SetWinHeight(obj)
{
var win=obj;
if (document.getElementByIdx_x)
{
if (win && !window.opera)
{
if (win.contentDocument && win.contentDocument.body.offsetHeight)
win.height = win.contentDocument.body.offsetHeight;
else if(win.Document && win.Document.body.scrollHeight)
win.height = win.Document.body.scrollHeight;
}
}
}
</script>
<script type="text/javascript">
function show(id)
{
if(document.getElementById(id).style.display=="")
{
document.getElementById(id).style.display="none";
}
else
{
document.getElementById(id).style.display="";
}
}
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="framecontentLeft">
<div class="menu">
<ul>
<li><h3>欢迎</h3></li>
  <li><%=login.getUsername()%>，你好</li>
</ul>
<ul><a href="javascript:show('d2')">图书信息</a></ul>
<ul id="d2" style="display:none">
  <li><a href="booksList.jsp" target="content">>查看所有图书</a></li>
</ul>
<ul><a href="javascript:show('d3')">用户操作</a></ul>
<ul id="d3" style="display:none">
<li><a href="userinfor.jsp" target="content">>查看个人信息</a></li>
  <li><a href="helpEditUser?username=<%=login.getUsername()%>" target="content">>修改个人信息</a></li>
  <li><a href="findBook.jsp" target="content">>查找图书</a></li>
  <li><a href="borrow.jsp" target="content">>借书</a></li>
</ul>
<ul><a href="javascript:show('d4')">管理员操作</a></ul>
<ul id="d4" style="display:none">
  <li><a href="addBooks.jsp"  target="content">>添加图书</a></li>
  <li><a href="showBorrow.jsp"  target="content">>借出图书列表</a></li>
   <li><a href="usersList.jsp"  target="content">>查看用户列表</a></li>
  <li><a href="booksList.jsp"  target="content">>查看图书列表</a></li>
</ul>
</div>
</div>
<div id="framecontentTop">
<div style="text-align: center;">
<div style="float: right;">
<a href="helpExit">退出</a>
</div>
<h1>
图书管理系统
</h1>
</div>
</div>
<div id="maincontent">
<iframe id="content" name="content" onload="Javascript:SetWinHeight(this)" frameborder="0"
scrolling="yes" width="100%" height="500px"></iframe>
</div>
</form>
</body>
</html>
