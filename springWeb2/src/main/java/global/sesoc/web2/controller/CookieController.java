package global.sesoc.web2.controller;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CookieController {
	private static final Logger logger = LoggerFactory.getLogger(CookieController.class);

	@RequestMapping(value = "/cookie1", method = RequestMethod.GET)
	public String cookie1(HttpServletResponse res) {
		// 1. 쿠키객체생성
		Cookie c1 = new Cookie("name", "abc");
		Cookie c2 = new Cookie("age", "12");
		// 2. response객체를 통해 내보내기
		res.addCookie(c1);
		res.addCookie(c2);
		return "redirect:/";
	}

	@RequestMapping(value = "/cookie2", method = RequestMethod.GET)
	public String cookie2(HttpServletResponse res) {
		// 1. 같은 이름의 쿠키 생성
		Cookie c1 = new Cookie("name", "");
		Cookie c2 = new Cookie("age", "");
		// 2. 시간을 0초로 지정(초 단위로 지정)
		c1.setMaxAge(0);
		c2.setMaxAge(0);
//		c1.setMaxAge(60*60*24*3);
		// 3. response객체를 통해 내보내기
		res.addCookie(c1);
		res.addCookie(c2);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/cookie3", method = RequestMethod.GET)
	public String cookie3() {
		return "cookieTest";
	}
}
