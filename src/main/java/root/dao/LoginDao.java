package root.dao;

import root.dto.EntrDto;
import root.dto.ExptDto;
import root.dto.LoginDto;

public interface LoginDao {

	public int corporationLoginCheck(LoginDto loginDto);
	
	public int expertLoginCheck(LoginDto loginDto);

	public EntrDto entrMemberSelect(LoginDto loginDto);
	
	public ExptDto exptMemberSelect(LoginDto loginDto);

	
}
