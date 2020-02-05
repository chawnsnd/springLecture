package global.sesoc.web5.dao;

import java.util.HashMap;

import global.sesoc.web5.vo.Member;
import global.sesoc.web5.vo.SnsMember;

public interface MemberMapper {

	public int insertMember(Member member);

	public Member selectMember(HashMap<String, Object> loginInfo);

	public int updateMember(Member member);

	public int selectCountById(String id);

	public Member getMember(String id);

	public SnsMember getSnsMember(String sns_id);

	public int insertSnsMember(SnsMember snsMember);

}
