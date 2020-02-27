package global.sesoc.ajax.dao;

import java.util.ArrayList;
import global.sesoc.ajax.vo.Comment;

/**
 * Mapper
 */
public interface CommentMapper {
	//데이터 입력
	public int insert(Comment comment);
	//데이터 목록
	public ArrayList<Comment> list();
	//데이터 삭제
	public int delete(int num);
}
