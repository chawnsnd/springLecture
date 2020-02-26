package wiki.bbongnamu.core.dao;

import java.util.ArrayList;

import wiki.bbongnamu.core.vo.Wiki;

public interface WikiMapper {

	public int insertWiki(Wiki wiki);
	
	public Wiki selectWiki(int num);

	public ArrayList<Wiki> selectWikiByTitle(String keyword);
	
	public ArrayList<Wiki> selectWikiByContent(String keyword);
	
	public int updateWiki(Wiki wiki);
	
	public int updateWikiToDelete(int num);
	
}
