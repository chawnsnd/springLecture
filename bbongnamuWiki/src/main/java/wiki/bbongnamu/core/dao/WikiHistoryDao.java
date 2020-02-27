package wiki.bbongnamu.core.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wiki.bbongnamu.core.vo.WikiHistory;

@Repository
public class WikiHistoryDao {
	
	private static final Logger logger = LoggerFactory.getLogger(WikiHistoryDao.class);

	@Autowired
	private SqlSession session;
	
	public boolean insertWikiHistory(WikiHistory wikiHistory) {
		WikiHistoryMapper mapper = session.getMapper(WikiHistoryMapper.class);
		if (mapper.insertWikiHistory(wikiHistory) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public WikiHistory selectWikiHistory(int num) {
		WikiHistoryMapper mapper = session.getMapper(WikiHistoryMapper.class);
		WikiHistory wikiHistory = mapper.selectWikiHisotry(num);
		return wikiHistory;
	}

	public ArrayList<WikiHistory> selectWikiHistoryByWikinum(int wikinum) {
		WikiHistoryMapper mapper = session.getMapper(WikiHistoryMapper.class);
		ArrayList<WikiHistory> wikiHistorys = mapper.selectWikiHisotryByWikinum(wikinum);
		return wikiHistorys;
	}
}
