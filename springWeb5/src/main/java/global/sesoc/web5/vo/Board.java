package global.sesoc.web5.vo;

import lombok.Data;

@Data
public class Board {
	private int boardnum;
	private String id;
	private String title;
	private String contents;
	private String inputdate;
	private int hits;
	private int likes;
	private String originalfile;
	private String savedfile;
}
