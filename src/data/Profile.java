package data;

import java.util.*;

public class Profile {
	private String id;
	private String name;
	private String user_img;
	private String email;
	private String bday;
	private String intro;
	private List<String> career;
	
	public Profile(String id, String name, String user_img, String email, String bday, String intro) {
		this(id, name, user_img, email, bday, intro, new ArrayList<String>());
	}
	
	public Profile(String id, String name, String user_img, String email, String bday, String intro, List<String> career) {
		this.id = id;
		this.name = name;
		this.user_img = user_img;
		this.email = email;
		this.bday = bday;
		this.intro = intro;
		this.career = career;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<String> getCareer() {
		return career;
	}
	public void setCareer(List<String> career) {
		this.career = career;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBday() {
		return bday;
	}
	public void setBday(String bday) {
		this.bday = bday;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
}
