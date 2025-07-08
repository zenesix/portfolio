/*
 * 인증모드 도입.  
 * Controller 요청을 처리하기전 / 후 에 호출이 됨.
 */
package kr.co.four.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthenticationInterceptor2 implements HandlerInterceptor{
	
    //컨트롤러가 요청을 처리하기전에 호출하는 메소드 (전)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 
		//클라이언트에 부여한 세션을 가져온다.
		HttpSession session =request.getSession(); 
		
		
		
		return true;
	}
	
	
	//예외가 발생하지 않은 경우에만 컨트롤러가 작업이 끝나는 호출되는 메소드
	//컨트롤러가 동작제대로 끝났을 떄 (후)
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	//예외 발생여부에 상관없이 컨트롤러가 작업이 끝나면 호출되는 메소드.
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
