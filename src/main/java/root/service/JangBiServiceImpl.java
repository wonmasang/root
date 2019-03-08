package root.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import root.dao.JangBiDao;
import root.dto.EntrDto;
import root.dto.Eq_resv;
import root.dto.EquipmentDto;
import root.dto.SearchDto;
import root.utill.Paging;

@Service
public class JangBiServiceImpl implements JangBiService{
	
	@Autowired
	JangBiDao jangBiDao;
	
	@Override
	public List<EquipmentDto> jangBiList(Paging piging) {
		return jangBiDao.jangBiList(piging);
	}
	
	@Override
	public List<EquipmentDto> jangBiSearch(SearchDto searchDto) {
		return jangBiDao.jangBiSearch(searchDto);
	}
	
	@Override
	public int getTotal() {
		return jangBiDao.getTotal();
	}
	
	@Override
	public int getSearchTotal(SearchDto searchDto) {
		return jangBiDao.getSearchTotal(searchDto);
	}
	
	
	@Override
	public List<Eq_resv> reservationCheck(Eq_resv eq_resv) {
		return jangBiDao.reservationCheck(eq_resv);
	}
	
	@Override
	public EntrDto entrSelectMember(EntrDto entrDto) {
		return jangBiDao.entrSelectMember(entrDto);
	}
	
	@Override
	public EquipmentDto jangBiSelect(Eq_resv eq_resv) {
		return jangBiDao.jangBiSelect(eq_resv);
	}
	
	@Override
	public void jangBiResvInsert(Eq_resv eq_resv) {
		jangBiDao.jangBiResvInsert(eq_resv);
	}
	

}
