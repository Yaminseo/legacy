package kr.co.sky.board.dao;

import java.util.List;

import kr.co.sky.board.vo.BoardVo;
import kr.co.sky.common.annotation.OracleSqlMapperScan;

@OracleSqlMapperScan
public interface BoardDao {

	public List<BoardVo> boardList(BoardVo boardVo);

	public List<BoardVo> freeList(BoardVo boardVo);

	public int selectFreeBoardListCount(BoardVo boardVo);

	public void boardSave(BoardVo boardVo);

	public BoardVo boardDetail(BoardVo boardVo);

	public void freeBoardUpdateCnt(String freeBorIdx);

	public BoardVo selectBoardDetailUpdate(BoardVo boardVo);

	public void mergeLike(BoardVo boardVo);

	public boolean BoardDelete(BoardVo boardVo);

	public void boardUpdate(BoardVo boardVo);

	public boolean boardDelete(BoardVo boardVo);

	public void boardReplyDelete(BoardVo boardVo);

	public void boardlikeDelete(BoardVo boardVo);

}
