<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@page import="help.helpControlUsers"%>
<%@ page import="database.DatabaseConn" %>
<%@ page import="bean.Users" %>
<%@ page import="mybean.data.*" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("GBK") ;%>
<html>
  <head>
    <title>用户管理</title>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
  </head>
  <%Login login=(Login)session.getAttribute("login");
  if(login.getUsername()!=null&&login.getLevel()!=0){
	helpControlUsers us = new helpControlUsers(); 
	Users users = new Users();
%>  
<body><table cellSpacing=0 cellPadding=0 width=1024 align="center" bgColor=#ffffff background=pic/top1bg.jpg border=0>
				<tbody>
					<tr>
						<td width=1024>
							&nbsp;
						</td>
					</tr>
					</tbody>
			</table>
<table width="150" valign="center" align="center"><strong><font size="4" color="blue"><br>用户列表</font></strong></table><br>
			<form method="post" action="helpControlUser">
<form method="post" action="usersList.jsp">			
<table width="1024" height="48" border="1" cellpadding="0" cellspacing="0" align="center">
<tr class="title">
    <td scope="col" align="center" width="160" height="35">用&nbsp;户&nbsp;名</td>
    <td scope="col" align="center" width="160" height="35">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
    <td scope="col" align="center" width="160" height="35">真实姓名</td>
     <td scope="col" align="center" width="160" height="35">联系电话</td>
    <td scope="col" align="center" width="160" height="35">管&nbsp;理&nbsp;员</td>
    <td scope="col" align="center" width="160" height="35">修改权限</td>
    <td scope="col" align="center" width="160" height="35">编辑用户</td>
    <td scope="col" align="center" width="160" height="35">删&nbsp;&nbsp;除</td>
  </tr>
   <%  	  	
  	helpControlUsers hcu =new helpControlUsers();
  	ArrayList<String> arr=hcu.getUsersArrayList();
	int currPage = 1;
	if (request.getParameter("page") != null) {
    	currPage = Integer.parseInt(request.getParameter("page"));
	}
   	int totalRow = arr.size();
   	int pageSize = 7;
   	int totalPage = (totalRow % pageSize) == 0 ? totalRow / pageSize:(totalRow / pageSize) + 1;
	if (currPage == 0) {
    	currPage = 1;
   	}
   	if (currPage > totalPage) {
    	currPage = totalPage;
   	}
	int start = (currPage - 1) * pageSize;
   	int end = currPage * pageSize - 1;
   	if (currPage == totalPage) {
    	end = totalRow - 1;
   	}
    if(totalRow == 0) {
    	start = 1;
    	end = 0;
   	}
	for (int i = start; i <= end; i++) {
  %>
  <tr>
		<td align="center" height="35"><%=hcu.getAllUsers(arr.get(i)).getUsername() %></td>
		<td align="center" height="35"><%=hcu.getAllUsers(arr.get(i)).getPassword() %></td>
		<td align="center" height="35"><%=hcu.getAllUsers(arr.get(i)).getName() %></td>
		<td align="center" height="35"><%=hcu.getAllUsers(arr.get(i)).getTel() %></td>
		<td align="center" height="35"><%=hcu.getAllUsers(arr.get(i)).getLevel() == 0 ? "否" : "<font color='red'>是</font>" %></td>
		<td align="center" height="35"><a href ="helpControlUser?username=<%=hcu.getAllUsers(arr.get(i)).getUsername()%>">修改</a></td>
		<td align="center" height="35"><a href ="helpEditUser?username=<%=hcu.getAllUsers(arr.get(i)).getUsername()%>">编辑</a></td>
		<td align="center" height="35"><input type="checkbox" name="checkbox" value="<%=hcu.getAllUsers(arr.get(i)).getUsername()%>"></td>
	</tr>
	
	<%
	  }
	%>
</table>
<br/>
<center><input type="submit" class="button" name="Submit" value="删除选中"></center>
<br/>	
	<p align="center">共&nbsp;<%= totalPage%>&nbsp;页 　第&nbsp;&nbsp;<%= currPage %>&nbsp;&nbsp;页　 　
	<a href="usersList.jsp?page=1">首页</a>
	<%	
		if (currPage <= 1) {
	   		currPage = 1;
	%>
		上一页 
	<% 
		} else {
	%>
		<a href="usersList.jsp?page=<%=currPage-1%>">上一页 </a>
	<%
		}
	%>
	<%
		if (currPage >= totalPage) {
	 		currPage = totalPage;
	%>
		下一页 
	<% 
		}else{
	%>
		<a href="usersList.jsp?page=<%=currPage+1%>">下一页 </a>
	<%
		}
	%>
	<a href="usersList.jsp?page=<%=totalPage %>">尾页</a>
	</p>
	</form>
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
	<%}
	else{
   		%>
   		<script language="javascript">
  		alert("你所在用户组没有权限查看该页面！"); 
  	</script> 
  <%} %>
  </body>
</html>
