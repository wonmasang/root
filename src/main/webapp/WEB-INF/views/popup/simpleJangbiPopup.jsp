<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!--  jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--  jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

<!--  jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<script type="text/javascript">

$(function() {
	$("#datePicker1").datepicker({
		showMonthAfterYear:true,
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		changeMonth: true,
		changeYear: true,
		dateFormat:"yymmdd",
		dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		dayNamesMin:['월','화','수','목','금','토','일'],
		selectOtherMonths:true,
		showOn:"button",
		buttonImage:"../images/date_icon.gif",
		buttonImageOnly:true
	});
});
$(function() {
	$("#datePicker2").datepicker({
		showMonthAfterYear:true,
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		changeMonth: true,
		changeYear: true,
		dateFormat:"yymmdd",
		dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		dayNamesMin:['월','화','수','목','금','토','일'],
		selectOtherMonths:true,
		showOn:"button",
		buttonImage:"../images/date_icon.gif",
		buttonImageOnly:true
	});
});

$(function(){
	$("#searchBtn").on("click", function(){
		var startDate = $("#datePicker1").val();
		var endDate = $("#datePicker2").val();
		var seq = ${jangbiSEQ};
		
		alert("시작="+startDate+",끝="+endDate);
		alert("gg"+seq);
		
		$.ajax({
			type : "POST",
			url : "/popup/simpleJangbiPopupAAA.do",
			dataType : "json",
			data : {
				resStartDate : startDate
				 , resEndDate: endDate
				 , eq_seq: seq
			},
			success : function(res) {
				alert("성공"+res.diff);
				alert("성공"+res.listTime);
				
			},
			error : function(err) {
				alert("에러");
			}
		});
	});
		
});

// $(function(){
// 	$("#searchBtn").on("click",function() {
// 		var startDate = $("#datePicker1").val();
// 		var endDate = $("#datePicker2").val();
// 	 	var seq = ${jangbiSEQ};
	 	
// 	 	alert("이거"+startDate+", "+endDate+", "+seq );
	 	
// 		// 전송 폼
// 		var $form = $("<form>")
// 			.attr("action", "/popup/simpleJangbiPopup.do")
// 			.attr("method", "post")
// 			.append(
// 				$("<input>")
// 					.attr("type", "hidden")
// 					.attr("name", "resStartDate")
// 					.attr("value", startDate)
				
// 			)
// 			.append(
// 				$("<input>")
// 					.attr("type", "hidden")
// 					.attr("name", "resEndDate")
// 					.attr("value", endDate)	
// 			)
// 			.append(
// 				$("<input>")
// 					.attr("type", "hidden")
// 					.attr("name", "eq_seq")
// 					.attr("value", seq)	
// 			);
// 		$(document.body).append($form);
// 		$form.submit();

// 	});
// });

// function searchSubmit() {
// 	document.getElementById("searchForm").submit();
// }
// onclick="searchSubmit(); return false;"

</script>

<title>KITECH :: 한국생산기술연구원</title>
</head>
<!-- 단순장비활용 팝업1 -->
<div id="popup_box">
	<p class="con_m_title">단순장비활용</p>
<!-- 	<form action="/popup/simpleJangbiPopup.do" method="POST"> -->
	<ul class="date_search">
		<li class="title">기간 선택</li>
		<li class="date_s">
			<input type="text" name="resStartDate" id="datePicker1" />&nbsp;
<!-- 			<a href="" id="dateBtn"><img src="../images/date_icon.gif" alt="달력보기" /></a> -->
			&nbsp;~&nbsp;
			<input type="text" name="resEndDate" id="datePicker2" />&nbsp;
<!-- 			<a href=""><img src="../images/date_icon.gif" alt="달력보기" /></a> -->
		</li>
		<li class="Operator">
			Operator 선택&nbsp;<input type="checkbox" name="" class="borderNone" />
		</li>
		<li><a href="" class="btn1" id="searchBtn">검색</a></li>
	</ul>
<!-- 	</form> -->
	<table summary="장비예약 리스트" class="list_table mb24">
		<caption>장비예약 리스트를 보여주며, 선택할 수 있습니다.</caption>
		<colgroup>
			<col width="15%"></col>
			<col width="20%"></col>
			<col width="35%"></col>
			<col width="30%"></col>
		</colgroup>
		<tr>
			<th>선택하기</th>
			<th>사용가능날짜</th>
			<th>임대가능 시간대(오전/오후)</th>
			<th>임대가능상태</th>
		</tr>
		<tr>
			<td><input type="checkbox" name="" class="borderNone" /></td>
			<td>2015.01.02ddf${resCheckList.resStartDate }</td>
			<td>오전</td>
			<td>가능</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="" class="borderNone" /></td>
			<td>2015.01.02</td>
			<td>오전</td>
			<td>가능</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="" class="borderNone" /></td>
			<td>2015.01.02</td>
			<td>오전</td>
			<td>임대중</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="" class="borderNone" /></td>
			<td>2015.01.02</td>
			<td>오전</td>
			<td>가능</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="" class="borderNone" /></td>
			<td>2015.01.02</td>
			<td>오전</td>
			<td>가능</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="" class="borderNone" /></td>
			<td>2015.01.02</td>
			<td>오전</td>
			<td>가능</td>
		</tr>
	</table>	
	<table class="list_table mb24">
		<tr>
			<th>사용목적</th>
			<td class="list_table_td"><textarea class="list_table_textarea" rows="5px" cols="70px"></textarea></td>
		</tr>
		<tr>
			<th>사용조건</th>
			<td class="list_table_td"><input class="list_table_input" type="text"></td>
		</tr>
		<tr>
			<th>시료처리</th>
			<td class="list_table_td"><input type="radio" value="해당없음" checked="checked">해당없음&nbsp;<input type="radio" value="폐기">폐기&nbsp;<input type="radio" value="회수">회수 </td>
		</tr>
		<tr>
			<th>시료 명/개수</th>
			<td class="list_table_td"><input class="list_table_input" type="text"> </td>
		</tr>
	</table>
	<p class="form_btn">
		<a href="" class="btn2">예약하기</a>
		&nbsp;
		<a href="" class="btn3" onclick="self.close();">취소</a>
	</p>
</div>
<!-- 장비 예약하기 팝업1 end -->


</html>