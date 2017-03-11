package help;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import bean.*;
import database.DatabaseConn;

public class helpControlBooks {
	private DatabaseConn conn = new DatabaseConn();
	/**
	 * 查询所有图书
	 * 
	 * 
	 */
	public Books getAllBooks(String id){
		Books books = null;
		books = new Books();
		String sql = "SELECT * FROM books WHERE id = '" + id + 

"'";
		ResultSet rs = conn.executeQuery(sql);
		try {
			if (rs != null && rs.next()) {	
				books.setId(rs.getInt(1));
				books.setType(rs.getString(2));
				books.setName(rs.getString(3));
				books.setAuthor(rs.getString(4));
				books.setPress(rs.getString(5));
				books.setPrice(rs.getInt(6));
				books.setTime(rs.getString(7));
				books.setNumber(rs.getInt(8));
				books.setRemark(rs.getString(9));
				books.setState(rs.getInt(10));
				books.setJs(rs.getString(11));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return books;
	}
	/**
	 * 查询所有图书id
	 * @return
	 */
	public ArrayList<String> getBooksId(){
		ArrayList<String> a=new ArrayList<String>();
		String sql = "SELECT id FROM books";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while (rs != null && rs.next())
				a.add(rs.getString(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return a;
	}
	/**
	 * 删除图书
	 * @param id
	 */
	public void deleteBook(String id){
		String sql = "DELETE FROM books WHERE id = '" + id + "'";
		conn.executeUpdate(sql);
		conn.close();
	}	
	

	/**
	 * 修改图书在馆状态
	 * @param id
	 * @param s
	 * @return
	 */
	public boolean updateState(int id,int state){
		String sql="UPDATE books SET state = '" + state + "' WHERE id = '" + id + "'";
		conn.executeUpdate(sql);
		conn.close();		
		return true;
	}
	/**获取图书的数量**/
	public int getBookNumber(String id){	
		int nu = 0;
		String sql = "SELECT number FROM books WHERE id = '" + 

id + "'";
		ResultSet rs = conn.executeQuery(sql);
		try {
			nu=rs.getInt(0);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return nu;
	}	
	/**
	 * 借书时修改图书数量
	 * 
	 * 
	 * 
	 */
	public boolean updateNumber(int id,int number){
		String sql="UPDATE books SET number  = '" + number + "' WHERE id = '" + id + "'";
		conn.executeUpdate(sql);
		conn.close();		
		return true;
	}
	/**
	 * 还书时修改图书数量
	 * 
	 * 
	 * 
	 */
	public boolean updateNumberIn(int id,int number){
		String sql="UPDATE books SET number  = '" + number + "' WHERE id = '" + id + "'";
		conn.executeUpdate(sql);
		conn.close();		
		return true;
	}
	/**
	 *借书后记录到数据库
	 * @param ab
	 * @return
	 */
	public int insertDate(Borrow ab){
		int i = 0;
		String sql = "INSERT INTO borrow(username,id,time) VALUES('"+ ab.getUsername() +"' ,'" + ab.getId()+"','" + ab.getTime() + "')";
		i = conn.executeUpdate(sql);
		conn.close();
		return i;
	}
	/**
	 * 还书后操作
	 */
	public void deleteDate(Borrow borrow){
		String sql = "DELETE  FROM borrow WHERE id = '" + borrow.getId() + "' and username = '" + borrow.getUsername() + "'";
		conn.executeUpdate(sql);
		conn.close();
	}	
	/**查询借出的图书**/
	public ArrayList<String> getBooksBorrow(){
		ArrayList<String> B = new ArrayList<String>();
		String sql="SELECT id FROM borrow";
		ResultSet rs=conn.executeQuery(sql);
		try {
			while(rs.next()){
				B.add(String.valueOf(rs.getInt(1)));
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		conn.close();
		return B;
	}
	/**
	 * 查询借书信息
	 * 
	 * 
	 */
	public Borrow getBorrowDate(String id){
		Borrow borrow = null;
		borrow = new Borrow();
		String sql = "SELECT * FROM borrow where id="+id+"";
		ResultSet rs = conn.executeQuery(sql);
		try {
			if (rs != null && rs.next()) {	
				borrow.setUsername(rs.getString(1));
				borrow.setId(rs.getInt(2));
				borrow.setTime(rs.getString(3));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return borrow;
	}
	
}

