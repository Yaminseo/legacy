package kr.co.sky.user.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVo implements Serializable {

	private static final long serialVersionUID = -4308961795634075112L;

	private String userId;
	private String userNm;
	private String userPw;
	private String userEmail;
	private String userPhone;
	private String userFirstAddr;
	private String userSecondAddr;

}
