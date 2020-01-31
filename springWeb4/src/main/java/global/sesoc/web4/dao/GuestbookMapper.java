package global.sesoc.web4.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.web4.vo.Guestbook;

public interface GuestbookMapper {

	public int insertGuestbook(Guestbook guestbook);

	public ArrayList<Guestbook> allGuestbook();

	public int deleteAll();

	public int getCount();

	public int modifyGuestbook(Guestbook guestbook);

	public int deleteGuestbook(HashMap<String, Object> opts);

}
