package global.sesoc.web1;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
		
	// 메인화면으로 이동
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		return "home";
	}

	// 회원가입화면으로 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoinForm(Locale locale, Model model) {
		return "joinForm";
	}

	// 회원가입
	@RequestMapping(value = "/join2", method = RequestMethod.POST)
	public String join(String id, String password, String name, String phone) {
		System.out.println("======== 회원가입폼에서 입력받은 값 ============");
		System.out.println("ID : "+id);
		System.out.println("비밀번호 : "+password);
		System.out.println("이름 : "+name);
		System.out.println("전화번호 : "+phone);
		
		return "redirect:/";
		/*
		 * 리다이렉트 : 클라이언트가 다른 URL로 움직이게 하기 return "redirect:/login"
		 * 포워드 : 토스 return "login";
		 */
	}
	
	// 로그인화면으로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLoginForm(Locale locale, Model model) {
		return "loginForm";
	}

	// 로그인
	@RequestMapping(value = "/login2", method = RequestMethod.POST)
	public String login(String id, String password, HttpServletRequest req) {
		System.out.println("======== 로그인폼에서 입력받은 값 ============");
		System.out.println("ID : "+id);
		System.out.println("비밀번호 : "+password);
		HttpSession session = req.getSession();
		session.setAttribute("id", id);
		return "redirect:/";
	}

	// 기사화면으로 이동
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read() {
		return "read";
	}
}