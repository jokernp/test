package help;
	import mybean.data.*;
	import java.sql.*;
	import java.io.*;
	import javax.servlet.*;
	import javax.servlet.http.*;
	public class helpExit extends HttpServlet{
		public void init(ServletConfig config) throws ServletException{
			super.init(config);
		}
		
		public void doPost(HttpServletRequest request,HttpServletResponse
				response) throws ServletException,IOException{
			HttpSession session=request.getSession(true);
			Login login=(Login)session.getAttribute("login");
			boolean ok=true;
			if(login==null){
				ok=false;
				response.sendRedirect("login.jsp");
			}
			if(ok==true){
				continueDoPost(request,response);
			}
		}
		public void continueDoPost(HttpServletRequest request,
				HttpServletResponse response) throws ServletException,IOException{
			HttpSession session=request.getSession(true);
			session.invalidate();		//销毁用户的session对象
			response.sendRedirect("login.jsp");		
		}
		public void doGet(HttpServletRequest request,HttpServletResponse
				response) throws ServletException,IOException{
			doPost(request,response);
		}
	}
