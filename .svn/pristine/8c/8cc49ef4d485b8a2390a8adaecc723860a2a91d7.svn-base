package kr.co.sky.user.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sky.common.login.dao.LoginDao;
import kr.co.sky.common.login.vo.LoginVo;
import kr.co.sky.user.dao.UserDao;
import kr.co.sky.user.service.UserService;
import kr.co.sky.user.vo.UserVo;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private LoginDao loginDao;

	@Override
	public boolean userCreateInsert(UserVo userVo) {
		userVo.setUserNm(userVo.getUserNm() + "_TX");		// 서동성 -> 서동성_TX

		String hashPassword = BCrypt.hashpw(userVo.getUserPw(), BCrypt.gensalt());
		userVo.setUserPw(hashPassword);		// 암호화 저장

		int cnt = userDao.userCreateInsert(userVo);
		System.out.println("cnt Test : " + cnt);

		boolean result = false;
		if(cnt > 0) result = true;

		return result;
	}

	@Override
	public boolean createIdCheck(String userId) {
		return userDao.createIdCheck(userId);
	}

	@Override
	public boolean createEmailCheck(String userEmail) {
		return userDao.createEmailCheck(userEmail);
	}

	@Override
	public UserVo myPage(HttpServletRequest req) {
		HttpSession session = req.getSession();

		String userId = session.getAttribute("userId").toString();
		UserVo userVo = userDao.selectUserDetail2(userId);

		System.out.println(userVo.toString());

		return userVo;
	}

	@Override
	public String pwCheck(String password, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String result = "";
		String userId = session.getAttribute("userId").toString();
		LoginVo loginVo = new LoginVo();
		loginVo.setLoginUserId(userId);

		UserVo userVo = loginDao.loginCheck(loginVo);

		if(BCrypt.checkpw(password, userVo.getUserPw())) result = "SUCC";
		else result = "FAIL";

		return result;
	}

	@Override
	public String userUpdate(UserVo userVo) {
		userVo.setUserNm(userVo.getUserNm() + "_TX");		// 서동성 -> 서동성_TX

		String hashPassword = BCrypt.hashpw(userVo.getUserPw(), BCrypt.gensalt());
		userVo.setUserPw(hashPassword);		// 암호화 저장
		Boolean flag = userDao.userUpdate(userVo) > 0;
		String result = "";
		if(flag) result = "SUCC";
		else result = "FAIL";
		return result;
	}

	@Override
	public UserVo findAccount(String pwEmail) {
		return userDao.findAccount(pwEmail);
	}

	@Override
	public void userChangePwUpdate(UserVo userVo) {
		userDao.userChangePwUpdate(userVo);
	}
}
