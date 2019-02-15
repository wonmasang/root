<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="ROBOTS" content="ALL" />
<meta name="Description" content="한국생산기술연구원" />
<meta name="Keywords" content="" />
<meta name="Author" content="" />
<meta name="Copyright" content="(c)" />
<meta name="reply-to" content="" />
<meta name="date" content="2015-05-07T18:50:00+09:00" />
<link rel="stylesheet" type="text/css" href="../css/master.css" />



<div class="pagingLayout">
	<ul>
		<%-- 첫 페이지 버튼 --%>
			<li>
				<a href="/reservation/jangbiList.do?curPage=${paging.curPage-1 }&eq_grp=${searchDto.eq_grp }&eq_use=${searchDto.eq_use }&eq_tech=${searchDto.eq_tech }&eq_loc=${searchDto.eq_loc }&keyword=${searchDto.keyword }" aria-label="Previous" class="l_btn">
					<span aria-hidden="true">◀</span>
				</a>
			</li>
		
		<%-- 페이징 번호 버튼 --%>
		<c:forEach begin="${paging.startPage }"
			end="${paging.endPage }"
			var="page">
			
			<li id="paging" name="paging">
				<a href="/reservation/jangbiList.do?curPage=${page }&eq_grp=${searchDto.eq_grp }&eq_use=${searchDto.eq_use }&eq_tech=${searchDto.eq_tech }&eq_loc=${searchDto.eq_loc }&keyword=${searchDto.keyword }">${page }</a>
			</li>
		</c:forEach>
		
		<%-- 다음 페이지 버튼 --%>
		<li>
			<a href="/reservation/jangbiList.do?curPage=${paging.curPage+1 }&eq_grp=${searchDto.eq_grp }&eq_use=${searchDto.eq_use }&eq_tech=${searchDto.eq_tech }&eq_loc=${searchDto.eq_loc }&keyword=${searchDto.keyword }" aria-label="Next" class="r_btn">
				<span aria-hidden="true">▶</span>
			</a>
		</li>
	</ul>
</div>

<%-- <div>
	<ul>
		첫 페이지 버튼
		첫 페이지가 아니면 버튼 노출
		<c:if test="${paging.curPage ne 1 }">
			<li>
				<a href="/reservation/jangbiList.do?curPage=1" class="l_btn">◀</a>
			</li>
		</c:if>
		
		이전 페이지 버튼
		첫 페이지면 금지 표시
		<c:if test="${paging.curPage eq 1 }">
			<li>
				<a href="/reservation/jangbiList.do?curPage=${paging.curPage }" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage ne 1 }">
			<li>
				<a href="/reservation/jangbiList.do?curPage=${paging.curPage-1 }" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
		
		페이징 번호 버튼
		<c:forEach begin="${paging.startPage }"
			end="${paging.endPage }"
			var="page">
			
			페이지 번호가 현재페이지면 파랑색으로 보이기
			<c:if test="${paging.curPage eq page }">
			<li id="paging" name="paging">
			</c:if>
			<c:if test="${paging.curPage ne page }">
			<li>
			</c:if>
			<a href="/reservation/jangbiList.do?curPage=${page }">${page }</a>
			</li>
		</c:forEach>
		
		다음 페이지 버튼
		마지막 페이지면 금지 표시
		<c:if test="${paging.curPage eq paging.totalPage }">
		<li class="disabled">
			<a href="/reservation/jangbiList.do?curPage=${paging.curPage }" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
		</c:if>
		<c:if test="${paging.curPage ne paging.totalPage }">
		<li>
			<a href="/reservation/jangbiList.do?curPage=${paging.curPage+1 }" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
		</c:if>
	</ul>
</div> --%>