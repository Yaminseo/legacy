package kr.co.sky.common.menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.sky.common.menu.service.MenuService;
import kr.co.sky.common.menu.vo.MenuVo;

@Controller
@RequestMapping(value="/menu/")
public class MenuController {

	@Autowired
	private MenuService menuService;

	@RequestMapping(value= "/menuList.do")
	public ModelAndView menuList() {

		ModelAndView mv = new ModelAndView("cmm/menu/menuList");
		// mv.setViewName("main/mainPage");

		// 정직용
		List<MenuVo> menuVo = menuService.menuList();
		mv.addObject("menuList", menuVo);

		// 프리용
		// mv.addObject("menuList2", menuService.menuList2());

		return mv;
	}

	@RequestMapping(value="/bottom.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView setBottomPage(){
		ModelAndView mv = new ModelAndView("common/bottom");
		return mv;
	}
}
