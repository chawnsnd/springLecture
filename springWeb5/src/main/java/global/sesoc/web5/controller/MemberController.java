package global.sesoc.web5.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web5.dao.MemberDao;
import global.sesoc.web5.util.SnsOAuth;
import global.sesoc.web5.vo.Member;
import global.sesoc.web5.vo.SnsMember;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SnsOAuth snsOAuth;
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String goToJoinForm() {
		
		return "customer/joinForm";
	}

	@RequestMapping(value = "naverLogin", method = RequestMethod.GET)
	public String goToNaverJoinForm(HttpServletRequest req, Model model, HttpSession session) {
		
		snsOAuth.setAccessToken(req.getParameter("code"), req.getParameter("state"));
		Map<String, String> userInfo = snsOAuth.getUserInfo();
        SnsMember snsMember = memberDao.getSnsMember(userInfo.get("id"));
        if(snsMember!=null) {
        	Member member = memberDao.getMember(snsMember.getId());
        	session.setAttribute("loginId", member.getId());
        	session.setAttribute("loginName", member.getName());
        	return "redirect:/";
        }else {
        	String tempPassword = ""; 
        	for(int i=0; i<8; i++) { 
        		int rndVal = (int)(Math.random() * 62); 
        		if(rndVal < 10) { 
        			tempPassword += rndVal; 
        		} else if(rndVal > 35) { 
        			tempPassword += (char)(rndVal + 61);
        		} else { 
        			tempPassword += (char)(rndVal + 55);
        		}
        	}
        	Member member = new Member();
        	member.setId(userInfo.get("email"));
        	member.setPassword(tempPassword);
        	member.setEmail(userInfo.get("email"));
        	member.setName(userInfo.get("name"));
        	memberDao.insertMember(member);
        	SnsMember newSnsMember = new SnsMember();
        	newSnsMember.setId(member.getId());
        	newSnsMember.setSns_id(userInfo.get("id"));
        	newSnsMember.setSns_type("naver");
        	memberDao.inserSnsMember(newSnsMember);
        	Member member2 = memberDao.getMember(newSnsMember.getId());
        	session.setAttribute("authMember", member2);
        	return "redirect:/";
        }
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Member member, Model model) {
		logger.debug("회원가입 요청 Member: "+member.toString());
		boolean result= memberDao.insertMember(member);
		if(result) {
			logger.debug("가입 성공");
			return "redirect:/";
		}else {
			logger.debug("가입 실패");
			model.addAttribute("joinFailed", true);
			return "customer/joinForm";
		}
	}

	@RequestMapping(value = "checkId", method = RequestMethod.GET)
	public String goToCheckIdForm() {
		return "customer/checkIdForm";
	}

	@RequestMapping(value = "checkId", method = RequestMethod.POST)
	public String checkId(String id, Model model) {
		model.addAttribute("id", id);
		if(memberDao.getMember(id)!=null) {
			logger.debug("아이디 있음");
			model.addAttribute("unique", false);
		}else {
			logger.debug("아이디 없음");
			model.addAttribute("unique", true);
		}
		return "customer/checkIdForm";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String goToLoginForm() {
		return "customer/loginForm";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String id, String password, HttpSession session, Model model) {
		logger.debug("id: "+id+", pw: "+password);
		Member member = memberDao.getMember(id);
		if(member == null || member.getPassword().equals(password)) {
			logger.debug("로그인 실패");
			model.addAttribute("loginFailed", true);
			return "customer/loginForm";
		}else {
			logger.debug("로그인 : "+member.toString());
			session.setAttribute("loginId", member.getId());
			session.setAttribute("loginName", member.getName());
			return "redirect:/";
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.setAttribute("loginId", null);
		session.setAttribute("loginName", null);
		return "redirect:/";
	}

	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String goToInfoForm(HttpSession session, Model model) {
		String id = (String) session.getAttribute("loginId");
		Member member = memberDao.getMember(id);
		model.addAttribute("member", member);
		return "customer/infoForm";
	}

	@RequestMapping(value = "info", method = RequestMethod.POST)
	public String updateInfo(Member member, Model model, HttpSession session) {
		member.setId((String) session.getAttribute("loginId"));
		boolean result= memberDao.updateMember(member);
		if(result) {
			Member updatedMember = memberDao.getMember(member.getId());
			session.setAttribute("authMember", updatedMember);
			return "redirect:/";
		}else {
			model.addAttribute("updateFailed", true);
			return "customer/infoForm";
		}
	}
}
