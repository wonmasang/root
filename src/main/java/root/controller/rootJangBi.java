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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import root.dto.Eq_resv;
import root.dto.EquipmentDto;
import root.dto.SearchDto;
import root.service.JangBiService;
import root.utill.Paging;

@Controller
public class rootJangBi {

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
	
	
	@RequestMapping(value="/popup/simpleJangbiPopupAAA.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> simpleJangbiPopup(Eq_resv eq_resv) {
		
		 String start = eq_resv.getResStartDate();
		 String end = eq_resv.getResEndDate();
		 
		 System.out.println(start);
		 System.out.println(end);
		 
		 
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
			List<Object> listTime = new ArrayList<Object>();
			
			for(int i=1; i<diffDays; i++) {
				cal.setTime(sDate);
				cal.add(Calendar.DAY_OF_YEAR, i);
				String date = formatter.format(cal.getTime());
				listTime.add(date);
			}
			
			System.out.println(listTime);
			
			map.put("diff", diffDays);
			map.put("listTime", listTime);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		List<Eq_resv> resCheckList = jangBiService.reservationCheck(eq_resv);
//		System.out.println("체크리스트"+resCheckList);
		
		
		return map;
		
	}
	

	
}
