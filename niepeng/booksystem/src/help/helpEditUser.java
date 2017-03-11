package help;
import bean.*;
import database.DatabaseConn;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
public class helpEditUser extends HttpServlet{
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
		Users user=new Users();
		request.setAttribute("user",user);
		 String username=null;
		 if(request.getParameter("username")!=null){
		 username=request.getParameter("username");
		 }	else{
		 username=(String)session.getAttribute("username");
		 }
		String name=handleString(request.getParameter("name")),
		password=handleString(request.getParameter("password")),
		tel=handleString(request.getParameter("tel"));
		int i = 0;
		String sql = "UPDATE users SET password = '" + password + "',name = '" + name + "',tel = '" + tel + "' WHERE username = '" + username+ "'";
		i = conn.executeUpdate(sql);
		conn.close();
		if(i !=0){
		RequestDispatcher dispatcher=
				request.getRequestDispatcher("editUserSuccess.jsp");//转发添加正确页面
		dispatcher.forward(request,response);
		}
		else{
			RequestDispatcher dispatcher=
				request.getRequestDispatcher("editUserWrong.jsp");//转发添加错误页面
		dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		Users user=new Users();
		Borrow borrow=new Borrow();
		Books book=new Books();
		request.setAttribute("user", user);
		request.setAttribute("borrow",borrow);
		request.setAttribute("book",book);
		String username=request.getParameter("username");
		DatabaseConn conn = new DatabaseConn();
		int i=0;
		String sql="SELECT * FROM users WHERE username='" +username+"'";
		String sql1="SELECT * FROM borrow WHERE username='" +username+"'";
		ResultSet rs=conn.executeQuery(sql);
		ResultSet rs1=conn.executeQuery(sql1);
		try {
			if(rs.next()){
				user.setUsername(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setTel(rs.getString(4));
				user.setLevel(rs.getInt(5));
			if(rs1.next()){
				borrow.setUsername(rs1.getString(1));
				borrow.setId(rs1.getInt(2));
				String sql2="SELECT * FROM books WHERE id='" +borrow.getId()+"'";
				ResultSet rs2=conn.executeQuery(sql2);
				if(rs2.next()){
					book.setName(rs2.getString(3));
				}
				borrow.setTime(rs1.getString(3));
			}
			}
		RequestDispatcher dispatcher=
			request.getRequestDispatcher("editUser.jsp");//转发
		dispatcher.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}