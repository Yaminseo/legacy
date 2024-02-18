package kr.co.sky.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.sky.user.service.UserService;
import kr.co.sky.user.vo.UserVo;

@Controller
@RequestMapping(value="/user/")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value="userCreate.do")
	public String userCreate() {
		return "user/userCreate";
	}

	@RequestMapping(value="userCreate4.do")
	public String userCreate4() {
		return "user/userCreate4";
	}

	@RequestMapping(value="userCreateInsert.do")
	public String userCreateInsert(UserVo userVo) {
		System.out.println(">>>>>> userVo :: " + userVo.toString());
		userService.userCreateInsert(userVo);
		return "user/userCreate4";
	}

	@RequestMapping(value="createIdCheck.do")
	@ResponseBody
	public boolean createIdCheck(@RequestParam String userId) {
		System.out.println(">>>>>> userId :: " + userId);
		boolean result = userService.createIdCheck(userId);
		return result;
	}

	@RequestMapping(value="createEmailCheck")
	@ResponseBody
	public boolean createEmailCheck(@RequestParam String userEmail) {
		boolean result = userService.createEmailCheck(userEmail);
		return result;
	}

	@RequestMapping(value="myPage.do")
	public ModelAndView myPage(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("userInfo", userService.myPage(req));
		mv.setViewName("user/myPage");

		return mv;
	}

	@RequestMapping(value="pwCheck.do")
	@ResponseBody
	public String pwCheck(@RequestParam String password, HttpServletRequest req) {
		String result = userService.pwCheck(password, req);
		return result;
	}

	@RequestMapping(value="userUpdate.do")
	@ResponseBody
	public String userUpdate(UserVo userVo) {
		String result = userService.userUpdate(userVo);
		return result;
	}
}