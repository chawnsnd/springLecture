package global.sesoc.web5.util;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class SnsOAuth {
	
	private static final Logger logger = LoggerFactory.getLogger(SnsOAuth.class);


	@Autowired
	private RestTemplate restTemplate;
	
	private final String naverAuthUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	private final String naverClientId = "Bh9GX6eaqwK4vmyWdvGV";
	private final String naverClientSecret = "E3JIZxnlHD";
	private String accessToken;
	
	public void setAccessToken(String code, String state) {
		String url = naverAuthUrl
				+"&client_id="+naverClientId
				+"&client_secret="+naverClientSecret
				+"&code="+code
				+"&state="+state;
		Map<String, String> obj = restTemplate.getForObject(url, Map.class);
		accessToken = obj.get("access_token");
		logger.debug(accessToken);
	}
	
	public Map<String, String> getUserInfo() {
		HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization",  "Bearer "+accessToken);        
        HttpEntity<String> entity = new HttpEntity<String>(headers);
        Map<String , String> userInfo = (Map<String , String>) restTemplate
        		.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.GET, entity, Map.class)
        		.getBody()
        		.get("response");
		return userInfo;
	}
}
