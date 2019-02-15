package root.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import root.dao.LoginDao;
import root.dto.EntrDto;
import root.dto.ExptDto;
import root.dto.LoginDto;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao loginDao;
	
	@Override
	public int login(LoginDto loginDto, HttpSession session) {

		System.out.println("서비스임플"+loginDto.toString());
		
		String on = "on";
		int loginCheck = 0;
		
		
		if(on.equals(loginDto.getCorporation()) ) {
			System.out.println("기업회원 온");
			loginCheck = loginDao.corporationLoginCheck(loginDto);
			System.out.println("기업"+loginCheck);
			if(loginCheck > 0) {
				session.setAttribute("user_id", loginDto.getUser_id());
				session.setAttribute("type", 11);
			}
			return 11;
		}else if(on.equals(loginDto.getExpert())) {
			System.out.println("전문가 온");
			System.out.println("ddd"+loginDto.toString());
			loginCheck = loginDao.expertLoginCheck(loginDto);
			System.out.println("전문가"+loginCheck);
			if(loginCheck > 0) {
				session.setAttribute("user_id", loginDto.getUser_id());
				session.setAttribute("type", 22);
			}
			return 22;
		}else {
			return 0;
		}
		
	}
	
	@Override
	public EntrDto entrMemberSelect(LoginDto loginDto) {
		
		return loginDao.entrMemberSelect(loginDto);
	}

	@Override
	public ExptDto exptMemberSelect(LoginDto loginDto) {

		return loginDao.exptMemberSelect(loginDto);
	}
	
	
	
}
