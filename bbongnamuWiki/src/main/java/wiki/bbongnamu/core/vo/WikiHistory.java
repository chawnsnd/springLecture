package wiki.bbongnamu.core.vo;

import lombok.Data;

@Data
public class WikiHistory {
	private int num;
	private int wikinum;
	private int usernum;
	private String type;
	private String explanation;
	private String writedate;
}
