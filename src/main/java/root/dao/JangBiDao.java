package root.dao;

import java.util.List;

import root.dto.EntrDto;
import root.dto.Eq_resv;
import root.dto.EquipmentDto;
import root.dto.SearchDto;
import root.utill.Paging;

public interface JangBiDao {

	public List<EquipmentDto> jangBiList(Paging piging);
	
	public List<EquipmentDto> jangBiSearch(SearchDto searchDto);
	
	//페이징을 위한 전체 게시글 갯수 조회
	public int getTotal();
	
	//페이징을 위한 검색 게시글 갯수 조회
	public int getSearchTotal(SearchDto searchDto);
	
	//예약시 가능 불가능 날짜 조회
	public List<Eq_resv> reservationCheck(Eq_resv eq_resv);
	
	//예약하기 버튼 클립시 로그인 된 기업회원 정보 가져오기
	public EntrDto entrSelectMember(EntrDto entrDto);
	
	//받아온 장비시퀀스 번호로 장비 조회.
	public EquipmentDto jangBiSelect(Eq_resv eq_resv);
	
	//장비 예약 테이블에 인서트
	public void jangBiResvInsert(Eq_resv eq_resv);
	
}
