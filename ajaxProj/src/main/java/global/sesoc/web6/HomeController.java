package global.sesoc.web6;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping(value = "/js/js1", method = RequestMethod.GET)
	public String goJs1(Locale locale, Model model) {
		return "js1";
	}

	@RequestMapping(value = "/js/js2", method = RequestMethod.GET)
	public String goJs2(Locale locale, Model model) {
		return "js2";
	}

	@RequestMapping(value = "/jq/jq1", method = RequestMethod.GET)
	public String goJq1(Locale locale, Model model) {
		return "jq1";
	}

	@RequestMapping(value = "/jq/jq2", method = RequestMethod.GET)
	public String goJq2(Locale locale, Model model) {
		return "jq2";
	}

	@RequestMapping(value = "/jq/jq3", method = RequestMethod.GET)
	public String goJq3(Locale locale, Model model) {
		return "jq3";
	}
}
