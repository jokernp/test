package myservlet.control;

import java.io.*;
import mybean.data.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class HandleLogin extends HttpServlet {

	public void init(ServletConfig config) throws ServletException
	  {  super.init(config);
	  //添加数据库驱动
	    try
	  {  Class.forName("com.mysql.jdbc.Driver"); 
		  }
	  catch(Exception e){}
	  }
	//处理汉字
	 public String handleString(String s)
	 {  try{byte bb[]=s.getBytes("iso-8859-1");
	      s=new String(bb);
	 }
	 catch(Exception ee){}
	 return s;
	 } 
	//doPost
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    Connection con;
		    PreparedStatement sql;
		    Login loginBean=null;
		    String backNews="";
		    int level;
		    HttpSession session=request.getSession(true);
		    try{
		    	loginBean=(Login)session.getAttribute("login");
				if(loginBean==null){
					loginBean=new Login();
					session.setAttribute("login",loginBean);
		    	}
		    }
		    catch(Exception ee){
		    	loginBean=new Login();
				session.setAttribute("login", loginBean);
		    }
		    String username=request.getParameter("username").trim();
			String password=request.getParameter("psd").trim();
			boolean ok=loginBean.getSuccess();
			username=handleString(username);
			password=handleString(password);
			
			if(ok==true&&username.equals(loginBean.getUsername())){
				backNews=username+"已经登陆了";
				loginBean.setBackNews(backNews);
			  	   RequestDispatcher dispaster=request.getRequestDispatcher("loginfail.jsp");
				    dispaster.forward(request, response);
		    }
		    	
		    
		    else{
		    	 String uri="jdbc:mysql://localhost/books";
		    	 boolean boo=(username.length()>0)&&(password.length()>0);
		   
		    try
		    { con=DriverManager.getConnection(uri,"root","zhl182");
		       String selectCondition="select * from users where username=? and password=?";
			    sql=con.prepareStatement(selectCondition);
		    	if(boo)
		    	{  sql.setString(1,handleString(username));
		    	   sql.setString(2,handleString(password));
		    	   
		    	   ResultSet rs=sql.executeQuery();
		    	   boolean m=rs.next();
		    	  
		    	   if(m==true)
		    	   { 
		    	  String name=rs.getString(3),
		    	   	tel=rs.getString(4);
		    		   level=rs.getInt(5);
		    		  backNews="登录成功";
		    	   loginBean.setBackNews(backNews);
					loginBean.setSuccess(true);
					loginBean.setUsername(username);
					loginBean.setPassword(password);
					loginBean.setName(name);
					loginBean.setTel(tel);
					loginBean.setLevel(level);
		    	   RequestDispatcher dispaster=request.getRequestDispatcher("main.jsp");
				    dispaster.forward(request, response);
		    	  
		    	   }
		    	   
		    	   else
		    	   {backNews="用户名不存在或密码不正确";
		    	   loginBean.setBackNews(backNews);
		    	   loginBean.setUsername(username);
		    	   loginBean.setSuccess(true);
		    	   loginBean.setPassword(password);
		    	   RequestDispatcher dispaster=request.getRequestDispatcher("loginfail.jsp");
				    dispaster.forward(request, response);
		    	   }  
		    	}
		    	   else{
		    		   backNews="用户名不存在或密码不正确";
			    	   loginBean.setBackNews(backNews);
			    	   loginBean.setUsername(username);
			    	   loginBean.setSuccess(true);
			    	   loginBean.setPassword(password);
		    		   RequestDispatcher dispaster=request.getRequestDispatcher("loginfail.jsp");
					    dispaster.forward(request, response);
		    	   }
		    	   con.close();
		    	   	
		    	}
		    
		    catch(SQLException exp)
		   {
		    }
		    }
	}

	//doGet
   public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	   doPost(request,response); 
   }
}	
	