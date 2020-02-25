package com.scitmasterA4.restApiTest.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.scitmasterA4.restApiTest.vo.User;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@RestController
public class UserApiController {

	private ArrayList<User> users = new ArrayList<User>();
	private int cnt = 1;

	private static final Logger logger = LoggerFactory.getLogger(UserApiController.class);

//	@GetMapping(value = "/users", produces = "application/json;charset=UTF-8")
//	public @ResponseBody ArrayList<Board> getBoards() {
//		return boards;
//	}

	@PostMapping(value = "/users", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> joinUser(@RequestBody User user) {
		user.setUserno(cnt++);
		users.add(user);
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@PostMapping(value = "/users/login", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> loginUser(@RequestBody User user, HttpServletResponse res) {
		user.setUserno(cnt++);
		users.add(user);
		String jwtString = Jwts.builder()
				.setHeaderParam("typ", "JWT")
				.setHeaderParam("expiresIn", "1h")
				.setExpiration(new Date(System.currentTimeMillis()+1*(1000*60*60*24)))
				.setSubject("id")
				.signWith(SignatureAlgorithm.HS512, user.getId())
				.compact();
		Cookie accessToken = new Cookie("access_token", jwtString);
		accessToken.setPath("/restApiTest");
		accessToken.setMaxAge(60*60*1);
		Cookie signedUserNo = new Cookie("signed_user_no", Integer.toString(user.getUserno()));
		signedUserNo.setPath("/restApiTest");
		signedUserNo.setMaxAge(60*60*1);
		res.addCookie(accessToken);
		res.addCookie(signedUserNo);
		return new ResponseEntity<String>(HttpStatus.OK);
	}

//	@PatchMapping(value = "/board/{boardno}", produces = "application/json;charset=UTF-8")
//	public ResponseEntity<String> patchBoard(@PathVariable int boardno, @RequestBody Board board) {
//		for (Board oldBoard : boards) {
//			if (oldBoard.getBoardno() == boardno) {
//				oldBoard.setTitle(board.getTitle());
//				oldBoard.setContent(board.getContent());
//				oldBoard.setWriter(board.getWriter());
//			}
//		}
//		return new ResponseEntity<String>(HttpStatus.OK);
//	}

//	@DeleteMapping(value = "/board/{boardno}", produces = "application/json;charset=UTF-8")
//	public ResponseEntity<String> deleteBoard(@PathVariable int boardno) {
//		for (Board board : boards) {
//			if (board.getBoardno() == boardno) {
//				boards.remove(board);
//				break;
//			}
//		}
//		return new ResponseEntity<String>(HttpStatus.OK);
//	}
}