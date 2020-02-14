package global.sesoc.web5;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private RestTemplate restTemplate;
	
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
	
	@RequestMapping(value = "/kakao", method = RequestMethod.GET)
	public String kakao() {
		String url = "https://kapi.kakao.com/v1/payment/ready";
		HashMap<String, String> body = new HashMap<>();
		body.put("cid", "1234567890");
		body.put("partner_order_id", "nizduck");
		body.put("item+name", "테스트 아이템");
		body.put("quantity", "0");
		body.put("total_amount", "12500");
		body.put("tax_free_amount", "10000");
		body.put("approval_url", "success");
		body.put("cancel_url", "cancel");
		body.put("fail_url", "fail");
		HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization",  "KakaoAK 57abf093db32388cf08564b9610bd993");
        HttpEntity<HashMap<String, String>> entity = new HttpEntity<HashMap<String, String>>(body, headers);
		
        ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
        if (response.getStatusCode() == HttpStatus.CREATED) {
            logger.debug("Request Successful");
            logger.debug(response.getBody());
        } else {
            logger.debug("Request Failed");
            logger.debug(response.getStatusCode().toString());
        }
		return "home";
	}
	
}
