package global.sesoc.web4.vo;

import lombok.Data;

@Data
public class Guestbook {
	
	private int num;
	private String name;
	private String password;
	private String contents;
	private String inputdate;
	
}
