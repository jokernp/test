package mybean.data;

public class Login {
	String backNews="";
	boolean success=false;
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
	public void setBackNews(String s){
		backNews=s;
	}
	public String getBackNews(){
		return backNews;
	}
	public void setSuccess(boolean b){
		success=b;
		
	}
	public boolean getSuccess(){
		return success;
	}
	public void setLevel(int t){
		level=t;
	}
  public int getLevel(){
	  return level;  }
}
