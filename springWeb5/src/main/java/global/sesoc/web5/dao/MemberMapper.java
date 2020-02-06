package global.sesoc.web5.dao;

import global.sesoc.web5.vo.Member;
import global.sesoc.web5.vo.SnsMember;

public interface MemberMapper {

	public int insertMember(Member member);

	public int updateMember(Member member);


	public Member getMember(String id);

	public SnsMember getSnsMember(String sns_id);

	public int insertSnsMember(SnsMember snsMember);

}
