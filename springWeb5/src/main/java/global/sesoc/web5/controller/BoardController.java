package global.sesoc.web5.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web5.dao.BoardDao;
import global.sesoc.web5.vo.Board;

@Controller
@RequestMapping("board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String goToBoard1(Model model) {
		ArrayList<Board> boardList = boardDao.selectAllBoard();
		model.addAttribute("boardList", boardList);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goToBoard2(Model model) {
		ArrayList<Board> boardList = boardDao.selectAllBoard();
		model.addAttribute("boardList", boardList);
		return "board/list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String goToWriteForm() {
		return "board/writeForm";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board, HttpSession session, Model model) {
		if(board.getTitle().equals("") || board.getContents().equals("")) {
			model.addAttribute("writeSuccess", "false");
			model.addAttribute("board", board);
			return "board/writeForm";
		}
		board.setId((String) session.getAttribute("loginId"));
		boardDao.insertBoard(board);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String goToModifyForm(int boardnum, Model model, HttpSession session) {
		Board board = boardDao.selectBoard(boardnum);
		if(!board.getId().equals(session.getAttribute("loginId"))) {
			model.addAttribute("authSuccess", "false");
		}else {
			model.addAttribute("board", board);			
		}
		return "board/modifyForm";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Board board, Model model, HttpSession session) {
		if(board.getTitle().equals("") || board.getContents().equals("")) {
			model.addAttribute("modifySuccess", "false");
			model.addAttribute("board", board);
			return "board/modifyForm";
		}
		Board oldBoard = boardDao.selectBoard(board.getBoardnum());
		if(!oldBoard.getId().equals(session.getAttribute("loginId"))) {
			model.addAttribute("authSuccess", "false");
			return "board/modifyForm";
		}
		oldBoard.setTitle(board.getTitle());
		oldBoard.setContents(board.getContents());
		oldBoard.setOriginalfile(board.getOriginalfile());
		boardDao.updateBoard(oldBoard);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String goToRead(int boardnum, Model model) {
		boardDao.updateHits(boardnum);
		Board board = boardDao.selectBoard(boardnum);
		model.addAttribute("board", board);
		return "board/read";
	}
}
