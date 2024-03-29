package kr.co.sky.common.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.sky.common.login.LoginManager;
import kr.co.sky.common.login.service.LoginService;
import kr.co.sky.common.login.vo.LoginVo;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping(value="/login/loginPage.do")
	public String loginPage() {
		return "login/loginPage";
	}

	/*@RequestMapping(value="loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@RequestParam(value="loginUserId") String userId, @RequestParam(value="loginUserPw") String userPw) {
		System.out.println(">>>>>>>>>> loginUserId :: "  + userId);
		System.out.println(">>>>>>>>>> loginUserPw :: "  + userPw);
		return "ok";
	}*/

	@RequestMapping(value={"/login/loginCheck.do"}, method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String loginCheck(LoginVo loginVo, HttpServletRequest req) {

		// 정직용
		System.out.println(">>>>>>>>>> vo loginUserId :: "  + loginVo.getLoginUserId());
		System.out.println(">>>>>>>>>> vo loginUserPw :: "  + loginVo.getLoginUserPw());

		// 프리용
		System.out.println(">>>>>>>>>> vo req :: "  + req.getParameter("loginUserId"));
		System.out.println(">>>>>>>>>> vo req :: "  + req.getParameter("loginUserPw"));

		return loginService.loginCheck(loginVo, req);
	}

	@RequestMapping(value={"/login/loginCheck2.do"}, method = RequestMethod.GET)
	public String loginCheck2(LoginVo loginVo, HttpServletRequest req, HttpServletResponse response) throws Exception {

		// PrintWrtier에서 한글 인코딩이 깨지는 경우 셋팅
		// 반드시 PrintWriter 객체 선언하기 전에 셋팅해줘야 함
		// response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('정상적으로 로그인이 되었습니다.'); location.href='/board/boardList.do'</script>");
		out.flush();	// 현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하고 비운다.

		return loginService.loginCheck(loginVo, req);
	}

	@RequestMapping(value="/login/logOut.do")
	@ResponseBody
	public String logOut(HttpSession session) {
		LoginManager loginManager = LoginManager.getInstance();
		String userId = (String) session.getAttribute("userId");
		if(userId == null) {
			loginManager.removeSession("");
		}else{
			loginManager.removeSession(userId);	//hash테이블에 해당 유저를 삭제한다
			//session.invalidate();
		}
		return "";
	}

	@RequestMapping(value="/login/naverCallBack.do")
	public String logOut(LoginVo loginVo, HttpServletRequest req) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> naverCallBack");

		return "cmm/login/naverCallBack";
	}
	@RequestMapping(value="/login/kakaoCallBack.do")
//	@ResponseBody
	public String kakaologOut(String code, HttpServletRequest req) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> kakaoCallBack");

		return "cmm/login/kakaoCallBack";

/*		public ModelAndView kakaologOut(String nickname, HttpServletRequest req) {
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> kakaoCallBack");
			ModelAndView mv = new ModelAndView("main/mainPage");
			return mv;*/

	}
}
