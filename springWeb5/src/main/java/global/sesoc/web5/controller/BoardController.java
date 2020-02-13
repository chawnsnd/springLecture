package global.sesoc.web5.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import global.sesoc.web5.dao.BoardDao;
import global.sesoc.web5.util.FileService;
import global.sesoc.web5.util.PageNavigator;
import global.sesoc.web5.vo.Board;

@Controller
@RequestMapping("board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String UPLOAD_PATH = "/home/junwoong/boardfile";
	private static final int COUNT_PER_PAGE = 10;
	private static final int PAGE_PER_GROUP = 5;

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String goToBoard1(Model model) {
		ArrayList<Board> boardList = boardDao.selectAllBoard();
		model.addAttribute("boardList", boardList);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goToBoard2(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "searchText", defaultValue = "") String searchText, Model model) {
		int boardCount = boardDao.selectAllBoardCountBySearchText(searchText);
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, page, boardCount);
		ArrayList<Board> boardList = boardDao.selectAllBoardByNaviAndSearchText(searchText, navi);

		for (Board board : boardList) {
			board.setLikes(boardDao.selectLike(board.getBoardnum()));
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		return "board/list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String goToWriteForm() {
		return "board/writeForm";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board, HttpSession session, Model model, MultipartFile upload) {
		if (board.getTitle().equals("") || board.getContents().equals("")) {
			model.addAttribute("writeSuccess", "false");
			model.addAttribute("board", board);
			return "board/writeForm";
		}
		board.setId((String) session.getAttribute("loginId"));
		if (upload != null) {
			String savedfile = FileService.saveFile(upload, UPLOAD_PATH);
			board.setSavedfile(savedfile);
			board.setOriginalfile(upload.getOriginalFilename());
		}

		boardDao.insertBoard(board);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String goToModifyForm(int boardnum, Model model, HttpSession session) {
		Board board = boardDao.selectBoard(boardnum);
		if (!board.getId().equals(session.getAttribute("loginId"))) {
			model.addAttribute("authSuccess", "false");
		} else {
			model.addAttribute("board", board);
			session.setAttribute("modifyBoardnum", boardnum);
		}
		return "board/modifyForm";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Board board, Model model, HttpSession session) {
		if (board.getTitle().equals("") || board.getContents().equals("")) {
			model.addAttribute("modifySuccess", "false");
			model.addAttribute("board", board);
			return "board/modifyForm";
		}
		int boardnum = (int) session.getAttribute("modifyBoardnum");
		session.removeAttribute("modifyBoardnum");
		Board oldBoard = boardDao.selectBoard(boardnum);
		if (!oldBoard.getId().equals(session.getAttribute("loginId"))) {
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
	public String goToRead(int boardnum, Model model, HttpSession session) {
		boardDao.updateHits(boardnum);
		Board board = boardDao.selectBoard(boardnum);
		board.setLikes(boardDao.selectLike(board.getBoardnum()));
		if (session.getAttribute("loginId") != null) {
			model.addAttribute("like",
					boardDao.selectLikeCount(boardnum, (String) session.getAttribute("loginId")) >= 1);
		}
		model.addAttribute("board", board);
		return "board/read";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int boardnum, Model model, HttpSession session) {
		Board board = boardDao.selectBoard(boardnum);
		if (!board.getId().equals(session.getAttribute("loginId"))) {
			model.addAttribute("authSuccess", "false");
			model.addAttribute("deleteSuccess", "false");
			return "board/deleteResult";
		}
		boardDao.deleteBoard(boardnum);
		model.addAttribute("deleteSuccess", "true");
		return "board/deleteResult";
	}

	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(int boardnum, Model model, HttpServletResponse response) {
		Board board = boardDao.selectBoard(boardnum);
		String originalfile = new String(board.getOriginalfile());
		String fullPath = UPLOAD_PATH + "/" + board.getSavedfile();

		FileService.download(originalfile, fullPath, response);

		return null;
	}

	@RequestMapping(value = "/like", method = RequestMethod.GET)
	@ResponseBody
	public String like(int boardnum, HttpSession session) {
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> like = new HashMap<>();
		if (boardDao.selectLikeCount(boardnum, (String) session.getAttribute("loginId")) >= 1) {
			boardDao.deleteLike(boardnum, (String) session.getAttribute("loginId"));
			like.put("like", false);
		} else {
			boardDao.insertLike(boardnum, (String) session.getAttribute("loginId"));
			like.put("like", true);
		}
		like.put("likeCount", boardDao.selectLike(boardnum));

		try {
			json = mapper.writeValueAsString(like);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}
}
