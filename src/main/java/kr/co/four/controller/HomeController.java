package kr.co.four.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RestController;

import kr.co.four.emp.EmpService;
import kr.co.four.seo.SeoService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject EmpService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "board/login", method = RequestMethod.GET)
	 public String main(Model model) {
		//strat
		model.addAttribute("name", "메세지 전달완료");
		logger.info("로그인 창으로 이동");
		return"login";
		//end
	}
	
	@RequestMapping(value="board/login" , method = RequestMethod.POST)
	public String login(@RequestParam Map<String, Object> map
			,HttpServletRequest request
			,HttpServletResponse response
			,HttpSession session  ) throws Exception{
		//start
		request.setCharacterEncoding("utf-8");
		logger.info("요청정보 받아서 서비스로 보내기");
		
		Map<String, Object> user = service.login(map); //return이있는거는 개인연산자가 따라와야함
		// --------- user ----------
		//-  "id"   : "value1"     -
		//-  "name" : "value2"     -  
		//--------------------------
		
		//실패시
		if (user == null) {
			logger.info("로그인 실패");
			return "redirect:login";
		} else {
			// 세션부여 - 서버가 보관하는 전역변수(속성), 쿠키 - 클라이언트가 보관하는 전역 변수			 			 
			 session.setAttribute("user", user);
			 logger.info("로그인 성공");
			 return "redirect:/";
		}		
		//end
	}
	
	@RequestMapping(value = "/blogdex", method = RequestMethod.GET)
	public String blogdexPage() {
		return "include/blogdex";
	}
	
	@RequestMapping(value = "/blogdex_tabs", method = RequestMethod.GET)
	public String blogdexTabsPage() {
		return "include/blogdex_tabs";
	}
}

// SEO 점검기 REST API
@RestController
class SeoRestController {
    @PostMapping(value = "/seo/check", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> checkSeo(@RequestBody Map<String, String> body) {
        String url = body.get("url");
        return SeoService.analyze(url);
    }
}
