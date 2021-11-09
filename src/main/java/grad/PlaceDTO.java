
package grad;

public class PlaceDTO {
	private int place_id;
	private String place_name; // 이름
	private String place_addr;
	private String place_pn;
	private Float place_lng; //경도
	private Float place_lat; //위도
	private int place_type;
	
	public int getPlace_id() {
		return place_id;
	}
	public void setPlace_id(int place_id) {
		this.place_id = place_id;
	}
	public String getPlace_name() {
		return place_name;
	}
	public int getPlace_type() {
		return place_type;
	}
	public void setPlace_type(int place_type) {
		this.place_type = place_type;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_addr() {
		return place_addr;
	}
	public void setPlace_addr(String place_addr) {
		this.place_addr = place_addr;
	}
	public String getPlace_pn() {
		return place_pn;
	}
	public void setPlace_pn(String place_pn) {
		this.place_pn = place_pn;
	}
	public Float getPlace_lng() {
		return place_lng;
	}
	public void setPlace_lng(Float place_lng) {
		this.place_lng = place_lng;
	}
	public Float getPlace_lat() {
		return place_lat;
	}
	public void setPlace_lat(Float place_lat) {
		this.place_lat = place_lat;
	}

	
	
}