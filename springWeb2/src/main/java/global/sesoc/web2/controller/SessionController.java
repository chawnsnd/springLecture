package global.sesoc.web2.controller;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SessionController {
	private static final Logger logger = LoggerFactory.getLogger(SessionController.class);

	@RequestMapping(value = "/session1", method = RequestMethod.GET)
	public String session1(HttpSession session, Model model) {
		session.setAttribute("str", "세션에 저장한 문자열");
		session.setAttribute("num", 12345);
		model.addAttribute("str", "모델에 저장한 문자열");
		model.addAttribute("num", 67890);
		logger.info("세션에 값 저장함");
		return "redirect:/";
	}

	@RequestMapping(value = "/session2", method = RequestMethod.GET)
	public String session2(HttpSession session) {
		session.removeAttribute("str");
		session.removeAttribute("num");
		logger.info("세션에 값 제거");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/session3", method = RequestMethod.GET)
	public String session3(HttpSession session) {
		logger.info(session.getId());
		return "sessionTest";
	}
}
