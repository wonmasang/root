<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>​
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

//데이트 포멧 
function dateToyyyyMMdd(d){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return d.getFullYear() + pad(d.getMonth()+1) + pad(d.getDate());
};

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
		buttonImageOnly:true,
		onSelect: function(selectDate) {
			
			var year = selectDate.substring(0,4);
			var mon = selectDate.substring(4,6);
			mon = mon - 1;
			var day = selectDate.substring(6,8);
			
			var sdate = new Date(year, mon, day);
			
			var edate = new Date(year, mon, day);
			edate.setDate(sdate.getDate()+2);
			
			$('#datePicker2').datepicker('option', {
				minDate: selectDate,
				beforeShow: function() {
					$('#datePicker2').datepicker('option', 'maxDate', edate);
				}
			});
			
		}
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

$(document).ready(function(){
	
	$("#searchBtn").on("click", function(){
		var startDate = $("#datePicker1").val();
		var endDate = $("#datePicker2").val();
		var seq = ${jangbiSEQ};
		
// 		alert("시작="+startDate+",끝="+endDate);
// 		alert("gg"+seq);
		
		$.ajax({
			type : "POST",
			url : "/popup/simpleJangbiPopupAAA.do",
			dataType : "json",
			data : {
				resStartDate : startDate
				 , resEndDate: endDate
				 , eq_seq: seq
			},
			success : onSuccess,
				
			error : function(err) {
				alert("에러");
			}
		});
	});
		
});


function onSuccess(res) {
	console.dir("성공1="+res);
	var resCheckList = res.resCheckList;
	
	//입력받은 날짜 패턴형식
	var startDate = res.start;	//yyyy.MM.dd 패턴
	var endDate = res.end;		//yyyy.MM.dd 패턴
	var middlePatten = res.listMilddelPattenTime;	//yyyy.MM.dd 패턴
	
	var dateArray = new Array();
	dateArray[0] = startDate;
	if(middlePatten != '') {
		dateArray[1] = middlePatten;
		dateArray[2] = endDate;
	}else if(middlePatten == '') {
		dateArray[1] = endDate;
	}
	
	
	//입력받은 날짜(시작, 중간, 끝)
// 	var inputStartDate = parseInt($("#datePicker1").val());
// 	var inputMiddleDate = parseInt(res.listMilddelTime);
// 	var inputEndDate = parseInt($("#datePicker2").val());
	
// 	var inputDay = (inputEndDate - inputStartDate)+1;
// 	console.log("입력 날짜 기간="+inputDay);
	
	var inputStartDate = $("#datePicker1").val();
	var year1 = inputStartDate.substring(0,4);
	var mon1 = inputStartDate.substring(4,6);
	mon1 = mon1 - 1;
	var day1 = inputStartDate.substring(6,8);
	inputStartDate = new Date(year1, mon1, day1);
// 	inputStartDate.setDate(inputStartDate.getDate()+1);
	console.log("yy="+inputStartDate);
	
	
	var inputMiddleDate = res.listMilddelTime;
	
	
	var inputEndDate = $("#datePicker2").val();
	var year2 = inputEndDate.substring(0,4);
	var mon2 = inputEndDate.substring(4,6);
	mon2 = mon2 - 1;
	var day2 = inputEndDate.substring(6,8);
	inputEndDate = new Date(year2, mon2, day2);
	
	
	console.log("rr="+inputStartDate+", "+inputEndDate);
	
	var inputDay = Math.abs(inputEndDate.getTime() - inputStartDate.getTime());
	inputDay = Math.ceil((inputDay / (1000*3600*24))+1);
	
	console.log("입력 날짜 기간="+inputDay);
	
	var list = '';
	
	var resvDate = '';
 	for(var i=0; i<inputDay; i++){
		var am = '가능';
		var pm = '가능';
		console.log("gg="+inputStartDate);
		if(i >= 2){
			inputStartDate.setDate(inputStartDate.getDate() + i -1);	
		}else {
			inputStartDate.setDate(inputStartDate.getDate() + i);
		}
		
		writeDate = dateToyyyyMMdd(inputStartDate);
		
		console.log("kk="+writeDate);
		
		console.log("체크리스트 랭스="+resCheckList.length);
		
		for(var j=0; j<resCheckList.length; j++) {
			var dbDateArray = new Array();
			
			
			
			if(resCheckList[j].startTime == '00'){
				dbDateArray[0] = resCheckList[j].resStartDate + resCheckList[j].startTime;
				dbDateArray[1] = resCheckList[j].resStartDate + '12';
			}else if(resCheckList[j].startTime == '12'){
				
				dbDateArray[1] = resCheckList[j].resStartDate + resCheckList[j].startTime;
			}
			
			dbDateArray[2] = resCheckList[j].resMiddleTime + '00';
			dbDateArray[3] = resCheckList[j].resMiddleTime + '12';
			
			if(resCheckList[j].endTime == '00'){
				dbDateArray[4] = resCheckList[j].resEndDate + resCheckList[j].endTime;
				dbDateArray[5] = '';
			}else if(resCheckList[j].endTime == '12'){
				dbDateArray[4] = resCheckList[j].resEndDate + '00';
				dbDateArray[5] = resCheckList[j].resEndDate + resCheckList[j].endTime;
			}
			
			console.dir("시작="+dbDateArray);
			console.dir("랭스="+dbDateArray.length);
			
			for(var k=0; k<dbDateArray.length; k++) {
				
				writeDate00 = writeDate+'00';
				if( writeDate00 == dbDateArray[k]) {
					console.dir("am1="+writeDate00+', '+dbDateArray[k]);
					am = '불가능';
				}
// 				else  {
// 					console.dir("am2="+writeDate00+', '+dbDateArray[k]);
// 					am = '가능';
// 				}
				
				writeDate12 = writeDate+'12';
				if( (writeDate+'12') == dbDateArray[k]) {
					console.dir("pm1="+writeDate12+', '+dbDateArray[k]);
					pm = '불가능';
				}
// 				else  {
// 					console.dir("pm2="+writeDate12+', '+dbDateArray[k]);
// 					pm = '가능';
// 				}
				
				
			}
			
			
		}
		
		console.log("dateArray="+dateArray);
		console.log("am="+am);
		console.log("pm="+pm);
		resvDate = new String(dateArray[i]).substring(0,4)+new String(dateArray[i]).substring(5,7)+new String(dateArray[i]).substring(8,10);
// 		alert(resvDate);
		
		list += "<tr><td><input type='checkbox' name='checkboxAm' class='borderNone' value='"+resvDate+"' /></td>"
				+"<td>"+dateArray[i]+"</td>"
				+"<td>"+'오전'+"</td>"
				+"<td>"+am+"</td>"
				+"</tr>"
		list += "<tr><td><input type='checkbox' name='checkboxPm' class='borderNone' value='"+resvDate+"' /></td>"
				+"<td>"+dateArray[i]+"</td>"
				+"<td>"+'오후'+"</td>"
				+"<td>"+pm+"</td>"
				+"</tr>"
		resvDate = '';
		
		
	}
	
		$("#resTable").append(list);
	 
	
	
	
	

	
// 			//1번째 행 
// 			$("#resTable").append("<tr id='startTr_1'><td><input type='checkbox' name='' class='borderNone' /></td>"
// 					+"<td>"+startDate+"</td>"
// 					+"<td>"+'오전'+"</td>"
// 					+"</tr>"
// 			 );
// 			if(startDateVal == resCheckList[0].resStartDate) {
// 				console.dir("같음!!!!!!!! = 예약날짜와 같음");
// 				if(res.resCheckList[0].startTime == '00'){
// 					$("#startTr_1").append("<td>"+'불가능'+"</td>");
// 				}else {
// 					$("#startTr_1").append("<td>"+'가능'+"</td>");
// 				}
// 			}else if (startDateVal > resCheckList[0].resStartDate) {
// 				console.dir("입력 > DB = DB 시작 날짜보다 뒷날");
// 				//DB 시작 날짜보다 뒷날 이므로 무조건 불가능!!! 인데 이날이 마지막날 일 수도 있으므로 중간날인지 체크 
// 				if(startDateVal < resCheckList[0].resEndDate && startDateVal != resCheckList[0].resEndDate) {
// 					console.dir("DB 중간날짜가 입력 첫째날인 상황.");
// 					//DB 중간날짜가 입력 첫째날인 상황 이므로  무조건 불가능.
// 					if(res.resCheckList[0].startTime == '00'){
// 						$("#startTr_1").append("<td>"+'불가능'+"</td>");
// 					}else {
// 						$("#startTr_1").append("<td>"+'불가능'+"</td>");
// 					}
// 				}else if(startDateVal == resCheckList[0].resEndDate) {
// 					console.dir("DB 마지막 날짜가 입력 첫째날인 상황.");
// 					//DB 마지막 날짜가 입력 첫째날인 상황 이므로 DB 마지막날짜 오전오후 체크해야함.
// 					if(res.resCheckList[0].endTime == '00'){
// 						$("#startTr_1").append("<td>"+'불가능'+"</td>");
// 					}else if(res.resCheckList[0].endTime == '12'){
// 						$("#startTr_1").append("<td>"+'불가능'+"</td>");
// 					}else {
// 						$("#startTr_1").append("<td>"+'가능'+"</td>");
// 					}
// 				}
// 			}else if (startDateVal < resCheckList[0].resStartDate) {
// 				console.dir("입력 < DB = DB 시작 날짜보다 앞날");
// 				//DB 시작 날짜보다 앞날 이므로 무조건 가능!!!
// 				$("#startTr_1").append("<td>"+'가능'+"</td>");
// 			}
			
			
			
// 			//2번째 행
// 			$("#resTable").append("<tr id='startTr_2'><td><input type='checkbox' name='' class='borderNone' /></td>"
// 					+"<td>"+startDate+"</td>"
// 					+"<td>"+'오후'+"</td>"
// 					+"</tr>"
// 			 );
// 			if(res.resCheckList[0].startTime == '12'){
// 				$("#startTr_2").append("<td>"+'불가능'+"</td>");
// 			}else if(res.resCheckList[0].startTime == '00'){
// 				$("#startTr_2").append("<td>"+'불가능'+"</td>");
// 			}else {
// 				$("#startTr_2").append("<td>"+'가능'+"</td>");
// 			}
			
			
// 			if(middlePatten == null || middlePatten ==""){
// 				console.dir("중간날짜 비어있음");
// 			}else {
				
// 				//3번째 행
// 				$("#resTable").append("<tr id='middleTr_1'><td><input type='checkbox' name='' class='borderNone' /></td>"
// 						+"<td>"+middlePatten+"</td>"
// 						+"<td>"+'오전'+"</td>"
// 						+"</tr>"
// 				 );
// 				if(res.resCheckList[0].startTime == '12'){
// 					$("#middleTr_1").append("<td>"+'불가능'+"</td>");
// 				}else if(res.resCheckList[0].startTime == '00'){
// 					$("#middleTr_1").append("<td>"+'불가능'+"</td>");
// 				}else {
// 					$("#middleTr_1").append("<td>"+'가능'+"</td>");
// 				}
				
				
// 				//4번째 행
// 				$("#resTable").append("<tr id='middleTr_2'><td><input type='checkbox' name='' class='borderNone' /></td>"
// 						+"<td>"+middlePatten+"</td>"
// 						+"<td>"+'오후'+"</td>"
// 						+"</tr>"
// 				 );
// 				if(res.resCheckList[0].startTime == '12'){
// 					$("#middleTr_2").append("<td>"+'불가능'+"</td>");
// 				}else if(res.resCheckList[0].startTime == '00'){
// 					$("#middleTr_2").append("<td>"+'불가능'+"</td>");
// 				}else {
// 					$("#middleTr_2").append("<td>"+'가능'+"</td>");
// 				}
			
// 			}
			
			
// 			//5번째 행
// 			$("#resTable").append("<tr id='endTr_1'><td><input type='checkbox' name='' class='borderNone' /></td>"
// 					+"<td>"+endDate+"</td>"
// 					+"<td>"+'오전'+"</td>"
// 					+"</tr>"
// 			 );
// 			if(res.resCheckList[0].endTime == '00'){
// 				$("#endTr_1").append("<td>"+'불가능'+"</td>");
// 			}else if(res.resCheckList[0].endTime == '12'){
// 				$("#endTr_1").append("<td>"+'불가능'+"</td>");
// 			}else {
// 				$("#endTr_1").append("<td>"+'가능'+"</td>");
// 			}
			
			
// 			//6번째 행
// 			$("#resTable").append("<tr id='endTr_2'><td><input type='checkbox' name='' class='borderNone' /></td>"
// 					+"<td>"+endDate+"</td>"
// 					+"<td>"+'오후'+"</td>"
// 					+"</tr>"
// 			 );
// 			if(res.resCheckList[0].endTime == '12'){
// 				$("#endTr_2").append("<td>"+'불가능'+"</td>");
// 			}else {
// 				$("#endTr_2").append("<td>"+'가능'+"</td>");
// 			}
		
	
}

function submit() {
	
	var url = "/popup/skilSupportApplication.do";
	var winWidth = 850;
	var winHeight = 800;
	var winLeft = 300;
	var winTop = 80;
	var popupOption = "width="+winWidth+", height="+winHeight+", left="+winLeft+", top="+winTop;
	
	window.open("","ff",popupOption);
	document.getElementById("reservationFrom").target = 'ff';
	document.getElementById("reservationFrom").submit();
	self.close();
}





</script>

<title>KITECH :: 한국생산기술연구원</title>
</head>
<!-- 단순장비활용 팝업1 -->
<div id="popup_box">
	<p class="con_m_title">단순장비활용</p>



	<ul class="date_search">
		<li class="title">기간 선택</li>
		<li class="date_s">
			<input type="text" name="resStartDate" id="datePicker1" />&nbsp;
<!-- 			<a href="" id="dateBtn"><img src="../images/date_icon.gif" alt="달력보기" /></a> -->
			&nbsp;~&nbsp;
			<input type="text" name="resEndDate" id="datePicker2" />&nbsp;
<!-- 			<a href=""><img src="../images/date_icon.gif" alt="달력보기" /></a> -->
		</li>
<!-- 		<li class="Operator"> -->
<!-- 			Operator 선택&nbsp;<input type="checkbox" name="" class="borderNone" /> -->
<!-- 		</li> -->
		<li><a href="javascript://" class="btn1" id="searchBtn">검색</a></li>
	</ul>

<form action="/popup/skilSupportApplication.do" id="reservationFrom" name="reservationFrom" method="POST" >

	<table summary="장비예약 리스트" class="list_table mb24" id="resTable">
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
		
		
	</table>	
	<table class="list_table mb24">
		<tr>
			<th>사용목적</th>
			<td class="list_table_td">
				<textarea class="list_table_textarea" rows="5px" cols="70px" name="contents"></textarea>
			</td>
		</tr>
		<tr>
			<th>사용조건</th>
			<td class="list_table_td"><input class="list_table_input" type="text" name="eq_condition"></td>
		</tr>
		<tr>
			<th>시료처리</th>
			<td class="list_table_td"><input type="radio" name="disposal" value="null" checked="checked">해당없음&nbsp;<input type="radio" name="disposal" value="Y">폐기&nbsp;<input type="radio" name="disposal" value="N">회수 </td>
		</tr>
		<tr>
			<th>시료 명/개수</th>
			<td class="list_table_td"><input class="list_table_input" type="text" name="sample_nm_num"></td>
		</tr>
	</table>
	<p class="form_btn">
		<input type="hidden" id="eq_seq" name="eq_seq" value="${jangbiSEQ}">
		<a href="javascript://" class="btn2" onclick="submit();">예약하기</a>
		&nbsp;
		<a href="javascript://" class="btn3" onclick="self.close();">취소</a>
	</p>
</form>	

</div>
<!-- 장비 예약하기 팝업1 end -->


</html>