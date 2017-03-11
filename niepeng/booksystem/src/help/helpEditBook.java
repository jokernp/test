package help;
import bean.*;
import database.DatabaseConn;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
public class helpEditBook extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
		
	}
	public String handleString(String s){
		try{
			byte bb[]=s.getBytes("iso-8859-1");
			s=new String(bb);
		}
		catch(Exception ee){
		}
		return s;
		}
	public void doPost(HttpServletRequest request,HttpServletResponse
			response) throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		DatabaseConn conn = new DatabaseConn();
		Books book=new Books();
		request.setAttribute("book",book);
		int id=Integer.parseInt(request.getParameter("id")),
		price=Integer.parseInt(request.getParameter("price")),
		number=Integer.parseInt(request.getParameter("number")),
		state=Integer.parseInt(request.getParameter("state"));
		String type=handleString(request.getParameter("type")),
		name=handleString(request.getParameter("name")),
		author=handleString(request.getParameter("author")),
		press=handleString(request.getParameter("press")),
		time=handleString(request.getParameter("time")),
		remark=handleString(request.getParameter("remark")),
		js=handleString(request.getParameter("js"));
				//加handleString解决了提交到数据库乱码的问题
		int i = 0;
		String sql = "UPDATE books SET " +"id='" + id+ "', " +"type = '" + type+ "'," +
		"name = '" + name+ "'," +"author = '" +author + "'," +"press = '" +press+ "'," +
		"price = '" + price+ "'," +"time = '" + time+ "'," +"number = '" +number+ "',remark = '" +remark + "'," +
		"state='"+state+"',"+"js='" + js+ "' WHERE id = '" + id+ "'";
		i = conn.executeUpdate(sql);
		conn.close();
		if(i !=0){
		RequestDispatcher dispatcher=
				request.getRequestDispatcher("editBookSuccess.jsp");//转发添加正确页面
		dispatcher.forward(request,response);
		}
		else{
			RequestDispatcher dispatcher=
				request.getRequestDispatcher("editBookWrong.jsp");//转发添加错误页面
		dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
	Books book=new Books();
	request.setAttribute("book",book);
	int id=Integer.parseInt(request.getParameter("id"));
	DatabaseConn conn = new DatabaseConn();
	int i=0;
	String sql = "SELECT * FROM books WHERE id = '" + id + "'";
	ResultSet rs=conn.executeQuery(sql);
	try {
		if(rs.next()){
			book.setId(rs.getInt(1));
			book.setType(rs.getString(2));
			book.setName(rs.getString(3));
			book.setAuthor(rs.getString(4));
			book.setPress(rs.getString(5));
			book.setPrice(rs.getInt(6));
			book.setTime(rs.getString(7));
			book.setNumber(rs.getInt(8));
			book.setRemark(rs.getString(9));
			book.setState(rs.getInt(10));
			book.setJs(rs.getString(11));	
		}
	RequestDispatcher dispatcher=
		request.getRequestDispatcher("editBook.jsp");//转发
	dispatcher.forward(request,response);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
