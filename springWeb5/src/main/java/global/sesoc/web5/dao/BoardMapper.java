package global.sesoc.web5.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.web5.util.PageNavigator;
import global.sesoc.web5.vo.Board;

public interface BoardMapper {

	public int insertBoard(Board board);

	public ArrayList<Board> selectAllBoard();

	public ArrayList<Board> selectAllBoardByNaviAndSearchText(String searchText, RowBounds rb);

	public Board selectBoard(int boardnum);
	
	public int selectAllBoardCountBySearchText(String searchText);

	public int updateBoard(Board board);

	public int updateHits(int boardnum);

	public int deleteBoard(int boardnum);

	public int insertLike(HashMap<String, Object> map);
	
	public int selectLikeCount(HashMap<String, Object> map);
	
	public int deleteLike(HashMap<String, Object> map);
	
	public int selectLike(int boardnum);
}
