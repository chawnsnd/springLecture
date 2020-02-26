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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.scitmasterA4.restApiTest.util.JwtUtil;
import com.scitmasterA4.restApiTest.vo.User;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@RestController
public class UserApiController {

	private ArrayList<User> users = new ArrayList<User>();
	private int cnt = 1;

	private static final Logger logger = LoggerFactory.getLogger(UserApiController.class);

	@PostMapping(value = "/users", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> joinUser(@RequestBody User user) {
		user.setUserno(cnt);
		cnt++;
		users.add(user);
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@PostMapping(value = "/users/login", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> loginUser(@RequestBody User reqUser, HttpServletResponse res) {
		for (User user : users) {
			if(user.getId().equals(reqUser.getId()) && user.getPassword().equals((reqUser.getPassword()))){				
				String accessToken = JwtUtil.createAccessToken("userno", reqUser.getUserno(), "userno");
				Cookie accessTokenCookie = new Cookie("access_token", accessToken);
				accessTokenCookie.setPath("/restApiTest");
				accessTokenCookie.setMaxAge(60*60*1);
				res.addCookie(accessTokenCookie);
				return new ResponseEntity<String>(HttpStatus.OK);
			}
		}
		return new ResponseEntity<String>(HttpStatus.UNAUTHORIZED);
	}
	@GetMapping(value = "/users/info", produces = "application/json;charset=UTF-8")
	public @ResponseBody User getUser(int userno) {
		User findUser = null;
		for (User user : users) {
			System.out.println(user.toString());
			if(user.getUserno() == userno) {
				findUser = user;
			}
		}
		return findUser;
	}
}
