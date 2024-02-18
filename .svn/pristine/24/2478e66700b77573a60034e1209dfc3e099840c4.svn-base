<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="pagination">
		<ul class="paginationUl">
			<c:if test="${pageVo.pageNo != 0 }">
				<c:if test="${pageVo.pageNo > pageVo.pageBlock }">
					<li class="paginationLeft"><a href="javascript:fn_movePage(${pageVo.firstPageNo })" style="text-decoration: none;"><font style="font-size:20px">맨앞</font></a></li>
				</c:if>
				<c:if test="${pageVo.pageNo != 1}">
					<li class="paginationLeft"><a href="javascript:fn_movePage(${pageVo.prevPageNo })" style="text-decoration: none;"><font style="font-size:20px">이전</font></a></li>
				</c:if>
				<c:forEach var="i" begin="${pageVo.startPageNo }" end="${pageVo.endPageNo }" step="1">
					<c:choose>
						<c:when test="${i eq pageVo.pageNo }">
						<li class="paginationListNum ListSelect">
							<a href="javascript:fn_movePage(${i })" id="pageNo" style="text-decoration: none;">
								<font style="font-weight: bold; color:#ffffff;">${i }</font>
							</a>
						</li>
						</c:when>
						<c:otherwise>
							<li class="paginationListNum">
								<a href="javascript:fn_movePage(${i })" style="text-decoration: none;">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageVo.pageNo != pageVo.finalPageNo }">
					<li class="paginationRight">
						<a href="javascript:fn_movePage(${pageVo.nextPageNo })" style="text-decoration: none;"><font style="font-size:20px">다음</font></a>
					</li>
				</c:if>
				<c:if test="${pageVo.endPageNo < pageVo.finalPageNo }">
					<li class="paginationRight">
						<a href="javascript:fn_movePage(${pageVo.finalPageNo })" style="text-decoration: none;"><font style="font-size:20px">맨뒤</font></a>
					</li>
				</c:if>
			</c:if>
		</ul>
	</div>
</body>
</html>