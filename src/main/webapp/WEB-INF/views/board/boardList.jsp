<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/menu/menuList.do" />
<style>
a {
	color: #666 !important;
}
</style>
<script>
function goDetail(borIdx){
	location.href="/board/boardDetail.do?freeBorIdx=" + borIdx;
}

function goRegist(){
	location.href="/board/boardRegist.do";
}

$(function(){
	$('#searchBtn').on('click', function(){
		$.ajax({
			type:"POST",
			url : "/board/boardList.do",
			data: "searchNm=" + $('#searchNm').val()+"&searchOption=" + $("select[name=searchOption] option:selected").val(),
			success:function(result) {
				fn_movePage("1");
			},
			error: function(e) {
				alert('에러가 발생하였습니다.');
				return false;
			},
		});
	});
})


function fn_movePage(pageNo) {
	console.log("movePage");
	// if(doubleSubmitCheck()){return;}		// 이중클릭 방지
	$("input[name=pageNo]").val(pageNo);
	$("input[name=searchNm]").val( $('#searchNm').val());
	$("input[name=searchOption]").val($("select[name=searchOption] option:selected").val());
	var obj = document.viewTable;
	obj.method="POST";
	obj.action="<c:url value='/board/boardList.do'/>";
	obj.submit();
}
</script>
<div class="mainDiv">
	<div class="contentDiv">
		<div class="boardDiv">
			<div class="boardTitle">
				<span class="titleSpan">자유게시판 ${ttt.pageNo }</span>
			</div><br>
			<div class="btnAreaRight">
				<button type="button" class="registBtn" onclick="goRegist()">등록</button>
			</div><br>
			<table class="boardTable">
				<tr class="titleTr">
					<th class="titleNumTh">번호</th>
					<th class="titleSubTh"> 말머리</th>
					<th class="titleContTh">제목</th>
					<th class="titleSubTh">글쓴이</th>
					<th class="titleSubTh">작성일</th>
					<th class="titleSubTh">조회</th>
					<th class="titleSubTh">추천</th>
					<th class="titleSubThRight">댓글</th>
				</tr>
				<c:forEach var="freeList" items="${freeList}">
					<tr class="contTr">
						<td class="contTd">${freeList.freeBorIdx }</td>
						<td class="contTd">${freeList.preface }</td>
						<td class="contTdSubject">
							<a href="javascript:void(0);" onclick="goDetail('${freeList.freeBorIdx }');">${freeList.freeBorTitle }</a>
							<c:if test="${freeList.newYn eq 'Y' }">
								<img src="<c:url value='/image/new.png' />" class="newImage">
							</c:if>
						</td>
						<td class="contTd">${freeList.userId }</td>
						<td class="contTd">${freeList.regDe }</td>
						<td class="contTd">${freeList.freeBorViewCnt }</td>
						<td class="contTd">${freeList.likeCnt}</td>
						<td class="contRight">${freeList.replyCnt }</td>
					</tr>
				</c:forEach>
			</table> <br>
			<div class="searchDiv">
				<div class="searchDivRight">
					<select class="subSelect" id="searchOption" name="searchOption">
						<option value="optionAll">전체</option>
						<c:forEach var="optionList" items="${optionList}">
							<option value="${optionList.value1}">${optionList.codeNm}</option>
						</c:forEach>
					</select>
					<input type="text" id="searchNm" class="searchNm" value = ${ttt.searchNm }>
					<button type="button" id="searchBtn" class="searchBtn">조회</button>
				</div>
			</div>
			<!-- <div class="pagination">
				<ul class="paginationUl">
					<li class="paginationLeft"> << </li>
					<li class="paginationListNum ListSelect"> 1 </li>
					<li class="paginationListNum"> 2 </li>
					<li class="paginationRight"> >> </li>
				</ul>
			</div> -->
			<jsp:include page="/menu/bottom.do" />
		</div>
	</div>
</div>

<form name="viewTable">
	<input type="hidden" name="pageNo" />
	<input type="hidden" name="searchOption" />
	<input type="hidden" name="searchNm" />
</form>
