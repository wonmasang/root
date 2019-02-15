package root.dto;

import java.util.Date;

public class ExptDto {
	
	private String user_id;
	private String password;
	private String expt_name;
	private String mobile;
	private String tel;
	private String fax;
	private String email;
	private String research;
	private String career;
	private String patent;
	private String authority;
	private String att_name;
	private String att_path;
	private Date reg_date;
	private Date update_date;
	private String center_seq;
	private String technical_field;
	private String del_yn;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getExpt_name() {
		return expt_name;
	}
	public void setExpt_name(String expt_name) {
		this.expt_name = expt_name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getResearch() {
		return research;
	}
	public void setResearch(String research) {
		this.research = research;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getPatent() {
		return patent;
	}
	public void setPatent(String patent) {
		this.patent = patent;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getAtt_name() {
		return att_name;
	}
	public void setAtt_name(String att_name) {
		this.att_name = att_name;
	}
	public String getAtt_path() {
		return att_path;
	}
	public void setAtt_path(String att_path) {
		this.att_path = att_path;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getCenter_seq() {
		return center_seq;
	}
	public void setCenter_seq(String center_seq) {
		this.center_seq = center_seq;
	}
	public String getTechnical_field() {
		return technical_field;
	}
	public void setTechnical_field(String technical_field) {
		this.technical_field = technical_field;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
	@Override
	public String toString() {
		return "ExptDto [user_id=" + user_id + ", password=" + password + ", expt_name=" + expt_name + ", mobile="
				+ mobile + ", tel=" + tel + ", fax=" + fax + ", email=" + email + ", research=" + research + ", career="
				+ career + ", patent=" + patent + ", authority=" + authority + ", att_name=" + att_name + ", att_path="
				+ att_path + ", reg_date=" + reg_date + ", update_date=" + update_date + ", center_seq=" + center_seq
				+ ", technical_field=" + technical_field + ", del_yn=" + del_yn + "]";
	}
	
	

}
