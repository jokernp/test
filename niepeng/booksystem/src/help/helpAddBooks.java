package help;
import bean.*;
import database.DatabaseConn;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import mybean.data.Login;
public class helpAddBooks extends HttpServlet{
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
		Login login=(Login)session.getAttribute("login");
		DatabaseConn conn = new DatabaseConn();
		Books book=new Books();
		request.setAttribute("Books",book);
		//由于getParameter得到的为String类型，所以要得到INT类型 要进行转化
		int id=Integer.parseInt(request.getParameter("id").trim()),
		price=Integer.parseInt(request.getParameter("price").trim()),
		number=Integer.parseInt(request.getParameter("number").trim()),
		state=Integer.parseInt(request.getParameter("state").trim());
		String type=handleString(request.getParameter("type")),
		name=handleString(request.getParameter("name")),
		author=handleString(request.getParameter("author")),
		press=handleString(request.getParameter("press")),
		time=handleString(request.getParameter("time")),
		remark=handleString(request.getParameter("remark")),
		js=handleString(request.getParameter("js"));
		if(login.getUsername()!=null&&login.getLevel()!=0){
			int i = 0;
			String sql = "INSERT INTO books(id,type,name,author,press,price,time,number,remark,state,js) VALUES('"+ id +"' ,'" + type+ "','" +name + "','" + author+ "','" + press+ "','" + price+ "','" + time+ "','" + number+ "','" +remark+ "','" + state+ "','" + js + "')";
			i = conn.executeUpdate(sql);
			conn.close();
			if(i !=0){
			RequestDispatcher dispatcher=
					request.getRequestDispatcher("addBooksSuccess.jsp");//转发添加正确页面
			dispatcher.forward(request,response);
			}
			else{
				RequestDispatcher dispatcher=
					request.getRequestDispatcher("addBooksWrong.jsp");//转发添加错误页面
			dispatcher.forward(request,response);
			}
		}
		else{
			RequestDispatcher dispatcher=
				request.getRequestDispatcher("noLevel.jsp");//转发添加错误页面
		dispatcher.forward(request,response);
		}
			}
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		doPost(request,response);
	}
}

