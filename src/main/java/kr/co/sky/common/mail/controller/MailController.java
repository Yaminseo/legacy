package kr.co.sky.common.mail.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.sky.common.mail.service.MailService;
import kr.co.sky.user.service.UserService;
import kr.co.sky.user.vo.UserVo;

/**
 * 메일 발송 Controller
 *
 * @author 정영진
 * @since 2017. 05. 23. 오전 10:17:21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일		      수정자		                         수정내용
 *  -------    	 --------    ---------------------------
 * 2017. 05. 23.   정영진                                     최초생성
 *
 * </pre>
 */

@Controller
@RequestMapping(value="/mail")
public class MailController {

	private Log log = LogFactory.getLog(MailController.class);

	private static String sendEmailId = "remember9659@gmail.com";

	@Autowired
	private UserService userService;

	@Autowired
	private MailService mailService;

	/**
	 * @Method joinCode
	 * @Date 2017. 05. 23.
	 * @Writter skysky(정지수)
	 * @Param HttpSession
	 * @Param String
	 * @Param Model
	 * @EditHistory
	 * @Discript 회원가입 이메일 인증.
	 * @Return boolean
	 */

	// 회원가입 이메일 인증
	@RequestMapping(value = "/joinCode.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean joinCode(HttpSession session, @RequestParam("joinEmail") String email, Model model) {
		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999 랜덤 숫자 발급
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);

		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");

		return mailService.send(subject, sb.toString(), sendEmailId, email, null);
	}


	/**
	 * @Method joinCodeCheck
	 * @Date 2017. 05. 23.
	 * @Writter skysky(정지수)
	 * @Param HttpSession
	 * @Param String
	 * @EditHistory
	 * @Discript 인증번호 일치 여부.
	 * @Return ResponseEntity<String>
	 */

	@RequestMapping(value = "/joinCodeCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> joinCodeCheck(String joinCode, HttpSession session) {
		String originalJoinCode = (String) session.getAttribute("joinCode");
		if(originalJoinCode.equals(joinCode)) return new ResponseEntity<String>("certification", HttpStatus.OK);
		else return new ResponseEntity<String>("false", HttpStatus.OK);
	}

	/**
	 * @Method sendMailId
	 * @Date 2017. 05. 23.
	 * @Writter skysky(정지수)
	 * @Param HttpSession
	 * @Param String
	 * @Param RedirectAttributes
	 * @EditHistory
	 * @Discript 이메일 아이디 찾기.
	 * @Return String
	 */

	@RequestMapping(value="/sendMail.do", method=RequestMethod.POST)
	public String sendMailId(HttpSession session, @RequestParam("email") String email, RedirectAttributes ra) {

		/*UserVo userVo = userService.findAccount(email);

		if (userVo != null) {
			String subject = "요청하신 아이디 찾기 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 아이디는 " + userVo.getUserId() + " 입니다.");
			mailService.send(subject, sb.toString(), sendEmailId, email, null);
			ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
		} else {
			ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
		}*/
		return "redirect:/main/technicalView.do";
	}

	/**
	 * @Method sendMailPassword
	 * @Date 2017. 05. 23.
	 * @Writter skysky(정지수)
	 * @Param HttpSession
	 * @Param String
	 * @Param String
	 * @Param RedirectAttributes
	 * @EditHistory
	 * @Discript 이메일 비밀번호 초기화 찾기.
	 * @Return String
	 */

	// 비밀번호 찾기
	@RequestMapping(value = "/resetPassword.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendMailPassword(HttpSession session, @RequestParam String pwUserId, @RequestParam String pwEmail, RedirectAttributes ra) {

		UserVo userVo = userService.findAccount(pwEmail);

		if (userVo != null) {
			if (!userVo.getUserId().equals(pwUserId)) {
				ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
				return "redirect:/user/userCreate4.do";
			}

			String password = "";
			// String encryptPassWord = "";
			char pwCollection[] = new char[] {'1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
					'P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u',
					'v','w','x','y','z','!','@','#','$','%','^','&','*','(',')'};

			for(int i = 0; i < 8; i++){
				int selectRandomPw = (int)(Math.random()*(pwCollection.length));
				password += pwCollection[selectRandomPw];
			}

			String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
			//encryptPassWord = (String)Sha256Util.encrypt(password);
			userVo.setUserPw(hashPassword);

			userService.userChangePwUpdate(userVo);

			String subject = "임시 비밀번호 발급 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
			mailService.send(subject, sb.toString(), sendEmailId, pwEmail, null);
			ra.addFlashAttribute("resultPwMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
		} else {
			ra.addFlashAttribute("resultPwMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
		}
		return "ok";
	}
}