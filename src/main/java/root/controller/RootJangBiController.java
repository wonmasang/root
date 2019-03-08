package root.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import root.dto.EntrDto;
import root.dto.Eq_resv;
import root.dto.EquipmentDto;
import root.dto.SearchDto;
import root.service.JangBiService;
import root.service.LoginService;
import root.utill.Paging;

@Controller
public class RootJangBiController {

	@Autowired
	JangBiService jangBiService;
	

	@RequestMapping(value="/reservation/jangbiList.do", method=RequestMethod.GET)
	public void jangBiList(@RequestParam(defaultValue="0") int curPage, 
			String searchYN,SearchDto searchDto, Model model) {
		
		System.out.println("장비예약페이지");
		
		if(searchDto.getEq_grp()==null&&
				searchDto.getEq_loc()==null&&
				searchDto.getEq_tech()==null&&
				searchDto.getEq_use()==null&&
				searchDto.getKeyword()==null||
				searchDto.getEq_grp()==""&&
				searchDto.getEq_loc()==""&&
				searchDto.getEq_tech()==""&&
				searchDto.getEq_use()==""&&
				searchDto.getKeyword()=="") {

			System.out.println("장비예약페이지-전체글조회");
			// 페이지 처리
			int totalCount = jangBiService.getTotal();			// 전체 게시글 수	
			Paging paging = new Paging(totalCount, curPage);
			
			model.addAttribute("paging", paging);
			
			// 페이징 처리된 게시글 목록	
			List<EquipmentDto> jangList = jangBiService.jangBiList(paging);		// 전체 게시글 조회
			
			model.addAttribute("jangbi", jangList);
			model.addAttribute("searchDto", searchDto);
			
		}else {
			System.out.println("장비예약페이지-검색글조회");
			String keyword = searchDto.getKeyword();
			if (keyword.contains("")) {
				keyword = keyword.trim();
				searchDto.setKeyword(keyword);
			}
		
			//검색어를 받아서 검색한 게시글 총 갯수
			int totalCount = jangBiService.getSearchTotal(searchDto);
			
			Paging paging = new Paging(totalCount, curPage);
			
			model.addAttribute("paging", paging);
			
			searchDto.setStartNo(paging.getStartNo());
			searchDto.setEndNo(paging.getEndNo());
			List<EquipmentDto> searchJangList = jangBiService.jangBiSearch(searchDto);
			
			model.addAttribute("jangbi", searchJangList);
			model.addAttribute("searchDto", searchDto);
			
		}
		
		
	}
	
	@RequestMapping(value="/popup/simpleJangbiPopup.do", method=RequestMethod.GET)
	public void simpleJangbiPopup(EquipmentDto equipmentDto, Model model) {
		System.out.println("popupGET"+equipmentDto.getEq_seq());
		
		model.addAttribute("jangbiSEQ", equipmentDto.getEq_seq());
		
	}
	
	@ResponseBody
	@RequestMapping(value="/popup/simpleJangbiPopupAAA.do", method=RequestMethod.POST)
	public Map<String, Object> simpleJangbiPopup(Eq_resv eq_resv) {
		
		 String start = eq_resv.getResStartDate();
		 String end = eq_resv.getResEndDate();
		 
		 System.out.println(start);
		 System.out.println(end);
		 
		 List<Eq_resv> resCheckList = jangBiService.reservationCheck(eq_resv);
		 
		 
		 Map<String, Object> map = new HashMap<String, Object>();

		try {
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date sDate = formatter.parse(start);
			Date eDate = formatter.parse(end);
			
			long diff = eDate.getTime() - sDate.getTime();
			// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
			long diffDays = diff / (24 * 60 * 60 * 1000);
			
			System.out.println("날짜차이=" + diffDays);
			
			Calendar cal = new GregorianCalendar();
			SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
			List<Object> listMilddelTime = new ArrayList<Object>();
			List<Object> listMilddelPattenTime = new ArrayList<Object>();
			
			start = format.format(sDate);
			end = format.format(eDate);
			System.out.println(start+"="+end);
			
			
			for(int i=1; i<diffDays; i++) {
				cal.setTime(sDate);
				cal.add(Calendar.DAY_OF_YEAR, i);
				String date = formatter.format(cal.getTime());
				String datePatten = format.format(cal.getTime());
				listMilddelTime.add(date);
				listMilddelPattenTime.add(datePatten);
				
			}
			
			System.out.println("listMilddelTime"+listMilddelTime);
			System.out.println("listMilddelPattenTime"+listMilddelPattenTime);
			
			map.put("listMilddelTime", listMilddelTime);
			map.put("listMilddelPattenTime", listMilddelPattenTime);
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		for(int i=0; i<resCheckList.size(); i++) {
			 int startDate = Integer.parseInt(resCheckList.get(i).getResStartDate());
			 String middleTime = String.valueOf(startDate + 1);
			 resCheckList.get(i).setResMiddleTime(middleTime);
		 }
		
		
		System.out.println("1");
		
		System.out.println("2");
		System.out.println("체크리스트"+resCheckList);
		
		map.put("start", start);
		map.put("end", end);
		map.put("resCheckList", resCheckList);
		
		return map;
		
	}
	
	
	@RequestMapping(value="/popup/skilSupportApplication.do", method=RequestMethod.GET)
	public void simpleJangbiReservation(String jangbiSEQ, Model model) {
		System.out.println(jangbiSEQ);
	}
	
	
	
	@RequestMapping(value="/popup/skilSupportApplication.do", method=RequestMethod.POST)
	public void simpleJangbiReservation(String checkboxAm, 
			String checkboxPm, Eq_resv eq_resv, HttpSession session, Model model) {
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println("체크박스오전="+checkboxAm);
		System.out.println("체크박스오후="+checkboxPm);
		System.out.println("장비시쿼스="+eq_resv.getEq_seq());
		System.out.println("사용목적="+eq_resv.getContents());
		System.out.println("사용조건="+eq_resv.getEq_condition());
		System.out.println("시료명="+eq_resv.getSample_nm_num());
		System.out.println("시료처리="+eq_resv.getDisposal());
		
		String[] resvAmDate = checkboxAm.split(",");
		int[] amDate = new int[resvAmDate.length];
		for(int k=0; k<resvAmDate.length; k++) {
			amDate[k] = Integer.parseInt(resvAmDate[k]);
			System.out.println(amDate[k]);
		}
		
		int amMin = amDate[0];
		int amMax = amDate[0];
		
		for(int i=0; i<amDate.length; i++) {
			
			if(amMin>amDate[i]) {
				amMin = amDate[i];
			}
			if(amMax<amDate[i]) {
				amMax = amDate[i];
			}
		}
		System.out.println("오전 최소, 최대값="+amMin+", "+amMax);
		
		String[] resvPmDate = checkboxPm.split(",");
		int[] pmDate = new int[resvPmDate.length];
		for(int k=0; k<resvPmDate.length; k++) {
			pmDate[k] = Integer.parseInt(resvPmDate[k]);
		}
		
		int pmMin = pmDate[0];
		int pmMax = pmDate[0];
		
		for(int j=0; j<pmDate.length; j++) {
			if(pmMin>pmDate[j]) {
				pmMin = pmDate[j];
			}
			if(pmMax<pmDate[j]) {
				pmMax = pmDate[j];
			}
		}
		System.out.println("오후 최소, 최대값="+pmMin+", "+pmMax);
		
		String resvStartDate_1 = "";
		String resvStartDate_2 = "";
		if(amMin == pmMin || amMin<pmMin) {
			resvStartDate_1 = String.valueOf(amMin);
			resvStartDate_2 = resvStartDate_1+"00";
		}else if(amMin>pmMin) {
			resvStartDate_1 = String.valueOf(pmMin);
			resvStartDate_2 = resvStartDate_1+"12";
		}
		
		String resvEndDate_1 = "";
		String resvEndDate_2 = "";
		if(amMax>pmMax) {
			resvEndDate_1 = String.valueOf(amMax);
			resvEndDate_2 = resvEndDate_1+"00";
		}else if(amMax == pmMax || amMax<pmMax) {
			resvEndDate_1 = String.valueOf(pmMax);
			resvEndDate_2 = resvEndDate_1+"12";
		}
		
		System.out.println("선택한 시작 끝 날짜"+resvStartDate_2+","+resvEndDate_2);
		
		eq_resv.setResv_dae(resvStartDate_1+resvEndDate_1);
		System.out.println(eq_resv.getResv_dae());
		eq_resv.setAm_pm(resvStartDate_2+resvEndDate_2);
		System.out.println(eq_resv.getAm_pm());
		System.out.println(eq_resv.toString());
		
		System.out.println(session.getAttribute("user_id"));
		System.out.println(session.getAttribute("user_name"));
		
		
		EntrDto entrDto = new EntrDto();
		entrDto.setUser_id((String) session.getAttribute("user_id"));
		entrDto.setEmpl_name((String) session.getAttribute("user_name"));
		
		entrDto = jangBiService.entrSelectMember(entrDto); //저장된 세션 값으로 로그인 한 회원 정보 조회.
		System.out.println(entrDto.toString());
		
		EquipmentDto jangBiDti = jangBiService.jangBiSelect(eq_resv); //받아온 장비시퀀스 번호로 장비 조회.
		System.out.println(jangBiDti.toString());
		
		model.addAttribute("jangBiDti", jangBiDti);
		model.addAttribute("entrDto", entrDto);
		model.addAttribute("eq_resv", eq_resv);
		
	}
	
	
	@RequestMapping(value="/simpleJangbiTosubmit.do", method=RequestMethod.POST)
	@ResponseBody
	public void simpleJangbiTosubmit(Eq_resv eq_resv) {
		
		System.out.println(eq_resv.toString());
		
		jangBiService.jangBiResvInsert(eq_resv);
		
		
	}
	
	
	
	@RequestMapping(value="/reservation/reservationTrick.do", method=RequestMethod.GET)
	public void reservationTrick() {
		
		System.out.println("뿌리장비 예약요령 페이지");
		
	}

	
}
