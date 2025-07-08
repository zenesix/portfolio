package kr.co.four.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="board/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		//strat
		session.invalidate(); //세션해제
		return "redirect:/";
		//end
	}
}
