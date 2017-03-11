<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="help.helpControlBooks" %>
<%@ page import="database.DatabaseConn" %>
<%@ page import="bean.*" %>
<%@ page import="mybean.data.*" %>
<%@ page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding("GBK") ;%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户图书列表</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <%Login login=(Login)session.getAttribute("login");
  	helpControlBooks hcb = new helpControlBooks();
  	Books books = new Books();
  	Borrow borrow = new Borrow();
  	Calendar cal = Calendar.getInstance();
  	String ye = String.valueOf(cal.get(Calendar.YEAR)); 
  	String mo = String.valueOf(cal.get(Calendar.MONTH));
  	String da = String.valueOf(cal.get(Calendar.DATE));
  	String ti=ye+"."+mo+"."+da;
  	borrow.setTime(ti);
  	if(login.getUsername()!=null&&login.getUsername()!="youke"){
  	borrow.setUsername(login.getUsername());
  	int j = 0;
  	boolean b = false;
  	String id = request.getParameter("id");	
  	if(id != null){	
		books = hcb.getAllBooks(id);	
		j = books.getNumber();
		if(j == 0){
		%>
		<script>
		alert("对不起，此书已经全部借出!");
	</script>
		<% 
		}
		if(j != 0){
			j=j-1;
			b = hcb.updateNumber(Integer.parseInt(id),j);
			if(j==0){b = hcb.updateState(Integer.parseInt(id),0);}
			%>
   		<script>
		alert("借书成功！");
	</script>
   		<% 
		}
		if(b == true){			
		borrow.setId(Integer.parseInt(id));
  			int borr=hcb.insertDate(borrow);
   		}
   		}
   		}else{
   		%>
   		<script>
		alert("未登录，不能完成该操作");
		window.location.href = "login.jsp";
	</script>
	<%} %>
  <body>
  <table cellSpacing=0 cellPadding=0 width=1024 align="center" bgColor=#ffffff background=pic/top1bg.jpg border=0>
				<tbody>
					<tr>
						<td width=1024>&nbsp; 
						</td>
					</tr>
					</tbody>
			</table>
    <table width="150"><center><font color="blue" size="4"><strong><br>借书列表</strong></font></center></table>
    <br>
    <table cellSpacing=0 cellPadding=0 width=1024 align="center" bgColor=#ffffff background=pic/top1bg.jpg border=0>
				<tbody>
					<tr>
						<td width=1024>
							&nbsp;
						</td>
					</tr>
					</tbody>
			</table>
			<p></p>
  <form method="post" action="borrow.jsp">
<table width="1024" height="48" border="1" cellpadding="0" cellspacing="0" align="center">
  <tr class="title">
  <td scope="col" align="center" width="160" height="35">图书封面</td>
  	<td scope="col" align="center" width="160" height="35">编号</td>
    <td scope="col" align="center" width="160" height="35">图书类型</td>
    <td scope="col" align="center" width="160" height="35">书名</td>
    <td scope="col" align="center" width="160" height="35">作者</td>
    <td scope="col" align="center" width="160" height="35">出版社</td>
    <td scope="col" align="center" width="80" height="35">定价</td>
    <td scope="col" align="center" width="160" height="35">数量</td>
    <td scope="col" align="center" width="80" height="35">在馆状态</td>
    <td scope="col" align="center" width="80" height="35">操作</td>
  </tr>
  <%     
  	
  	ArrayList<String> arr=hcb.getBooksId();
	int currPage = 1;
	if (request.getParameter("page") != null) {
    	currPage = Integer.parseInt(request.getParameter("page"));
	}
   	int totalRow = arr.size();
   	int pageSize = 5;
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
	int s=i+1;
  %>
  <tr>
  <td>
  <div><img src="pic/<% if(s<=12){
  out.print(s);}
  else{out.print("12");}%>.jpg"/ width=200,height=200;></div></td>
		<td height="40" align="center"><%=hcb.getAllBooks(arr.get(i)).getId()%></td>
		<td align="center" height="35"><%=hcb.getAllBooks(arr.get(i)).getType()%></td>
		<td align="center" height="35"><a href=helpShowBook?id=<%=hcb.getAllBooks(arr.get(i)).getId() %>><%=hcb.getAllBooks(arr.get(i)).getName()%></a></td>
		<td align="center" height="35"><%=hcb.getAllBooks(arr.get(i)).getAuthor()%></td>			
		<td align="center" height="35"><%=hcb.getAllBooks(arr.get(i)).getPress()%></td>
		<td align="center" height="35"><%=hcb.getAllBooks(arr.get(i)).getPrice()%></td>
		<td align="center" height="35"><%=hcb.getAllBooks(arr.get(i)).getNumber()%></td>		
		<td align="center" height="35"><%=hcb.getAllBooks(arr.get(i)).getState() == 0 ? "全借出" : "<font color='red'>有在馆</font>" %></td>
		<td align="center" height="35"><a href = "borrow.jsp?id=<%=hcb.getAllBooks(arr.get(i)).getId()%>">借书</a></td>
	</tr>
	<%
	  }
	%>
	</table>
	<br/><br/><br/><br/>
	<p align="center">共&nbsp;<%= totalPage%>&nbsp;页 　第&nbsp;&nbsp;<%= currPage %>&nbsp;&nbsp;页　 　
	<a href="borrow.jsp?page=1">首页</a>
	<%	
		if (currPage <= 1) {
	   		currPage = 1;
	%>
		上一页 
	<% 
		} else {
	%>
		<a href="borrow.jsp?page=<%=currPage - 1%>">上一页 </a>
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
		<a href="borrow.jsp?page=<%=currPage + 1%>">下一页 </a>
	<%
		}
	%>
	<a href="borrow.jsp?page=<%=totalPage %>">尾页</a> 
	</p>
</form>
  </body>
</html>
