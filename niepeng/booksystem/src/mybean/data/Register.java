package mybean.data;

public class Register {
	String username="",psd="",usertele="";
	String backNews;
	int type=0;
	public void setUsername(String name){
		username=name;
	}
	public String getUsername(){
		return username;
	}
	public void setPsd(String pw){
		psd=pw;
	}
	public String getPsd(){
		return psd;
	}
	public void setUsertele(String tele){
		usertele=tele;
	}
	public String getUsertele(){
		return usertele;
	}
	public void setBackNews(String s){
		backNews=s;
	}
	public String getBackNews(){
		return backNews;
	}
}
