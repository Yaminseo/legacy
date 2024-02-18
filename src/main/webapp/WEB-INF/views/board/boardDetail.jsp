<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/menu/menuList.do" />
<script>

var freeBorIdx = '${boardVo.freeBorIdx}';
var replyCnt = 3;
$(function(){

	$('#detailMainDiv').hide();
	if(freeBorIdx === ''){

		alert("존재하지 않는 게시글이거나 삭제된 게시글입니다");
		location.href="/board/boardList.do"
	} else {
		$('#detailMainDiv').show();
	}
	$('#likeBtn').on('click', function(){
		$.ajax({
			type:"POST",
			url : "/board/likeClick.do",
			//data: "userId="+encodeURIComponent($('#userId').val()),
			data: {"freeBorIdx": freeBorIdx},
			success:function(result) {
				$('#likeBtn').text(result.refreshData.useYn === '1' ? '취소하기' : '추천하기');
				$('#prefaceSpan').html(result.refreshData.prefaceNm);
				$('#titleSpan').text(result.refreshData.freeBorTitle);
				$('#likeCntSpan').text(result.refreshData.likeCnt);
				$('#viewCntSpan').text(result.refreshData.freeBorViewCnt);
				$('#boardContent').html(result.refreshData.freeBorContents);
				alert(result.refreshData.useYn === '1' ? '추천되셨습니다.' : '취소 하였습니다.');
				$('#moveBtn').html('<button type="button" id="aaaBtn">동적 생성 버튼</button>');
			},
			error: function(data) {
				alert('에러가 발생하였습니다.');
				return false;
			},
		});
	})

	$('#beforeBtn').on('click', function(){
		location.href="/board/boardList.do";
	})

	$('#delBtn').on('click', function(){
		$.ajax({
			type:"POST",
			url : "/board/boardDelete.do",
			//data: "userId="+encodeURIComponent($('#userId').val()),
			data: {"freeBorIdx": freeBorIdx},
			success:function(result) {
				if(result){
					alert("삭제 완료하였습니다");
					location.href="/board/boardList.do";
				}
			},
			error: function(data) {
				alert('에러가 발생하였습니다.');
				return false;
			},
		});
	})

	$('#uptBtn').on('click', function(){
		var obj = document.updateForm;
		obj.method = 'post';
		obj.action = '/board/boardRegist.do';
		obj.submit();

		// $('.frm').attr({action:'/board/boardRegist.do'}).submit();
	});


	$(document).on("click", "#aaaBtn", function(){
		alert(99999)
	});
});
</script>
	<div id="detailMainDiv" class="detailMainDiv">
		<div class="detailContentDiv">
			<div class="rightBtnArea">
				<%-- <c:if test="${boardVo.userId eq sessionScope.userId }"> --%>
					<button type="button" id="delBtn" class="btnBlue">삭제</button>
					<button type="button" id="uptBtn" class="btnBlue">수정</button>
				<%-- </c:if> --%>
				<button type="button" id="beforeBtn" class="btnBlue">이전</button>
			</div><br>
			<div class="detailDiv">
				<div class="detailTitleDiv">
					<div class="titleLeft">
						<span class="detailSubSpan" id="prefaceSpan">${boardVo.prefaceNm }</span>&nbsp;
						<span class="detailTitleSpan" id="titleSpan">${boardVo.freeBorTitle }</span>
					</div>
				</div>
				<div class="titleRight"><span class="detailWriter">${boardVo.userNm }</span><span id="moveBtn"></span></div>
			</div>
			<div class="detailInformDiv">
				<div class="titleLeft">
					<span class="detailInformTitle">글번호</span><span class="detailInformCon">${boardVo.freeBorIdx }</span><span class="detailGubun">|</span>
					<span class="detailInformCon">${boardVo.regDe }</span>
				</div>
				<div class="titleRight">
					<span class="detailInformTitle">추천</span>
					<span class="detailNum" id="likeCntSpan">${boardVo.likeCnt}</span>
					<span class="detailInformTitle">조회수</span>
					<span class="detailNum" id="viewCntSpan">${boardVo.freeBorViewCnt }</span>
				</div>
			</div>
			<div class="detailContent">
				<div id="boardContent">${boardVo.freeBorContents }</div>
				<c:if test="${boardVo.userId ne sessionScope.userId }">
					<div class="recommentBtnArea">
						<button type="button" id="likeBtn" class="recommentBtn">
							<c:if test="${boardVo.useYn eq '1' }">
								취소하기
							</c:if>
							<c:if test="${boardVo.useYn ne '1' }">
								추천하기
							</c:if>
						</button>
					</div>
				</c:if>
			</div>

		<%@ include file="/WEB-INF/views/cmm/reply/reply.jsp"%>

		<form name="updateForm">
			<input type="hidden" name="freeBorIdx" id="freeBorIdx" value="${boardVo.freeBorIdx }" />
		</form>
	</div>