package global.sesoc.web2.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JstlController {

	@RequestMapping(value = "/jstl1", method = RequestMethod.GET)
	public String jstl1(Model model) {
		String str = "문자열";
		int num = 100;
		ArrayList<String> sList = new ArrayList<String>();
		sList.add("aaa");
		sList.add("bbb");
		sList.add("ccc");
		model.addAttribute("str", str);
		model.addAttribute("num", num);
		model.addAttribute("slist", sList);

		String tag ="<marquee>문자열</marquee>";
		model.addAttribute("tag", tag);

		return "jstl1Test";
	}
	
	@RequestMapping(value = "/jstl2", method = RequestMethod.GET)
	public String jstl2(Model model) {
		Integer num = 100;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("str", "해시맵문자열");
		map.put("num", "123");
		
		model.addAttribute("num", num);
		model.addAttribute("map", map);
		return "jstl2Test";
	}
}