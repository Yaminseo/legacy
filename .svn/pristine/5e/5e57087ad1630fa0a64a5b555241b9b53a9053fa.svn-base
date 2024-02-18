package kr.co.sky.common.session.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.sky.common.session.service.SessionMgrService;

public class SessionMgrController extends HandlerInterceptorAdapter {

	@Autowired
	private SessionMgrService sessionMgrService;

	private Log log = LogFactory.getLog(SessionMgrController.class);

	@Override	// 컨트롤러/핸들러 객체를 실행하기 전에 필요한 기능을 구현할 때 사용한다 /가장 많이 사용
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		boolean result = false;
		boolean check = false;
		HttpSession session = request.getSession(false);

		String requestUri = request.getRequestURI();

		System.out.println();

		if(!requestUri.equals("/") && session == null) {
			String uriTemp = "";
			if(requestUri.indexOf("?") > 0) {
				uriTemp = requestUri.substring(0, requestUri.indexOf("?"));
			} else {
				uriTemp = requestUri;
			}

			// DB화
//			String [] excludePage = {"userCreate4.do", "loginCheck.do", "loginPage.do"};	 //체크 페이지
			String [] excludePage = sessionMgrService.pageCheck();
			String [] uriData = uriTemp.split("/");

			if(uriData.length > 0) {
				System.out.println(">> :: 슬러쉬가 아닌경우");

				for(int j = 0; j < excludePage.length; j++) {
					if(uriData[uriData.length-1].equals(excludePage[j])) {
						check = true;
					}
				}
			}
		} else {
			check = true;
		}

		if(check != true) {
			if(session == null) {
				response.sendRedirect("/user/userCreate4.do?GBN=SESSIONOUT");
			} else {
				if(session.getAttribute("loginOk") == null) {
					response.sendRedirect("/user/userCreate4.do?GBN=SESSIONOUT");
				} else {
					result = true;
				}
			}
		} else {
			result = true;
		}
		return result;
	}

	@Override	// 컨트롤러/핸들러가 정상적으로 실행된 이후에 추가기능을 구현할 때 사용한다/ 잘 안씀
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

}
