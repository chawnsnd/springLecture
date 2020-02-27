package wiki.bbongnamu.core.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import wiki.bbongnamu.core.service.UserService;
import wiki.bbongnamu.core.vo.User;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService service;
	
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String goJoinForm() {
		return "user/joinForm";
	}

	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(User user) {
		service.join(user);
		return "user/joinForm";
	}
}
