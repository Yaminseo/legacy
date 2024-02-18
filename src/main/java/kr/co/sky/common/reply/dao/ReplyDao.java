package kr.co.sky.common.reply.dao;

import java.util.List;

import kr.co.sky.common.annotation.OracleSqlMapperScan;
import kr.co.sky.common.reply.vo.ReplyVo;

@OracleSqlMapperScan
public interface ReplyDao {

	public void insertReply(ReplyVo replyVo);

	public List<ReplyVo> freeBoardListJsonReply(ReplyVo replyVo);

}
