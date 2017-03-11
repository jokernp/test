package help;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import bean.Users;

import database.DatabaseConn;
public class helpControlUsers {
	private DatabaseConn conn = new DatabaseConn();
	
	/**
	 * 用户名是否已经存在
	 * @param username
	 * @return
	 */
	public int getUserName(String username){
		int i = 0;
		String sql = "SELECT level FROM users WHERE username = '" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		try {
			if(rs.next()){
				i = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return i;
	}
	
	
	/**
	 * 查询所有用户
	 * @param username
	 * @return
	 */
	public Users getAllUsers(String username){
		Users users = null;
		users= new Users();
		String sql = "SELECT * FROM users WHERE username = '" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		try {
			if (rs != null && rs.next()) {				
				users.setUsername(rs.getString(1));
				users.setPassword(rs.getString(2));
				users.setName(rs.getString(3));
				users.setTel(rs.getString(4));
				users.setLevel(rs.getInt(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return users;
	}
	/**
	 * 所有用户列表
	 * @return
	 */
	public ArrayList<String> getUsersArrayList() {
		ArrayList<String> ul = new ArrayList<String>();
		String sql = "SELECT username FROM users";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while (rs != null && rs.next())
				ul.add(rs.getString(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return ul;
	}
}