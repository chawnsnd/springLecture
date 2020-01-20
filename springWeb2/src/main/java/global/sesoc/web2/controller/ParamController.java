package global.sesoc.web2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web2.HomeController;
import global.sesoc.web2.vo.Person;

@Controller
public class ParamController {
	private static final Logger logger = LoggerFactory.getLogger(ParamController.class);

	@RequestMapping(value = "/param1", method = RequestMethod.GET)
	public String goToParam1Form() {
		return "param1Test";
	}

	@RequestMapping(value = "/param1", method = RequestMethod.POST)
	public String param1(String name, String age, String address) {

		logger.debug("이름 : "+name+", 나이 : "+age+", 주소 :"+address);
		return "redirect:/";
	}

	@RequestMapping(value = "/param2", method = RequestMethod.GET)
	public String goToParam2Form() {
		return "param2Test";
	}
	
	@RequestMapping(value = "/param2", method = RequestMethod.POST)
	public String param2(Person p) {
		
		logger.debug("전달된 VO : "+p);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/param3", method = RequestMethod.GET)
	public String param3(int num) {
		logger.debug("num : "+num);
		return "redirect:/";
	}

}
