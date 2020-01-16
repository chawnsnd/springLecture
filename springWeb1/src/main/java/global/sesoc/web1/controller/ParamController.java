package global.sesoc.web1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParamController {
	
	@RequestMapping(value="/param1", method=RequestMethod.GET)
	public String param1() {
		return "jsp/param1";
	}

	@RequestMapping(value="/param2", method=RequestMethod.POST)
	public String param2(String id, String password, String name) {
		System.out.println(id);
		System.out.println(password);
		System.out.println(name);
		return "redirect:/";
	}
	
	@RequestMapping(value="/param3", method=RequestMethod.GET)
	public String param3(Model model) {
		model.addAttribute("str", "서버에서 보내는 내용");
		model.addAttribute("num", 123);
		return "jsp/param3";
	}
}
