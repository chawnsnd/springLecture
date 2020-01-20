package global.sesoc.web2.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web2.vo.Person;

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
		
		Person person = new Person();
		person.setName("홍길동");
		person.setAge(20);
		person.setAddress("서울");
	
		ArrayList<Person> list = new ArrayList<Person>();
		Person p = new Person();
		p.setName("김철수");
		p.setAge(30);
		p.setAddress("부산");		
		list.add(p);

		p = new Person();
		p.setName("이철수");
		p.setAge(40);
		p.setAddress("광주");		
		list.add(p);

		p = new Person();
		p.setName("차준웅");
		p.setAge(28);
		p.setAddress("안양");		
		list.add(p);
		
		model.addAttribute("person", person);
		model.addAttribute("list", list);
		
		return "jstl2Test";
		
	}
}