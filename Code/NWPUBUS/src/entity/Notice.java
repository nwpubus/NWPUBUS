package entity;

public class Notice {

	
	private String title;
	private String content;
	private String time;
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(String title, String content, String time) {
		super();
		this.title = title;
		this.content = content;
		this.time = time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
