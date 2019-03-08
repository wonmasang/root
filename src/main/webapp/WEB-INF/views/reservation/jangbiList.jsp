<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="ROBOTS" content="ALL" />
<meta name="Description" content="한국생산기술연구원" />
<meta name="Keywords" content="" />
<meta name="Author" content="" />
<meta name="Copyright" content="(c)" />
<meta name="reply-to" content="" />
<meta name="date" content="2015-05-07T18:50:00+09:00" />
<link rel="stylesheet" type="text/css" href="../css/master.css" />
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script type="text/javascript">

// $(window).load(function() {
	
// // 	if(sessionScope.user_id == null ) {
// // 		alert("로그인 후에 접근 가능합니다.");
// // 		location.href="/main.do";
// // 	}
// 	console.log("aa"+session.getAttribute("user_id"));
// 	if( session.getAttribute("user_id") == null) {
// 		alert("로그인 후에 접근 가능합니다.");
// 		location.href="/main.do";
// 	}
	
// });




function searchSubmit() {
	document.getElementById("searchForm").submit();
}


function simpleJangbi(eq_seq) {
	var eq_seq = eq_seq;
	var url = "/popup/simpleJangbiPopup.do?eq_seq="+eq_seq;
	var winWidth = 800;
	var winHeight = 550;
	var popupOption = "width="+winWidth+", height="+winHeight;
	window.open(url,"",popupOption);
}



</script>



<title>KITECH :: 한국생산기술연구원</title>
</head>
<body>

<%
if(session.getAttribute("user_id")==null) {
%>
<script type="text/javascript">
	alert("로그인 후에 접근 가능합니다.");
	location.href="/main.do";
</script>
<%
}
%>




<header>
	<div class="top">
		<div class="min_layout">
			<ul class="top_btns">
				<li class="bkNone"><a href="">홈</a></li>
				<li><a href="">로그인</a></li>
				<li><a href="">회원가입</a></li>
				<li><a href="">CONTACT US</a></li>
				<li class="rNone"><a href="">SITEMAP</a></li>
			</ul>
		</div>
	</div>
	<hgroup class="min_layout">
		<h1><a href="/main.do"><img src="../images/logo.gif" alt="KITECH 한국생산기술연구원" /></a></h1>
		<nav>
			<ul>
				<li><a href="">소개</a></li>
				<li><a href="" class="on">통합 뿌리장비</a></li>
				<li><a href="">시제품 제작</a></li>
				<li><a href="">전문가 DB</a></li>
				<li><a href="" class="rNone">알림마당</a></li>
			</ul>
		</nav>
	</hgroup>
</header><!-- header end -->

<div class="sub_content sub_bg2">
	<section class="sub_visual min_layout">
		<article class="sv_con">
			<h2>통합 뿌리장비</h2>
			<p>통합뿌리장비 예약 및 예약요령을 살펴 보실 수 있습니다.</p>
		</article>
	</section>

	<section class="min_layout sub_content_c">
		<!-- 서브 탭 메뉴 -->
		<ul class="sub_tab">
			<li><a href="" class="on">뿌리장비 예약</a></li>
			<li><a href="/reservation/reservationTrick.do">뿌리장비 예약요령</a></li>
		</ul>
		<!-- 서브 탭 메뉴 end -->
	
		<div class="sub_center_con">
			<!-- 타이틀 및 내비 -->
			<article class="title_navi">
				<h3>뿌리장비 예약</h3>
				<p class="navigation"><a href=""><img src="../images/home_icon.gif" alt="" /></a> > 통합 뿌리장비 > 뿌리장비 예약 > 장비 예약목록</p>
			</article>
			<!-- 타이틀 및 내비 end -->

			<article class="sub_con_txt">
			<!------------------- 콘텐츠 시작 -------------------->
				<div class="reservation">
					<p class="con_title">장비 예약목록</p>
					<!-- select 검색 -->
					<div class="select_search">
						<form id="searchForm" action="/reservation/jangbiList.do" method="get">
							<p class="select_s">
								<select name="eq_grp">
									<option value="null" selected="selected">분류별</option>
									<option value="기계가공">기계가공</option>
									<option value="데이터">데이터</option>
								</select>
								&nbsp;
								<select name="eq_use">
									<option value="null" selected="selected">용도별</option>
									<option value="기업지원장비">기업지원장비</option>
									<option value="연구장비">연구장비</option>
								</select>
								&nbsp;
								<select name="eq_tech">
									<option value="null" selected="selected">기술별</option>
									<option value="금형기술">금형기술</option>
									<option value="용접접합">용접접합</option>
									<option value="성형기술">성형기술</option>
								</select>
								&nbsp;
								<select name="eq_loc">
									<option value="null" selected="selected">지역별</option>
									<option value="시흥">시흥</option>
								</select>
							</p>
							<p class="select_txt">
								<label>장비명</label>&nbsp;
								<input type="text" id="keyword" name="keyword"/>
								<a href="#" class="btn1" onclick="searchSubmit(); return false;">검색</a>
							</p>
							<input type="hidden" name="curPage" value="${paging.curPage }">
						</form>
					</div>
					<!-- select 검색 end -->
					<!---->
					<table summary="장비예약목록" class="list_table mb24">
						<caption>장비예약 목록을 보여주며, 파일다운로드 및 예약 및 협의하기를 할 수 있음.</caption>
						<colgroup>
							<col width="7%"></col>
							<col width="25%"></col>
							<col width="22%"></col>
							<col width="7%"></col>
							<col width="7%"></col>
							<col width="12%"></col>
							<col width="7%"></col>
							<col width="13%"></col>
						</colgroup>
						<tr>
							<th>No.</th>
							<th>장비명</th>
							<th>분야</th>
							<th>분류</th>
							<th>센터</th>
							<th>가격</th>
							<th>첨부</th>
							<th>예약</th>
						</tr>
						<c:forEach items="${jangbi }" var="jangbi">
							<tr>
								<td>${jangbi.anum }</td>
								<td class="txts">${jangbi.eq_nm_en }</td>
								<td>${jangbi.eq_tech }</td>
								<td>${jangbi.eq_grp }</td>
								<td>${jangbi.eq_loc }</td>
								<td>${jangbi.eq_fee }원</td>
								<td><a href=""><img src="../images/disc_icon.gif" alt="파일다운로드" /></a></td>
								<td><a href="#" class="e_btn" onclick="simpleJangbi(${jangbi.eq_seq });">단순장비활용</a></td>
							</tr>
						</c:forEach>
					</table>
<!-- 					<div class="paging"> -->
<!-- 						<a href="" class="l_btn">◀</a> -->
<!-- 						<a href="">1</a> -->
<!-- 						<a href="">2</a> -->
<!-- 						<a href="">3</a> -->
<!-- 						<a href="">4</a> -->
<!-- 						<a href="" class="r_btn">▶</a> -->
<!-- 					</div> -->
					<div class="paging">
						<jsp:include page="/WEB-INF/views/utill/jangbiListPaging.jsp" />
					</div>
				</div>
			<!------------------- 콘텐츠 끝 -------------------->
			</article>

			<aside class="quick">
				<ul>
					<li class="q0"><img src="../images/quick0.gif" alt="QUICK MENU" /></li>
					<li class="q1"><a href=""><img src="../images/quick1.gif" alt="장비예약" /></a></li>
					<li class="q1"><a href=""><img src="../images/quick2.gif" alt="기술자문" /></a></li>
					<li class="q1"><a href=""><img src="../images/quick3.gif" alt="시제품 제작" /></a></li>
					<li class="q2"><a href=""><img src="../images/quick4.gif" alt="상담" /></a></li>
					<li class="q2"><a href=""><img src="../images/quick5.gif" alt="교육일정" /></a></li>
					<li><a href="#"><img src="../images/quick_top.gif" alt="상단 바로가기" /></a></li>
				</ul>
			</aside>
		</div>
	</section>
</div><!-- sub_content end -->

<footer>
	<section class="min_layout">
		<article class="footer">
			<p class="f_logo"><img src="../images/footer_logo.gif" alt="KITECH 한국생산기술연구원" /></p>
			<address>Copyright &copy; KITECH.All Rights Reserved.</address>
			<ul>
				<li><a href="">개인정보취급방침</a></li>
				<li><a href="">저작권보호</a></li>
			</ul>
		</article>
	</section>
</footer><!-- footer end -->

</body>
</html>

