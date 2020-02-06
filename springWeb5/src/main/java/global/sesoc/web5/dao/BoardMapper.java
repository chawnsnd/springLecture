package global.sesoc.web5.dao;

import java.util.ArrayList;

import global.sesoc.web5.vo.Board;

public interface BoardMapper {

	public int insertBoard(Board board);

	public ArrayList<Board> selectAllBoard();

	public Board selectBoard(int boardnum);

	public int updateBoard(Board board);

	public int updateHits(int boardnum);
	
}
