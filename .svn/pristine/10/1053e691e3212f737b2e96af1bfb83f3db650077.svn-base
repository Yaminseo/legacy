package kr.co.sky.common.login.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sky.common.login.LoginManager;
import kr.co.sky.common.login.dao.LoginDao;
import kr.co.sky.common.login.service.LoginService;
import kr.co.sky.common.login.vo.LoginVo;
import kr.co.sky.user.vo.UserVo;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;

	@Override
	public String loginCheck(LoginVo loginVo, HttpServletRequest req) {

		LoginManager loginManager = LoginManager.getInstance();
		HttpSession session = req.getSession();

		String result = "ok";

		if(loginVo.getNickname() != null) {
			loginManager.setSession(req.getSession(), "naver");
			session.setAttribute("loginOk", true);
			session.setAttribute("userId", "naver");
			session.setAttribute("userNm", "네이버");

			return result;
		}

		UserVo userVo = loginDao.loginCheck(loginVo);

		if(userVo == null) {
			result = "fal";
		} else if(BCrypt.checkpw(loginVo.getLoginUserPw(), userVo.getUserPw())) {
			// 세션 생성
			loginManager.setSession(req.getSession(), userVo.getUserId());
			session.setAttribute("loginOk", true);
			session.setAttribute("userId", userVo.getUserId());
			session.setAttribute("userNm", userVo.getUserNm());
		} else {
			result = "fal";
		}

		return result;
	}
}