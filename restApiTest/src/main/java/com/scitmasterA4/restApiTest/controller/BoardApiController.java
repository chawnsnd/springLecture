package com.scitmasterA4.restApiTest.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.scitmasterA4.restApiTest.vo.Board;

@RestController
public class BoardApiController {

	private ArrayList<Board> boards = new ArrayList<Board>();
	private int cnt = 1;

	private static final Logger logger = LoggerFactory.getLogger(BoardApiController.class);

	@GetMapping(value = "/boards", produces = "application/json;charset=UTF-8")
	public @ResponseBody ArrayList<Board> getBoards() {
		return boards;
	}

	@GetMapping(value = "/boards/{boardno}", produces = "application/json;charset=UTF-8")
	public @ResponseBody Board getBoard(@PathVariable int boardno) {
		Board findBoard = null;
		for (Board board : boards) {
			if (board.getBoardno() == boardno)
				findBoard = board;
		}
		return findBoard;
	}

	@PostMapping(value = "/boards", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> postBoard(@RequestBody Board board) {
		board.setBoardno(cnt++);
		boards.add(board);
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@PatchMapping(value = "/boards/{boardno}", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> patchBoard(@PathVariable int boardno, @RequestBody Board board) {
		for (Board oldBoard : boards) {
			if (oldBoard.getBoardno() == boardno) {
				oldBoard.setTitle(board.getTitle());
				oldBoard.setContent(board.getContent());
				oldBoard.setWriter(board.getWriter());
			}
		}
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@DeleteMapping(value = "/boards/{boardno}", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> deleteBoard(@PathVariable int boardno) {
		for (Board board : boards) {
			if (board.getBoardno() == boardno) {
				boards.remove(board);
				break;
			}
		}
		return new ResponseEntity<String>(HttpStatus.OK);
	}
}
