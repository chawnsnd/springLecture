package com.scitmasterA4.restApiTest.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureException;

/**
 * 사용자 로그인 확인 인터셉터. HandlerInterceptorAdapter를 상속받아서 정의.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	// 콘트롤러의 메서드 실행 전에 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Cookie[] cookies = request.getCookies();
		String accessToken = "";
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("access_token")) {
					accessToken = cookie.getValue();
				}
			}
		}
		System.out.println("accessToken:"+accessToken);
		try {
			Jws<Claims> claims = Jwts.parser()
					  .setSigningKey("secret".getBytes("UTF-8"))
					  .parseClaimsJws(accessToken);
			String scope = (String) claims.getBody().get("scope");
			System.out.println(scope);
		}catch (SignatureException e) {
			response.setStatus(400);
			return false;
		}

		// 로그인 된 경우 요청한 경로로 진행
		return super.preHandle(request, response, handler);
	}
}
