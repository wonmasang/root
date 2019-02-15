package root.service;

import javax.servlet.http.HttpSession;

import root.dto.EntrDto;
import root.dto.ExptDto;
import root.dto.LoginDto;

public interface LoginService {
	
	public int login(LoginDto loginDto, HttpSession session);
	
	public EntrDto entrMemberSelect(LoginDto loginDto);
	
	public ExptDto exptMemberSelect(LoginDto loginDto);

}
