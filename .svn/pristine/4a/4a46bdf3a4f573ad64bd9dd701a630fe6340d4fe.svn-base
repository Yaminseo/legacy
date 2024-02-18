package kr.co.sky.common.reply.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sky.common.reply.dao.ReplyDao;
import kr.co.sky.common.reply.service.ReplyService;
import kr.co.sky.common.reply.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	@Override
	public void insertReply(ReplyVo replyVo, HttpSession session) {
		replyVo.setReplyer((String) session.getAttribute("userNm"));
		replyVo.setUserId((String) session.getAttribute("userId"));
		replyDao.insertReply(replyVo);
	}

	@Override
	public List<ReplyVo> freeBoardListJsonReply(ReplyVo replyVo) {
		return replyDao.freeBoardListJsonReply(replyVo);
	}
}
