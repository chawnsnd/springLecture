package global.sesoc.web5.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web5.util.PageNavigator;
import global.sesoc.web5.vo.Board;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession session;

	public boolean insertBoard(Board board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		if (mapper.insertBoard(board) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Board> selectAllBoard() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectAllBoard();
	}
	
	public ArrayList<Board> selectAllBoardByNaviAndSearchText(String searchText, PageNavigator navi) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		return mapper.selectAllBoardByNaviAndSearchText(searchText, rb);
	}

	public Board selectBoard(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectBoard(boardnum);
	}

	public boolean updateBoard(Board board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		if (mapper.updateBoard(board) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateHits(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		if (mapper.updateHits(boardnum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public int selectAllBoardCountBySearchText(String searchText) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectAllBoardCountBySearchText(searchText);
	}

	public boolean deleteBoard(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		if (mapper.deleteBoard(boardnum) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean insertLike(int boardnum, String id) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("boardnum", boardnum);
		map.put("id", id);
		if(mapper.insertLike(map) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	public int selectLikeCount(int boardnum, String id) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("boardnum", boardnum);
		map.put("id", id);
		return mapper.selectLikeCount(map);
	}

	public int selectLike(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectLike(boardnum);
	}
	
	public boolean deleteLike(int boardnum, String id) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("boardnum", boardnum);
		map.put("id", id);
		if(mapper.deleteLike(map) == 1) {
			return true;
		}else {
			return false;
		}
	}
}
