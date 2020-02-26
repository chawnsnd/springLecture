package com.scitmasterA4.restApiTest.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class JwtUtil {

	private static final String SALT = "secret";

	public static String createAccessToken(String key, Object data, String subject) {
		String jwtString = Jwts.builder().setHeaderParam("typ", "JWT").setHeaderParam("expiresIn", "1h")
				.setExpiration(new Date(System.currentTimeMillis() + 1 * (1000 * 60 * 60 * 24))).setSubject(subject)
				.claim(key, data).signWith(SignatureAlgorithm.HS512, generateKey()).compact();
		return jwtString;
	}

	private static byte[] generateKey() {
		byte[] key = null;
		try {
			key = SALT.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return key;
	}

	public static boolean isUsable(String jwt) throws Exception {
		Jws<Claims> claims = Jwts.parser().setSigningKey(generateKey()).parseClaimsJws(jwt);
		return true;
	}

	public static Object get(String jwt, String key) throws Exception {
		Jws<Claims> claims = null;
		claims = Jwts.parser().setSigningKey(generateKey()).parseClaimsJws(jwt);
		
		@SuppressWarnings("unchecked")
		Object value = claims.getBody().get(key);
		return value;
	}
}
