package global.sesoc.web4.dao;

import java.util.ArrayList;

import global.sesoc.web4.vo.Guestbook;

public interface GuestbookDao {
	public boolean insertGuestbook(Guestbook guestbook);

	public ArrayList<Guestbook> allGuestbook();

	public int deleteAll();

	public int getCount();
	
	public boolean modifyGuestbook(Guestbook guestbook);
	
	public boolean deleteGuestbook(int num, String password);
}
