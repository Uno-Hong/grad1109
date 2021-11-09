package grad;

public class PlaceFileDTO {
	private int place_id;
	private String place_img_name; //
	private String place_img_origin; //
	private long place_img_size; //
	
	public int getPlace_id() {
		return place_id;
	}
	public void setPlace_id(int place_id) {
		this.place_id = place_id;
	}
	public String getPlace_img_name() 
	{
		return place_img_name;
	}
	public String getPlace_img_origin() {
		return place_img_origin;
	}
	public void setPlace_img_origin(String place_img_origin) {
		this.place_img_origin = place_img_origin;
	}
	public long getPlace_img_size() {
		return place_img_size;
	}
	public void setPlace_img_size(long place_img_size) {
		this.place_img_size = place_img_size;
	}
	public void setPlace_img_name(String place_img_name) 
	{
		this.place_img_name = place_img_name;
	}
	
	
}
