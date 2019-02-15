package root.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class main {

	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public void main() {
		
		System.out.println("메인이닷!!");
		
	}
	
	
}
