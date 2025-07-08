//같은 폴더에있을시 호출 import 안해도됌 (reply 참고)
package kr.co.four.board;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.four.controller.HomeController;
import kr.co.four.board.BoardDTO;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired BoardService boardservice;

    @RequestMapping(value="/board/list", method=RequestMethod.GET)
    public String list(Model model) throws Exception {
        logger.info("목록");
    	List<BoardDTO> list = boardservice.list();
    	model.addAttribute("list", list);
    	return "login/list";
    }
    //글 선택조회
    @RequestMapping(value="/login/detail", method=RequestMethod.GET)
    public String getDetail(@RequestParam("bno")int bno,Model model) throws Exception {
            BoardDTO board = boardservice.getDetail(bno);
            //조회수 증가
            boardservice.updateReadCnt(bno);
            model.addAttribute("board", board);
            //댓글 전체목록 조회
             List<BoardReply> boardreply = boardservice.getDetail1(bno);
             model.addAttribute("boardreply", boardreply);
            
            return"login/detail";
    }
    
   
    
    //글 추가
    @RequestMapping(value="/board/register", method=RequestMethod.GET)
    public String register() {
    	return"login/register";
    	
    }
    
    @RequestMapping(value="/board/register", method=RequestMethod.POST)
    public String register(BoardDTO boardDTO,HttpServletRequest request
    		) throws Exception {
         request.setCharacterEncoding("utf-8");
    	  boardservice.register(boardDTO);
    	  
    	  return "redirect:/board/list";
    	 
    	 
    }
    
    //글 수정
    @RequestMapping(value="/board/update", method=RequestMethod.GET)
    public String update(@RequestParam("bno")int bno,Model model) throws Exception {
    	BoardDTO boardDTO = boardservice.getDetail(bno);
    	model.addAttribute("board", boardDTO);
    	return"login/update";
    }
    @RequestMapping(value="/board/update", method=RequestMethod.POST)
    public String update(BoardDTO boardDTO,RedirectAttributes attr) throws Exception {
    	int r = boardservice.update(boardDTO);
    	if(r>0) {
    		attr.addFlashAttribute("msg", "수정에 성공하였습니다");
         
    		return "redirect:/board/list";
    	}
    	return "redirect:/board/update?="+ boardDTO.getBno();
    	
    }
   
    
    //글 삭제
    @RequestMapping(value="board/delete", method=RequestMethod.GET)
    public String delete(@RequestParam("bno")int bno, RedirectAttributes httr) throws Exception {
    	 int r = boardservice.delete(bno);
    	 if(r>0) {
    		 httr.addFlashAttribute("msg", "삭제 성공하였습니다");
    		 
    	 }
    	 return "redirect:list";
    	
    }
    
   
   
   //댓글 쓰기
   @RequestMapping(value="/board/reply", method=RequestMethod.GET )
   public String reply() {
	   return "login/reply";
   }
   
   @RequestMapping(value="/board/reply", method=RequestMethod.POST)
   public String reply(BoardReply boardReply,HttpServletRequest request)throws Exception {
	   request.setCharacterEncoding("utf-8");
	   //서비스 호출
	    int r = boardservice.reply(boardReply);
	   if(r>0) {
		   return "redirect:/login/detail?bno=" + boardReply.getBno();
	   }
	   
	   //성공했으면 detail?bno=xxx  bno가 따라가야됌
	
	   return"reply";
   }


   //댓글 선택조회 + 댓글 수정
   @RequestMapping(value="/board/replyupdate", method=RequestMethod.GET)
   public String replyupdate(@RequestParam("reno")int reno,Model model,
		   @RequestParam("bno")int bno) throws Exception {
	   BoardReply reply = boardservice.detail1(reno);
	   BoardDTO board = boardservice.getDetail(bno);
	   model.addAttribute("reply", reply);
	   model.addAttribute("board", board);
	   return "login/replyupdate"; 
   }
   
   @RequestMapping(value="/board/replyupdate", method=RequestMethod.POST)
   public String replyupdate(BoardReply boardreply,HttpServletRequest request)throws Exception {
	   request.setCharacterEncoding("utf-8");
	   int r = boardservice.update1(boardreply);
	   
	   if(r>0) {
		   return "redirect:/login/detail?bno=" + boardreply.getBno(); 
	   }
	   
	   
	return "redirect:replyupdate?reno=" + boardreply.getReno();
   }

   
   //================일반 댓글 End=========================
   
   //=============ajax 통신 Start==============================
   //ajax 댓글에 대한 매핑과 메소드 구현
   //ajax 쓰기 구현
   @ResponseBody
   @RequestMapping(value="/board/reply2", method=RequestMethod.POST)
   public int reply2(BoardReply boardReply) {
	   return boardservice.reply(boardReply);
   }
   
   //댓글 목록조회
   @ResponseBody
   @RequestMapping(value="/board/replylist", method=RequestMethod.POST)
   public List<BoardReply> replylist(@RequestParam("bno") int bno) {
	   return boardservice.getDetail1(bno); //
   }
   
   //ajax 댓글 수정 구현
   @ResponseBody
   @RequestMapping(value="/board/replyupdate2", method=RequestMethod.POST)
   public Map<String, Object> replyupdate1(BoardReply boardreply) throws Exception {
	   Map<String, Object> result = new HashMap<String, Object>();
	  try {
		  boardservice.update1(boardreply);
		  result.put("status", "ok");
	  }catch(Exception e) {
		  e.printStackTrace();
		  result.put("status", "Fail");
	  }
	  return result;
   }
   //ajax삭제구현 
   @ResponseBody
   @RequestMapping(value="/board/replyDelete2", method=RequestMethod.GET)
// public int replyDelete2(@RequestParam("reno")int reno) {
//	   return boardservice.replyDelete(reno);
// }   
   public Map<String, Object> replyDelete2(@RequestParam("reno")int reno){
	   Map<String, Object> result = new HashMap<String, Object>();
	   try {
		boardservice.replyDelete(reno);
		result.put("status", "Ok");
	   }catch(Exception e){
		   e.printStackTrace();
		   result.put("status", "fail");
	   }
	   return result;
   }
   
   
  
   
   
    
}
