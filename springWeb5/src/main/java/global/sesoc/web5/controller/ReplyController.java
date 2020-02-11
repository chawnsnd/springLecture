package global.sesoc.web5.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import global.sesoc.web5.dao.ReplyDao;
import global.sesoc.web5.vo.Reply;


@Controller
@RequestMapping("reply")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private ReplyDao replyDao;

	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String replyList(int boardnum) {
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> data = new HashMap<>();
		ArrayList<Reply> replyList = replyDao.selectReplyByBoardnum(boardnum);
		data.put("replyList", replyList);
		
		try {
			json = mapper.writeValueAsString(data);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String write(Reply reply, HttpSession session) {
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> data = new HashMap<>();
		reply.setId((String) session.getAttribute("loginId"));
		data.put("result", replyDao.insertReply(reply));
		
		try {
			json = mapper.writeValueAsString(data);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String modify(Reply reply, HttpSession session) {
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> data = new HashMap<>();
		Reply oldReply = replyDao.selectReply(reply.getReplynum());
		if(oldReply.getId().equals(session.getAttribute("loginId"))) {
			data.put("success", replyDao.updateReply(reply));
		}else {
			data.put("success", false);
		}
		try {
			json = mapper.writeValueAsString(data);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(int replynum, HttpSession session) {
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> data = new HashMap<>();
		Reply reply = replyDao.selectReply(replynum);
		if(reply.getId().equals(session.getAttribute("loginId"))) {
			data.put("success", replyDao.deleteReply(reply.getReplynum()));
		}else {
			data.put("success", false);
		}
		try {
			json = mapper.writeValueAsString(data);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}
}
