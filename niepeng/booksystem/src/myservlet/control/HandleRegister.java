package myservlet.control;

import mybean.data.*;

import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class HandleRegister extends HttpServlet{
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){}
	}
	public String handleString(String s){
		try{
			byte bb[]=s.getBytes("iso-8859-1");
			s=new String(bb);
		}catch(Exception ee){}
		return s;
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		Connection con;
		PreparedStatement sql;
		Register reg=new Register();
		request.setAttribute("register",reg);
		String username=request.getParameter("username"),
		 psd=request.getParameter("psd"),
		 name=handleString(request.getParameter("name")),
		tel=request.getParameter("usertele").trim();
		int level=0;
			String uri="jdbc:mysql://localhost/books";
			if(username==null)
				username="";
			if(psd==null)
				psd="";
			boolean isLD=true;
			for(int i=0;i<username.length();i++){
				char c=username.charAt(i);
				if(!((c<='z' && c>='a')||(c<='Z' && c>='A')||(c<='9' && c>='0')))
					isLD=false;
			}
			boolean boo=username.length()>0 && psd.length()>0 && isLD;
			String backNews="";
			try{
				con=DriverManager.getConnection(uri,"root","zhl182");
				String insertCondition = "INSERT INTO users VALUES('" + username + "','" + psd + "','" + name + "','" + tel + "',0)";
				sql=con.prepareStatement(insertCondition);
				if(boo){
					int m=sql.executeUpdate();
					if(m!= 0){
						backNews="注册成功";
						reg.setBackNews(backNews);
						reg.setUsername(username);
						reg.setPsd(handleString(psd));
					}
				}
				else{
					backNews="信息填写不完整或名字中有非法字符";
					reg.setBackNews(backNews);
				}
				con.close();
			}
			catch(SQLException exp){
				backNews="该会员名已被注册，请您更换名字"+exp;
				reg.setBackNews(backNews);
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher("zhucesuccess.jsp");
			dispatcher.forward(request,response);

}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}

}
