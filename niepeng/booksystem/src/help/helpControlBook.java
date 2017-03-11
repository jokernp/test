package help;
import bean.*;
import database.DatabaseConn;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

import mybean.data.Login;
public class helpControlBook extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse
			response) throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		Login login=(Login)session.getAttribute("login");
		if(login.getUsername()!=null&&login.getLevel()!=0){
		DatabaseConn conn = new DatabaseConn();
		String s[] = request.getParameterValues("checkbox");
		if(s != null) {
	  		for(int i = 0; i < s.length; i++){
	  			int id=Integer.parseInt(s[i]);
		String sql = "DELETE FROM books WHERE id = '" + id + "'";
				conn.executeUpdate(sql);
	  		}
				conn.close();
		}
		response.sendRedirect("deleteBookSuccess.jsp");
		}else{
			response.sendRedirect("noLevel.jsp");
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		Login login=(Login)session.getAttribute("login");
		if(login.getUsername()!=null&&login.getLevel()!=0){
		DatabaseConn conn = new DatabaseConn();
		Books book=new Books();
		int id = Integer.parseInt(request.getParameter("id"));
		String sql="SELECT state FROM books WHERE id = '" + id + "'";
		ResultSet rs=conn.executeQuery(sql);
			try {
				if(rs != null && rs.next()){
					int i=rs.getInt(1);
					if(i==0){
						i=1;
					}
					else{
						i=0;
					}
					String sql1="UPDATE books SET state  = '" + i + "'WHERE id = '" + id + "'";
					conn.executeUpdate(sql1);
					response.sendRedirect("editStateSuccess.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn.close();
	}
		else{
			response.sendRedirect("noLevel.jsp");
		}
	}
	}
