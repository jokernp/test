<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK" %>
<% request.setCharacterEncoding("GBK") ;%>
<jsp:useBean id="user" class="bean.Users" scope="request" />
<jsp:useBean id="borrow" class="bean.Borrow" scope="request"  />
<jsp:useBean id="book" class="bean.Books" scope="request"  />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改用户信息</title>
<style type="text/css">
#main{
width:1060px;
height:460px;
background:url(images/aa.png);
}
.input {  
    color: #003399; 
    font-family: "宋体"; 
    font-style: normal; 	
    border-color: #93BEE2 #93BEE2 #93BEE2 #93BEE2 ; 
    border: 1px #93BEE2 solid; 
    maxlength: 15;

.title{
	background-color:#B1C8F5;
}
.button {
    font-family: "Tahoma", "宋体";
    font-size: 9pt; color: #003399;
    border: 1px #003399 solid;
    color:#006699;
    border-bottom: #93bee2 1px solid; 
    border-left: #93bee2 1px solid; 
    border-right: #93bee2 1px solid; 
    border-top: #93bee2 1px solid;
    background-color: #e8f4ff;
    cursor: hand;
    font-style: normal ;
}
a {
  background-color: transparent;
  color:#000;  
  font-size: 18px;
  font-weight:bolder;  
  padding-left: 15px;
  text-decoration: none;
}

    
</style>
</head>
<body>
<div id="main">
<table cellSpacing=0 cellPadding=0 width=1024 align="center" bgColor=#ffffff background=pic/top1bg.jpg border=0>
				<tbody>
					<tr>
						<td width=1024>
							&nbsp;
						</td>
					</tr>
					</tbody>
			</table>
<table width="150" valign="center" align="center"><strong><font size="4" color="blue"><br>修改用户信息</font></strong></table><br>
	<form method="post" action="helpEditUser">
<table width="1024" height="48" border="1" cellpadding="0" cellspacing="0" align="center">
 <tr>
		<td height="45" align="center">用&nbsp;户&nbsp;名:</td>
		<td width="400" align="center">请不要更改用户名！<input type="text" name="username" class="input" value="<%=user.getUsername() %>">
		</td>
	</tr>
	<tr>
		<td height="45" align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
		<td width="400" align="center">
		<input type="text" name="password" class="input" value="<%=user.getPassword()%>" ></td>
	</tr>
	<tr>
		<td height="45" align="center">真实姓名:</td>
		<td width="400" align="center">
		<input type="text" name="name" class="input" value="<%=user.getName()%>" ></td>
	</tr>
	<tr>
		<td height="45" align="center">电&nbsp;&nbsp;&nbsp;&nbsp;话:</td>
		<td width="400" align="center">
		<input type="text" name="tel" class="input" value="<%=user.getTel()%>"></td>
	</tr>	
	<tr>
		<td height="45" align="center">权&nbsp;&nbsp;&nbsp;&nbsp;限:</td>
		<td width="400" align="center"><%=user.getLevel()==0 ? "普通用户" : "管理员" %></td>
	</tr>
	<tr>
		<td height="45" align="center">借书记录:</td>
		<td width="400" align="center"><p>所借图书：<%=book.getName() %></p>
		<p>所借时间:<%= borrow.getTime()%></p>
		</td>
	</tr>
	</table>
	<p></p>
	<center>
	<input type="submit" value="修&nbsp;&nbsp;改" class="button"/>
<input type="reset" value="重&nbsp;&nbsp;置" class="button"/>
</center>
	</form>
	<table cellSpacing=0 cellPadding=0 width=1024 align="center" bgColor=#ffffff background=pic/top1bg.jpg border=0>
				<tbody>
					<tr>
						<td width=1024>
							&nbsp;
						</td>
					</tr>
					</tbody>
			</table>		
	</div>
</body>
</html>