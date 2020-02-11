package global.sesoc.web5.dao;

import java.util.ArrayList;

import global.sesoc.web5.vo.Reply;

public interface ReplyMapper {

	public ArrayList<Reply> selectReplyByBoardnum(int boardnum);
	
	public int insertReply(Reply reply);
	
	public int updateReply(Reply reply);
	
	public int deleteReply(int replynum);

	public Reply selectReply(int replynum);
	
}
