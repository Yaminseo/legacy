package kr.co.sky.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/main/")
public class MainController {

	/*@RequestMapping(value= {"/", "/main/mainPage.do"})
	public String mainPage(Model model) {
		model.addAttribute("data", "꿘대리");
		return "main/mainPage";
	}*/

	@RequestMapping(value="mainPage.do")
	public ModelAndView mainPage() {
		ModelAndView mv = new ModelAndView("main/mainPage");
		return mv;
	}
}
