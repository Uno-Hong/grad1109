package grad;

import java.util.Date;

public class UserDTO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private Date user_reg;
	private int user_man;
	
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	
	
	
	public Date getUser_reg() {
		return user_reg;
	}
	public void setUser_reg(Date user_reg) {
		this.user_reg = user_reg;
	}
	public int getUser_man() {
		return user_man;
	}
	public void setUser_man(int user_man) {
		this.user_man = user_man;
	}
	
	@Override
	public String toString() {
		return "UserBean [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_phone="
				+ user_phone + "]";
	}
	
	
}
