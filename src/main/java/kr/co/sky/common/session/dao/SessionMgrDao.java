package kr.co.sky.common.session.dao;

import kr.co.sky.common.annotation.OracleSqlMapperScan;

@OracleSqlMapperScan
public interface SessionMgrDao {

	public String[] pageCheck();

}
