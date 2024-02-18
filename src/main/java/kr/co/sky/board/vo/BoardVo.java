package kr.co.sky.board.vo;

import kr.co.sky.common.page.PageVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVo extends PageVo {

	private static final long serialVersionUID = 5489494380803380846L;

	private String seq;
	private String codeId;
	private String codeNm;
	private String codeType;
	private String value1;
	private String value2;
	private String value3;
	private String value4;
	private String value5;
	private String value6;
	private String value7;
	private String value8;
	private String value9;
	private String value10;
	private String useYn;
	private String regId;
	private String regDe;


	private String searchOption;
	private String searchNm;

	private String freeBorIdx;
	private String freeBorTitle;
	private String userNm;
	private String userId;
	private String freeBorContents;
	private String freeBorViewCnt;
	private String updateId;
	private String updateDe;
	private String delDe;
	private String delId;

	private String likeCnt;
	private String replyCnt;
	private String newYn;

	private String pageCnt;
	private String preface;
	private String prefaceNm;
}
