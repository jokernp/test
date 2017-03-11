<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="help.helpControlBooks" %>
<%@ page import="help.helpControlUsers" %>
<%@ page import="database.DatabaseConn" %>
<%@ page import="bean.*" %>
<%@ page import="mybean.data.*" %>
<%@ page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding("GBK") ;%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>归还图书</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <%
  Login login=(Login)session.getAttribute("login");
  			if(login.getUsername()!=null&&login.getLevel()!=0){
  	helpControlBooks hcb = new helpControlBooks();
  	Books books = new Books();
  	Borrow borrow = new Borrow();
  	int j = 0;
  	String id = request.getParameter("id");	
  	String username= request.getParameter("username");
  	if(id != null){	
		books = hcb.getAllBooks(id);	
		j = books.getNumber();
		
			j=j+1;
		boolean	b = hcb.updateNumberIn(Integer.parseInt(id),j);
		if(b == true){	
		borrow.setId(Integer.parseInt(id));
		borrow.setUsername(username);
  			hcb.deleteDate(borrow);		
  %>
  <script language="javascript">
  		alert("还书操作成功！!"); 
  	</script> 			
  <%		}
   		}
   		%>
  <body>
  <table cellSpacing=0 cellPadding=0 width=1024 align="center" bgColor=#ffffff background=pic/top1bg.jpg border=0>
				<tbody>
					<tr>
						<td width=1024>
							&nbsp;
						</td>
					</tr>
					</tbody>
			</table>
<table width="150" valign="center" align="center"><strong><font size="4" color="blue"><br>出书列表</font></strong></table><br>
	<p></p>
  <form method="post" action="showBorrow.jsp">
<table width="1024" height="48" border="1" cellpadding="0" cellspacing="0" align="center">
  <tr class="title">
  <td scope="col" align="center" width="160" height="35">借书人</td>
  	<td scope="col" align="center" width="160" height="35">图书编号</td>
  	<td scope="col" align="center" width="160" height="35">书名</td>
    <td scope="col" align="center" width="160" height="35">借书时间</td>
    <td scope="col" align="center" width="80" height="35">操作</td>
  </tr>
  <%     
  	
  	ArrayList<String> arr=hcb.getBooksBorrow();
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
		<td align="center" height="35"><%=hcb.getBorrowDate(arr.get(i)).getUsername()%></td>			
		<td align="center" height="35"><%=hcb.getBorrowDate(arr.get(i)).getId()%></td>
		<td align="center" height="35"><%=hcb.getAllBooks(arr.get(i)).getName()%></td>
		<td align="center" height="35"><%=hcb.getBorrowDate(arr.get(i)).getTime()%></td>			
		<td align="center" height="35"><a href = "showBorrow.jsp?id=<%=hcb.getBorrowDate(arr.get(i)).getId()%>&username=<%=hcb.getBorrowDate(arr.get(i)).getUsername() %>">还书</a></td>
	</tr>
	<%
	  }
	%>
	</table>

	<p align="center">共&nbsp;<%= totalPage%>&nbsp;页 　第&nbsp;&nbsp;<%= currPage %>&nbsp;&nbsp;页　 　
	<a href="showBorrow.jsp?page=1">首页</a>
	<%	
		if (currPage <= 1) {
	   		currPage = 1;
	%>
		上一页 
	<% 
		} else {
	%>
		<a href="showBorrow.jsp?page=<%=currPage - 1%>">上一页 </a>
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
		<a href="showBorrow.jsp?page=<%=currPage + 1%>">下一页 </a>
	<%
		}
	%>
	<a href="showBorrow.jsp?page=<%=totalPage %>">尾页</a> 
	</p>
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
<% 
}
   		else{
   		%>
   		<script language="javascript">
  		alert("你所在用户组权限查看该页面！"); 
  	</script> 
  <%} %>
  </body>
</html>
