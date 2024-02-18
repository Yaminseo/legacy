package kr.co.sky.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.sky.board.vo.BoardVo;

public interface BoardService {

	public Map<String, Object> boardList( BoardVo boardVo);

	public Map<String, Object> boardRegist(BoardVo boardVo, HttpServletRequest req);

	public void boardSave(BoardVo boardVo, HttpServletRequest request);

	public void boardUpdate(BoardVo boardVo, HttpServletRequest request);

	public Map<String, Object> boardDetail(String freeBorIdx, HttpSession session);

	public Map<String, Object> LikeClick(BoardVo boardVo, HttpServletRequest request);

	public boolean boardDelete(BoardVo boardVo,HttpServletRequest request) throws Exception;

}
