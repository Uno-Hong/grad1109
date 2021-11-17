package grad;

public class MapDTO {

	private int place_id;
	private String place_name;
	private String place_pn;
	private String place_lng;
	private String place_lat;
	private String place_si;
	private String place_gu;
	private String place_dong;
	private String place_jibun;
	
	public int getPlace_id() {
		return place_id;
	}
	public void setPlace_id(int place_id) {
		this.place_id = place_id;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_pn() {
		return place_pn;
	}
	public void setPlace_pn(String place_pn) {
		this.place_pn = place_pn;
	}
	public String getPlace_lng() {
		return place_lng;
	}
	public void setPlace_lng(String place_lng) {
		this.place_lng = place_lng;
	}
	public String getPlace_lat() {
		return place_lat;
	}
	public void setPlace_lat(String place_lat) {
		this.place_lat = place_lat;
	}
	public String getPlace_si() {
		return place_si;
	}
	public void setPlace_si(String place_si) {
		this.place_si = place_si;
	}
	public String getPlace_gu() {
		return place_gu;
	}
	public void setPlace_gu(String place_gu) {
		this.place_gu = place_gu;
	}
	public String getPlace_dong() {
		return place_dong;
	}
	public void setPlace_dong(String place_dong) {
		this.place_dong = place_dong;
	}
	public String getPlace_jibun() {
		return place_jibun;
	}
	public void setPlace_jibun(String place_jibun) {
		this.place_jibun = place_jibun;
	}
	
	@Override
	public String toString() {
		return "MapDTO [place_id=" + place_id + ", place_name=" + place_name + ", place_pn=" + place_pn + ", place_lng="
				+ place_lng + ", place_lat=" + place_lat + ", place_etc=" + ", place_sido=" + place_si
				+ ", place_gugun=" + place_gu + ", place_dong=" + place_dong + ", place_jibun=" + place_jibun + "]";
	}
	
	
	
}