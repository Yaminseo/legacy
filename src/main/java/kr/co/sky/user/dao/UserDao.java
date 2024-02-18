package kr.co.sky.user.dao;

import kr.co.sky.common.annotation.OracleSqlMapperScan;
import kr.co.sky.user.vo.UserVo;

@OracleSqlMapperScan
public interface UserDao {

	public int userCreateInsert(UserVo userVo);

	public boolean createIdCheck(String userId);

	public boolean createEmailCheck(String userEmail);

	public UserVo selectUserDetail(String userId);

	public UserVo selectUserDetail2(String userId);

	public int userUpdate(UserVo userVo);

	public UserVo findAccount(String pwEmail);

	public void userChangePwUpdate(UserVo userVo);
}
