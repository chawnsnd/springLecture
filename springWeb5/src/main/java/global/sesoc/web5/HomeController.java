package global.sesoc.web5;

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
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goToJoinForm() {
		return "joinForm";
	}

	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	public String goToCheckIdForm() {
		return "checkIdForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goToLoginForm() {
		return "loginForm";
	}

	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String goToUserInfoForm() {
		return "userInfoForm";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String goToBoard() {
		return "board";
	}

	@RequestMapping(value = "/writeBoard", method = RequestMethod.GET)
	public String goToWriteBoardForm() {
		return "writeBoardForm";
	}

	@RequestMapping(value = "/modifyBoard", method = RequestMethod.GET)
	public String goToModifyBoardForm() {
		return "modifyBoardForm";
	}

	@RequestMapping(value = "/readBoard", method = RequestMethod.GET)
	public String goToReadBoard() {
		return "readBoard";
	}
	
}
