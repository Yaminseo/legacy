package kr.co.sky.common.menu.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sky.common.menu.dao.MenuDao;
import kr.co.sky.common.menu.service.MenuService;
import kr.co.sky.common.menu.vo.MenuVo;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	@Override
	public List<MenuVo> menuList() {
		return menuDao.menuList();
	}

	@Override
	public List<HashMap<String, Object>> menuList2() {
		List<HashMap<String, Object>> list = menuDao.menuList2();
		return list;
	}
}