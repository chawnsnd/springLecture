package global.sesoc.web5.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goToBoard() {
		return "board/list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String goToWriteForm() {
		return "board/writeForm";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String goToModifyForm() {
		return "board/modifyForm";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String goToRead() {
		return "board/read";
	}
}
