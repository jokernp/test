package database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DatabaseConn {
	public String DBDRIVER = "com.mysql.jdbc.Driver";
	public String DBURL = "jdbc:mysql://localhost/books";
	public String DBUSER = "root";
	public String DBPASS = "zhl182";

private Connection conn = null;
private Statement stmt = null;
private ResultSet rs = null;

/**
 * 加载驱动
 */
public DatabaseConn(){
	try {
		Class.forName(DBDRIVER);
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("驱动加载失败!"+e);
	}
}

/**
 * 连接数据库
 * @return
 */
public Connection getConnection(){
	try {
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("数据库连接失败!");
	}
	return conn;
}

/**
 * 查询记录操作
 * 
 * 
 */
public ResultSet executeQuery(String sql){
	conn = getConnection();
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(rs == null){
		System.out.println("执行查询操作失败！");
	}
	return rs;		
}

/**
 * 修改，删除，更新记录操作
 * @param sql
 * @return
 */
public int executeUpdate(String sql){
	int result = 0;
	conn = getConnection();
	try {
		stmt = conn.createStatement();
		result = stmt.executeUpdate(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("执行失败！");
		result = 0;
	}
	return result;//执行影响的行数
}

/**
 * 关闭数据库
 */
public void close(){
	if(rs != null){
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	if(stmt != null){
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	if(conn != null){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
}

