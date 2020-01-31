package global.sesoc.web4.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import global.sesoc.web4.vo.Guestbook;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Transactional
public class GuestbookDaoTest {

	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private GuestbookDao dao;
	
	@Test
	public void getCountAndDeleteAll() {
		dao.deleteAll();
		Guestbook guestbook = new Guestbook();
		guestbook.setName("테스트이름");
		guestbook.setPassword("테스트비번");
		guestbook.setContents("테스트내용");
		dao.insertGuestbook(guestbook);
		assertThat(dao.getCount(), is(1));
		dao.deleteAll();
		assertThat(dao.getCount(), is(0));
	}
	
	@Test
	public void insert() {
		Guestbook guestbook = new Guestbook();
		guestbook.setName("테스트이름");
		guestbook.setPassword("테스트비번");
		guestbook.setContents("테스트내용");
		assertThat(dao.insertGuestbook(guestbook), is(true));
	}
	
	@Test
	public void all() {
		dao.deleteAll();
		Guestbook[] arr = new Guestbook[10];
		for(int i=0; i<arr.length; i++) {
			arr[i] = new Guestbook();
			arr[i].setName("테스트이름");
			arr[i].setPassword("테스트비번");
			arr[i].setContents("테스트내용");
			dao.insertGuestbook(arr[i]);
		}
		assertThat(dao.allGuestbook().size(), is(arr.length));
	}
	
	@Test
	public void modify() {
		Guestbook guestbook = new Guestbook();
		guestbook.setName("테스트이름");
		guestbook.setPassword("테스트비번");
		guestbook.setContents("테스트내용");
		dao.insertGuestbook(guestbook);
	}
}
