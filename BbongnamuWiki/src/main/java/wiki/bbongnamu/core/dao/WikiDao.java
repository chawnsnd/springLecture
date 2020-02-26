package wiki.bbongnamu.core.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wiki.bbongnamu.core.vo.Wiki;

@Repository
public class WikiDao {
	
	private static final Logger logger = LoggerFactory.getLogger(WikiDao.class);

	@Autowired
	private SqlSession session;
	
	public boolean insertWiki(Wiki wiki) {
		WikiMapper mapper = session.getMapper(WikiMapper.class);
		if (mapper.insertWiki(wiki) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public Wiki selectWiki(int num) {
		WikiMapper mapper = session.getMapper(WikiMapper.class);
		Wiki wiki = mapper.selectWiki(num);
		return wiki;
	}

	public ArrayList<Wiki> selectWikiByTitle(String keyword) {
		WikiMapper mapper = session.getMapper(WikiMapper.class);
		ArrayList<Wiki> wikis = mapper.selectWikiByTitle(keyword);
		return wikis;
	}
	
	public ArrayList<Wiki> selectWikiByContent(String keyword) {
		WikiMapper mapper = session.getMapper(WikiMapper.class);
		ArrayList<Wiki> wikis = mapper.selectWikiByContent(keyword);
		return wikis;
	}
	
	public boolean updateWiki(Wiki wiki) {
		WikiMapper mapper = session.getMapper(WikiMapper.class);
		if (mapper.updateWiki(wiki) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateWikiToDelete(int num) {
		WikiMapper mapper = session.getMapper(WikiMapper.class);
		if (mapper.updateWikiToDelete(num) == 1) {
			return true;
		} else {
			return false;
		}
	}
}
