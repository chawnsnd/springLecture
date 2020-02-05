package global.sesoc.web5.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web5.vo.Member;
import global.sesoc.web5.vo.SnsMember;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession session;

	public boolean insertMember(Member member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		if(mapper.insertMember(member) == 1) {
			return true;
		}else {
			return false;
		}
	}

	public Member selectMember(String id, String password) {
		HashMap<String, Object> loginInfo = new HashMap<>();
		loginInfo.put("id", id);
		loginInfo.put("password", password);
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		Member member = mapper.selectMember(loginInfo);
		return member;
	}

	public boolean updateMember(Member member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		if(mapper.updateMember(member) == 1) {
			return true;
		}else {
			return false;
		}
	}

	public int selectCountById(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.selectCountById(id);
	}
	
	public Member getMember(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.getMember(id);
	}

	public SnsMember getSnsMember(String sns_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.getSnsMember(sns_id);
	}

	public boolean inserSnsMember(SnsMember snsMember) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		if(mapper.insertSnsMember(snsMember) == 1) {
			return true;
		}else {
			return false;
		}
	}
}
