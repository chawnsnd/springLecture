package wiki.bbongnamu.core.dao;

import java.util.ArrayList;

import wiki.bbongnamu.core.vo.WikiHistory;

public interface WikiHistoryMapper {

	public int insertWikiHistory(WikiHistory wikiHistory);
	
	public WikiHistory selectWikiHisotry(int num);

	public ArrayList<WikiHistory> selectWikiHisotryByWikinum(int wikinum);
	
}
