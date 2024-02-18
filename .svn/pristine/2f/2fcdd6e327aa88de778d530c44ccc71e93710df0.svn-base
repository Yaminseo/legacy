package kr.co.sky.common.session.service.impl;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sky.common.session.dao.SessionMgrDao;
import kr.co.sky.common.session.service.SessionMgrService;

@Service
public class SessionMgrServiceImpl implements SessionMgrService {

	@Autowired
	private SessionMgrDao sessionMgrDao;

	@Override
	public String[] pageCheck() {
		System.out.println(">>>>>>>" + Arrays.toString(sessionMgrDao.pageCheck()));
		return sessionMgrDao.pageCheck();
	}

}