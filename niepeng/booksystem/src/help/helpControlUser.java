package help;
import bean.*;
import database.DatabaseConn;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
public class helpControlUser extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse
			response) throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		DatabaseConn conn = new DatabaseConn();
		String s[] = request.getParameterValues("checkbox");
		if(s != null) {
	  		for(int i = 0; i < s.length; i++){
	  			String username=s[i];
		String sql = "DELETE FROM users WHERE username = '" + username + "'";
				conn.executeUpdate(sql);
	  		}
				conn.close();
		}
		response.sendRedirect("deleteUserSuccess.jsp");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		DatabaseConn conn = new DatabaseConn();
		Users user=new Users();
		String username = request.getParameter("username");
		String sql="SELECT level FROM users WHERE username= '" + username + "'";
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
					String sql1="UPDATE users SET level = '" + i + "'WHERE username = '" + username + "'";
					conn.executeUpdate(sql1);
					response.sendRedirect("editLevelSuccess.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn.close();
	}
	}
