package help;

import java.io.*;

import mybean.data.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

public class helpTz extends HttpServlet {
	public void init(ServletConfig config) throws ServletException
	{		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		Login loginBean=new Login();
		loginBean.setUsername("youke");
		loginBean.setPassword(null);
		loginBean.setName(null);
		loginBean.setTel(null);
		loginBean.setLevel(0);
		session.setAttribute("login",loginBean);
	   RequestDispatcher dispaster=request.getRequestDispatcher("main.jsp");
	    dispaster.forward(request, response);
	  
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	   doPost(request,response); 
   }

}
