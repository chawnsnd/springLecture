package global.sesoc.web5.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web5.vo.Reply;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSession session;

	public ArrayList<Reply> selectReplyByBoardnum(int boardnum){
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		return mapper.selectReplyByBoardnum(boardnum);
	};

	public boolean insertReply(Reply reply) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		if(mapper.insertReply(reply)==1) {
			return true;
		}else {
			return false;
		}
	};
	
	public boolean updateReply(Reply reply) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		if(mapper.updateReply(reply)==1) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteReply(int replynum) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		if(mapper.deleteReply(replynum)==1) {
			return true;
		}else {
			return false;
		}
	}

	public Reply selectReply(int replynum) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		return mapper.selectReply(replynum);
	}

}
