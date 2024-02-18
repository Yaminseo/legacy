package kr.co.sky.board.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sky.board.service.BoardService;
import kr.co.sky.board.vo.BoardVo;
import kr.co.sky.common.utl.TokenMngUtil;

@Controller
@RequestMapping(value="/board/")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value="boardList.do")
	public String boardList(@ModelAttribute("ttt") BoardVo boardVo, Model model) {

		if(boardVo.getPageCnt() == null) boardVo.setPageSize(10);
		else boardVo.setPageSize(Integer.parseInt(boardVo.getPageCnt()));

		Map<String, Object> map = boardService.boardList(boardVo);

		model.addAttribute("pageVo", boardVo);
		model.addAttribute("optionList", map.get("optionList"));
		model.addAttribute("freeList", map.get("freeList"));

		return "/board/boardList";
	}

	@RequestMapping(value="boardDetail.do")
	public String boardDetail(@RequestParam(value="freeBorIdx") String freeBorIdx, Model model, HttpSession session) {
		System.out.println(">>>>>>>>>>>>>>>>> freeBorIdx :: " + freeBorIdx);
		Map<String, Object> map = boardService.boardDetail(freeBorIdx, session);
		model.addAttribute("boardVo", map.get("boardVo"));
		return "/board/boardDetail";
	}

	@RequestMapping(value="boardRegist.do")
	public String boardRegist(@ModelAttribute BoardVo boardVo, Model model, HttpServletRequest req) {
		TokenMngUtil.saveToken(req);
		Map<String, Object> map = boardService.boardRegist(boardVo, req);
		model.addAttribute("optionList", map.get("optionList"));
		model.addAttribute("TOKEN_KEY", req.getAttribute("TOKEN_KEY"));
		model.addAttribute("boardVo", map.get("boardVo"));
		return "/board/boardRegist";
	}

	@RequestMapping(value="boardSave.do")
	public String boardSave(@ModelAttribute BoardVo boardVo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String freeBorIdx = boardVo.getFreeBorIdx();
		if(TokenMngUtil.isTokenValid(request)) {
			TokenMngUtil.resetToken(request);
			boardService.boardSave(boardVo, request);
		}

		String flag = "";
		String url = "";
		String page = "";

		if(freeBorIdx == null || freeBorIdx.equals("")) {
			flag = "등록";
			url = "/board/boardList.do";
			page = "메인";
		} else {
			flag = "수정";
			url = "/board/boardDetail.do?freeBorIdx=" + freeBorIdx;
			page = "상세";
		}

		// PrintWrtier에서 한글 인코딩이 깨지는 경우 셋팅
		// 반드시 PrintWriter 객체 선언하기 전에 셋팅해줘야 함
		// response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('정상적으로" + flag + "되었습니다.\\n" + page + " 페이지로 이동합니다.'); location.href='" + url + "'</script>");
		out.flush();	// 현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하고 비운다.

		return "/board/boardList";
	}

	@RequestMapping(value="boardUpdate.do")
	public String boardUpdate(@ModelAttribute BoardVo boardVo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		if(TokenMngUtil.isTokenValid(request)) {
			TokenMngUtil.resetToken(request);
			boardService.boardUpdate(boardVo, request);
		}

		// PrintWrtier에서 한글 인코딩이 깨지는 경우 셋팅
		// 반드시 PrintWriter 객체 선언하기 전에 셋팅해줘야 함
		// response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('정상적으로 수정이되었습니다.\\n 상세 페이지로 이동합니다.'); location.href='/board/boardDetail.do?freeBorIdx=" + boardVo.getFreeBorIdx() + "'</script>");
		out.flush();	// 현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하고 비운다.

		return "/board/boardList";
	}

	@RequestMapping(value="{viewName}.do")
	public String test(@PathVariable("viewName") String viewName) {
		return "board/" + viewName;
	}

	@RequestMapping(value="likeClick.do")
	@ResponseBody
	public Map<String, Object> likeClick(@ModelAttribute BoardVo boardVo,HttpServletRequest request, Model model) {
		return boardService.LikeClick(boardVo, request);
	}

	@RequestMapping(value="boardDelete.do")
	@ResponseBody
	public boolean boardDelete(@ModelAttribute BoardVo boardVo,HttpServletRequest request) throws Exception {
		return boardService.boardDelete(boardVo, request);
	}
}
