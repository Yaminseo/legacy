<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	listReply(replyCnt);

	$('#replyRegistBtn').on('click', function(){
		if (confirm('댓글 등록 하시겠습니까??') == true) {
			$.ajax({
				type:'POST',
				url : '/reply/insertReply.do',
				data: {'borIdx': freeBorIdx, 'replyText' : $('#replyText').val()},
				success:function(result) {
					alert("댓글이 등록되었습니다.");
					$("#replyText").val('');
					listReply(replyCnt);
				},
				error: function() {
					alert('에러가 발생하였습니다.');
					return false;
				},
			});
		}
	});
});

function listReply(pageCnt) {
	$("form[name=replyFrm] input[name=pageNo]").val('1');
	$("form[name=replyFrm] input[name=pageCnt]").val(pageCnt);
	$("form[name=replyFrm] input[name=borIdx]").val(freeBorIdx);
	// if(doubleSubmitCheck()){return;}
	var pageCnts;

	$.ajax({
		type : 'post',
		data : $('form[name=replyFrm]').serialize(),
		url : '/reply/boardListReply.do',
		success : function(result) {

			if(pageCnt > result.length){

				pageCnt = result.length;
			}


			// doubleSubmitFlag = false;
			$(".ReplyInformDiv").html('<span class="detailInformTitle">댓글</span>'
				+ '<span class="detailReplyNum">' + result.length + '</span>');

			$('#replyContentDiv').html('');
			for(var i=0; i<pageCnt; i++){
				$('#replyContentDiv').append(
					'<div class="ReplyLeftLine">'
					+ '<div class="ReplyWriterInform">'
					+ '<span class="detailInformCon">' + result[i].replyer + '</span>&nbsp;'
					+ '<span class="detailInformCon">' + result[i].regDe + '</span></div>'
					+ '<div class="ReplyContent">' + result[i].replyText + ' </div> </div>'
				);
			}

		}
	});

	$('#replayRefresh').on('click', function(){
		replyCnt += 3;
		listReply(replyCnt)
	})
}

function replyAddView(){

}

</script>
<form name="replyFrm">
<input type="hidden" name="pageNo" value="" />
<input type="hidden" name=pageCnt value="" />
<input type="hidden" name="borIdx" value="" />
	<div class="ReplyInformDiv"></div>
	<div class="ReplyContentDiv" id="replyContentDiv">

	</div>
	<div class="ReplyRegistBtn">
		<div class="ReplyTextAreaDiv">
			<textarea class="ReplyText" id="replyText"></textarea>
		</div>
		<div class="ReplyBtnArea">
			<button type="button" class="ReplyRegist" id="replyRegistBtn">등록</button>
			<button type="button" class="ReplyRefresh" id="replayRefresh">더보기</button>
		</div>
	</div><br><br>
</div>
</form>