package global.sesoc.web2.controller;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goToLoginForm() {
		return "loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String password, HttpSession session, Model model) {
		logger.debug("id:{}, password:{}", id, password);
		//ID가 "abc"이고 비밀번호가 "123"이면 로그인
		//세션에 아이디인 "abc"를 "loginId"라는 이름으로 저장한다
		if(id.equals("abc") && password.equals("123")) {
			session.setAttribute("loginId", id);
			return "redirect:/";
		}else {
			model.addAttribute("loginFail", true);
			return "loginForm";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 1.
		session.removeAttribute("loginId");
		// 2. 세션무효화
		//session.invalidate();
		return "redirect:/";
	}
}
