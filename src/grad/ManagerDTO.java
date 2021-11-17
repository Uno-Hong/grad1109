package grad;

import java.sql.Date;

public class ManagerDTO {
	private String user_id;
	private String user_name;
	private String user_phone;
	private Date user_reg;
	
	public ManagerDTO(String user_id, String user_name, String user_phone, Date user_reg) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_reg = user_reg;
	}

	public ManagerDTO(String user_id) {
		super();
		this.user_id = user_id;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	
	
	
}
