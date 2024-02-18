package kr.co.sky.common.reply.vo;

import kr.co.sky.common.page.PageVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVo extends PageVo {

	private static final long serialVersionUID = 1450725909118737407L;

	private int borIdx;
	private int borReplyIdx;
	private int borIdxRef;
	private String replyText;
	private String replyer;
	private String userId;
	private String secretReply;
	private String pageCnt;
	private String regDe;

}
