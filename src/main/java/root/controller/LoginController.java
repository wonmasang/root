package root.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import root.dto.EntrDto;
import root.dto.ExptDto;
import root.dto.LoginDto;
import root.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
	
	@RequestMapping(value="/main.do", method=RequestMethod.POST)
	public void MemberLogin(HttpSession session, LoginDto loginDto, Model model) {
		
		System.out.println(loginDto);
		
		//로그인 하면 세션에 id,type SET함.(서비스에서)
		loginService.login(loginDto, session);
		
		//기업회원, 전문가 라디오박스 값 받아서 회원정보 받아오기.
		String on = "on";
		if(on.equals(loginDto.getCorporation())) {
			EntrDto entrDto = loginService.entrMemberSelect(loginDto);
			
			System.out.println("기업회원="+entrDto.toString());
			session.setAttribute("user_name", entrDto.getEmpl_name());
			
			
			
		}else if(on.equals(loginDto.getExpert())) {
			ExptDto exptDto = loginService.exptMemberSelect(loginDto);
			
			System.out.println("전문가="+exptDto.toString());
			session.setAttribute("user_name", exptDto.getExpt_name());
			
		}
		
		
		
	}
	
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
	
	
}
