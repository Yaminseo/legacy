package kr.co.sky.common.login.service;

import javax.servlet.http.HttpServletRequest;

import kr.co.sky.common.login.vo.LoginVo;

public interface LoginService {

	public String loginCheck(LoginVo loginVo, HttpServletRequest req);

}
