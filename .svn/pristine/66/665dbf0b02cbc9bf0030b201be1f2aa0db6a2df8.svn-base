<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	$('#goLogin').on('click', function(){
		var goUrl = 'http://' + $(location).attr('host');
		if (confirm('로그아웃 하시겠습니까?')) {
			$.ajax({
				type : "POST",
				url : "/login/logOut.do",
				complete : function(data) {
					location.href = goUrl + '/user/userCreate4.do';
				},
				error: function(xhs, status, error) {
				}
			});
		}
	});
});
</script>
<div id="container">
	<nav>
		<ul>
			<c:forEach var="menuVo" items="${menuList }" varStatus="idx">
				<c:if test="${fn:substring(menuVo.menuId,0,2) eq 'MN' }">
					<li><a href="${menuVo.menuUrl }">${menuVo.menuNm }</a>
				</c:if>
				<c:if test="${menuVo.menuUrl eq '#' }">
					<ul>
						<c:forEach var="menuVo2" items="${menuList }">
							<c:if test="${menuVo.menuId eq menuVo2.upMenuId }">
								<li>
									<a href="${menuVo2.menuUrl }">${menuVo2.menuNm }</a>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</c:if>
			</c:forEach>
			<li><a href="javascript:void(0);" id="goLogin" class="goLogin">로그아웃</a></li>
			<li><a href="/user/myPage.do" class="csCenter">마이 페이지</a></li>
		</ul>
	</nav>
</div>
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
<!--
 크다			a gt b		a > b
 작다			a lt b		a < b
 크거나 같다	a ge b		a >= b
 작거나 같다	a le b		a <= b
 같다			a eq b		a == b
 같지 않다		a ne b		a != b
 -->