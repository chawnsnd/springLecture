package global.sesoc.web4.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web4.dao.GuestbookDao;
import global.sesoc.web4.vo.Guestbook;

@Controller
public class GuestbookContoller {

	@Autowired
	private GuestbookDao guestbookDao;
	
	private static Logger logger = LoggerFactory.getLogger(GuestbookContoller.class);
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goList(Model model) {
		ArrayList<Guestbook> guestbooks = guestbookDao.allGuestbook();
		model.addAttribute("guestbooks", guestbooks);
		return "listView";
	}
	
	@RequestMapping(value= "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "writeForm";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writeGuestbook(Guestbook guestbook) {
		logger.debug("받은내용: "+guestbook);
		guestbookDao.insertGuestbook(guestbook);
		return "redirect:/list";
	}

	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String deleteGuestbook(int num, String password) {
		logger.debug("받은내용: "+num+", "+password);
		guestbookDao.deleteGuestbook(num, password);
		return "redirect:/list";
	}
	
}
