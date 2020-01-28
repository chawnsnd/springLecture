package global.sesoc.web3.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web3.dao.PersonDao;
import global.sesoc.web3.vo.Person;

@Controller
public class JoinController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	
	// 여기가 SchoolManager
//	private PersonDao personDao = new PersonDao();
	
//	@Autowired
//	private Logger logger;
	
	@Autowired
	private PersonDao personDao;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(Person person) {
		
		int result = personDao.insertPerson(person);
		
		logger.info(person+"입력 결과: "+result);
		
		return "redirect:/";
	}

}
