package global.sesoc.web4.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web4.vo.Guestbook;

@Repository
public class GuestbookDaoImpl implements GuestbookDao {

	@Autowired
	private SqlSession session;
	
	public boolean insertGuestbook(Guestbook guestbook) {
		GuestbookMapper mapper = session.getMapper(GuestbookMapper.class);
		if (mapper.insertGuestbook(guestbook) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public ArrayList<Guestbook> allGuestbook() {
		GuestbookMapper mapper = session.getMapper(GuestbookMapper.class);
		ArrayList<Guestbook> guestbooks = mapper.allGuestbook();
		return guestbooks;
	}

	public int deleteAll() {
		GuestbookMapper mapper = session.getMapper(GuestbookMapper.class);
		return mapper.deleteAll();
	}

	public int getCount() {
		GuestbookMapper mapper = session.getMapper(GuestbookMapper.class);
		return mapper.getCount();
	}
	
	public boolean modifyGuestbook(Guestbook guestbook) {
		GuestbookMapper mapper = session.getMapper(GuestbookMapper.class);
		if (mapper.modifyGuestbook(guestbook) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteGuestbook(int num, String password) {
		GuestbookMapper mapper = session.getMapper(GuestbookMapper.class);
		HashMap<String, Object> opts = new HashMap<>();
		opts.put("num", num);
		opts.put("password", password);
		if (mapper.deleteGuestbook(opts) == 1) {
			return true;
		} else {
			return false;
		}
	}
}
