<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/menu/menuList.do" />

<script>
$(function(){
	var freeBorIdx = '${boardVo.freeBorIdx}';
	var preface = '${boardVo.preface}';
	if(freeBorIdx != ''){
		$('#registBtn').text('수정')
		$('#searchOption').val(preface);
	} else {
		$('#registBtn').text('등록')
	}
	//alert(freeBorIdx)
	$('#registBtn').on('click', function(){
		// console.log($("form[name=registFrm]").serialize())
		var obj = document.registFrm;
		obj.method = 'post';
		obj.action = '/board/boardSave.do';
		obj.submit();
	});
});
</script>
	<form name="registFrm">
		<div class="mainDiv">
			<div class="detailContentDiv">
				<div class="registDiv">
					<div class="registTitleDiv">
						<select class="subSelect" id="searchOption" name="preface">
							<c:forEach var="optionList" items="${optionList}">
								<option value="${optionList.value1}">${optionList.codeNm}</option>
							</c:forEach>
						</select>
						<input type="text" class="titleInput" name="freeBorTitle" placeholder="제목"  value="${boardVo.freeBorTitle}">
					</div>
					<div class="registContentEditor">
						<textarea rows="10" cols="100" name="freeBorContents">${boardVo.freeBorContents }</textarea>
					</div>

					<div class="btnArea">
						<button type="button" class="boardRegistBtn" id="registBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 중복방지 Token Parameter -->
		<input type="hidden" name="TOKEN_KEY" value="${TOKEN_KEY }" />
		<input type="hidden" name="freeBorIdx" value="${ boardVo.freeBorIdx}" />
		<!-- 중복방지 Token Parameter -->
	</form>

	<!-- <script>
		ClassicEditor.create( document.querySelector( '#editor' ), {
				//console.log('test');
				} )
				.then( editor => {
					window.editor = editor;
				} )

	</script> -->
