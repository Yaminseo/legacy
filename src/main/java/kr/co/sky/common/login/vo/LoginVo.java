package kr.co.sky.common.login.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class LoginVo implements Serializable {

	private static final long serialVersionUID = -5560429317340466579L;

	private String loginUserId;
	private String loginUserPw;
	private String nickname;
	private String success;
	private String state;

}