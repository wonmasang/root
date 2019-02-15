package root.dto;

public class LoginDto {

	private String user_id;
	private String user_pw;
	
	private String corporation;
	private String expert;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public String getExpert() {
		return expert;
	}
	public void setExpert(String expert) {
		this.expert = expert;
	}
	
	@Override
	public String toString() {
		return "LoginDto [user_id=" + user_id 
				+ ", user_pw=" + user_pw 
				+ ", corporation=" + corporation 
				+ ", expert=" + expert + "]";
	}
	
	
	
	
}
