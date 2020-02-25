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
}
