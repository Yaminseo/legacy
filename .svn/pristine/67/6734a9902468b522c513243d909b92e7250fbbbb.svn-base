package kr.co.sky.common.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.sky.common.reply.service.ReplyService;
import kr.co.sky.common.reply.vo.ReplyVo;

@RestController
@RequestMapping(value="/reply/")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	@RequestMapping(value="insertReply.do")
	public ResponseEntity<String> insertReply(ReplyVo replyVo, HttpSession session) {

		ResponseEntity<String> entity = null;

		try {
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
			replyService.insertReply(replyVo, session);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="boardListReply.do", method=RequestMethod.POST)
	public List<ReplyVo> boardJsonListReply(ReplyVo replyVo) {
		List<ReplyVo> replyList = replyService.freeBoardListJsonReply(replyVo);
		return replyList;
	}
}
