package global.sesoc.web6;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("ajax")
public class AjaxController {

	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@RequestMapping(value = "/aj1", method = RequestMethod.GET)
	public String aj1() {
		return "aj1";
	}

	@ResponseBody
	@RequestMapping(value = "/ajaxtest1", method = RequestMethod.GET)
	public String test1() {
		logger.debug("ajax1 왔다감");
		return "ajax1 왔다감";
	}

	@ResponseBody
	@RequestMapping(value = "/ajaxtest2", method = RequestMethod.POST)
	public String test2(String str1, String str2) {
		logger.debug("ajax2 왔다감");
		return str1+", "+str2;
	}

	@ResponseBody
	@RequestMapping(value = "/insert1", method = RequestMethod.POST)
	public void insert1(String name, String age, String phone) {
		logger.debug("전달된 값 : {}, {}, {}", name, age, phone);
		return;
	}

	@ResponseBody
	@RequestMapping(value = "/insert2", method = RequestMethod.POST)
	public void insert2(Person person) {
		logger.debug("전달된 값 : {}", person);
		return;
	}

	@ResponseBody
	@RequestMapping(value = "/jsontest1", method = RequestMethod.GET)
	public Person jsontest1() {
		Person person1 = new Person();
		person1.setName("afd");
		person1.setAge(23);
		person1.setPhone("00001");
		logger.debug("전달된 값 : {}", person1);
		return person1;
	}

	@ResponseBody
	@RequestMapping(value = "/jsontest2", method = RequestMethod.GET)
	public Person jsontest2() {
		Person person2 = new Person();
		person2.setName("afd");
		person2.setAge(23);
		person2.setPhone("00001");
		logger.debug("전달된 값 : {}", person2);
		return person2;
	}
}
