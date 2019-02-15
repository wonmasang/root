package root.dao;

import java.util.List;

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
	
}
