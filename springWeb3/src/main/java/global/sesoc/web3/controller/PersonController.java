package global.sesoc.web3.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web3.dao.PersonDao;
import global.sesoc.web3.vo.Person;

@Controller
public class PersonController {

	private static final Logger logger = LoggerFactory.getLogger(PersonController.class);

	
	// 여기가 SchoolManager
	// private PersonDao personDao = new PersonDao();
	
	@Autowired
	private PersonDao personDao;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(Person person) {
		
		int result = personDao.insertPerson(person);
		
		logger.debug(person+"입력 결과: "+result);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String info(String name, Model model) {
		
		Person person = personDao.selectPerson(name);
		model.addAttribute("person", person);
		
		return "info";
	}

	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		ArrayList<Person> list = personDao.getList();
		model.addAttribute("list", list);
		
		return "list";
	}

	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(String name) {
		
		int result = personDao.deletePerson(name);
		logger.debug(name+" 삭제결과: "+result);
		
		return "redirect:/list";
	}

}
