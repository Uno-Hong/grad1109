package grad;

public class BaseDTO {

	private String sidoName;
	private String gugunName;
	private String dongName;
	private String dongCode;
	private String lat;
	private String lng;
	
	
	@Override
	public String toString() {
		return "BaseDTO [sidoName=" + sidoName + ", gugunName=" + gugunName + ", dongName=" + dongName + ", dongCode="
				+ dongCode + ", lat=" + lat + ", lng=" + lng + "]";
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getGugunName() {
		return gugunName;
	}
	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}
	public String getDongName() {
		return dongName;
	}
	public void setDongName(String dongName) {
		this.dongName = dongName;
	}
	public String getDongCode() {
		return dongCode;
	}
	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
}
