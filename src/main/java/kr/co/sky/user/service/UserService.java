package kr.co.sky.user.service;

import javax.servlet.http.HttpServletRequest;

import kr.co.sky.user.vo.UserVo;

public interface UserService {

	public boolean userCreateInsert(UserVo userVo);

	public boolean createIdCheck(String userId);

	public boolean createEmailCheck(String userEmail);

	public UserVo myPage(HttpServletRequest req);

	public String pwCheck(String password, HttpServletRequest req);

	public String userUpdate(UserVo userVo);

	public UserVo findAccount(String pwEmail);

	public void userChangePwUpdate(UserVo userVo);

}
