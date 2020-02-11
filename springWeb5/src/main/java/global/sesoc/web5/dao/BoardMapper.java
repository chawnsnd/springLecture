package global.sesoc.web5.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.web5.vo.Board;

public interface BoardMapper {

	public int insertBoard(Board board);

	public ArrayList<Board> selectAllBoard();

	public Board selectBoard(int boardnum);
	
	public int selectAllBoardCount();

	public int updateBoard(Board board);

	public int updateHits(int boardnum);

	public int deleteBoard(int boardnum);

	public int insertLike(HashMap<String, Object> map);
	
	public int selectLikeCount(HashMap<String, Object> map);
	
	public int deleteLike(HashMap<String, Object> map);
	
	public int selectLike(int boardnum);
}
