package wiki.bbongnamu.core.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import wiki.bbongnamu.core.exception.DuplicateIdException;
import wiki.bbongnamu.core.service.UserService;
import wiki.bbongnamu.core.util.JoinCheck;
import wiki.bbongnamu.core.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private JoinCheck joinCheck;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoinForm() {
		return "user/joinForm";
	}

	@ResponseBody
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public HashMap<String, Boolean> join(User user) {
		HashMap<String, Boolean> result = new HashMap<>();
		try {
			if (joinCheck.checkUser(user))
				userService.join(user);
		} catch (Exception e) {
			result.put("result", false);
			return result;
		}
		result.put("result", true);
		return result;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLoginForm() {
		return "user/loginForm";
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public HashMap<String, Boolean> login(User loginReq, HttpSession session){
		HashMap<String, Boolean> result = new HashMap<>();
		User user = userService.login(loginReq);
		if(user != null) {
			session.setAttribute("usernum", user.getNum());
			session.setAttribute("id", user.getId());
			result.put("result", true);
		}else {
			result.put("result", false);
		}
		return result;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoout(HttpSession session) {
		session.removeAttribute("usernum");
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public HashMap<String, Boolean> idCheck(String id) {
		HashMap<String, Boolean> result = new HashMap<>();
		try {
			joinCheck.checkId(id);
		} catch (DuplicateIdException e) {
			result.put("result", false);
			return result;
		}
		result.put("result", true);
		return result;
	}
}
