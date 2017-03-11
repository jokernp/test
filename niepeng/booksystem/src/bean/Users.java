package bean;

public class Users {
	private String username;
	private String password;
	private String name;
	private String tel;
	private int level;
	public void setUsername(String ue){
		username=ue;
	}
	public String getUsername(){
		return username;
	}
	public void setPassword(String pa){
		password=pa;
	}
	public String getPassword(){
		return password;
	}
	public void setName(String na){
		name=na;
	}
	public String getName(){
		return name;
	}
	public void setTel(String te){
		tel=te;
	}
	public String getTel(){
		return tel;
	}
	public void setLevel(int le){
		level=le;
	}
	public int getLevel(){
		return level;
	}
}
