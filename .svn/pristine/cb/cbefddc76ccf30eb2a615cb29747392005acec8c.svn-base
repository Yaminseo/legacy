package kr.co.sky.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.sky.board.dao.BoardDao;
import kr.co.sky.board.service.BoardService;
import kr.co.sky.board.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public Map<String, Object> boardList(BoardVo boardVo) {

		Map<String, Object> map = new HashMap<String, Object>();

		boardVo.setCodeId("SEL");
		boardVo.setCodeType("FREE");
		boardVo.setSearchNm(boardVo.getSearchNm());
		boardVo.setSearchOption(boardVo.getSearchOption());

		int totalCount = boardDao.selectFreeBoardListCount(boardVo);		// 게시물 전체 카운트 구하기
		boardVo.setTotalCount(totalCount);

		List<BoardVo> optionList = boardDao.boardList(boardVo);
		List<BoardVo> freeList = boardDao.freeList(boardVo);

		map.put("optionList", optionList);
		map.put("freeList", freeList);

		return map;
	}

	@Override
	public Map<String, Object> boardRegist(BoardVo boardVo, HttpServletRequest req) {

		Map<String, Object> map = new HashMap<String, Object>();

		HttpSession session = req.getSession();
		boardVo.setCodeId("SEL");
		boardVo.setCodeType("PREF");

		List<BoardVo> optionList = boardDao.boardList(boardVo);

		map.put("optionList", optionList);
		BoardVo boardVo2 = null;
		if(boardVo.getFreeBorIdx() != null && !boardVo.getFreeBorIdx().equals("")) {
			boardVo.setUserId((String) session.getAttribute("userId"));
			boardVo2 =  boardDao.selectBoardDetailUpdate(boardVo);
		}

		map.put("boardVo", boardVo2);
		return map;
	}

	@Override
	public void boardSave(BoardVo boardVo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		boardVo.setUserId((String) session.getAttribute("userId"));
		boardVo.setUserNm((String) session.getAttribute("userNm"));
		boardDao.boardSave(boardVo);
	}

	@Override
	public Map<String, Object> boardDetail(String freeBorIdx, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		long viewTime = 0;

		// 세션에 저장된 조회시간
		if(session.getAttribute("viewTime" + freeBorIdx) != null) {
			viewTime  = (Long)session.getAttribute("viewTime" + freeBorIdx);
		}

		// 시스템의 현재시간
		long nowTime = System.currentTimeMillis();

		// 셋팅된 시간이 경과 후 조회수 증가 (60초 후 조회수 증가)
		if(nowTime - viewTime > 60 * 1000) {
			boardDao.freeBoardUpdateCnt(freeBorIdx);
			session.setAttribute("viewTime" + freeBorIdx, nowTime);
		}

		BoardVo boardVo = new BoardVo();
		System.out.println(">>>>>>>>>>>>>>> :: " + session.getAttribute("userId"));
		boardVo.setUserId((String) session.getAttribute("userId"));
		boardVo.setFreeBorIdx(freeBorIdx);
		boardVo = boardDao.boardDetail(boardVo);
		map.put("boardVo", boardVo);

		return map;
	}

	@Override
	public Map<String, Object> LikeClick(BoardVo boardVo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		boardVo.setUserId((String) session.getAttribute("userId"));
		boardDao.mergeLike(boardVo);

		Map<String, Object> map = new HashMap<String, Object>();

		// TODO 언제 수정
		map.put("refreshData", boardDao.selectBoardDetailUpdate(boardVo));
		return map;
	}

	@Override
	public boolean boardDelete(BoardVo boardVo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		boardVo.setUserId((String) session.getAttribute("userId"));
		boardDao.boardReplyDelete(boardVo);
		boardDao.boardlikeDelete(boardVo);
		return boardDao.boardDelete(boardVo);
	}

	@Override
	public void boardUpdate(BoardVo boardVo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		boardVo.setUserId((String) session.getAttribute("userId"));
		boardVo.setUserNm((String) session.getAttribute("userNm"));
		boardDao.boardUpdate(boardVo);
	}
}