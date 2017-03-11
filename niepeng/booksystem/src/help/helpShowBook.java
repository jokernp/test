package help;
import bean.*;
import database.DatabaseConn;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
public class helpShowBook extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse
			response) throws ServletException,IOException{
		doGet(request,response);
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
			request.getRequestDispatcher("showBook.jsp");//×ª·¢
		dispatcher.forward(request,response);
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}

