package kr.co.four.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CustomController {
    
	@Inject
	private BoardService service;
	
	//게시판리스트
	@RequestMapping(value = "board/custom", method = RequestMethod.GET)
	public String custom(Model model) throws Exception {
		
		List<BoardDTO> list = service.list();
        model.addAttribute("list" , list);
		return "login/custom";
	}
	//게시판선택읽기,댓글 전체목록,
	@RequestMapping(value = "/board/custom2", method = RequestMethod.GET)
	public String custom2(@RequestParam("bno")int bno ,Model model) throws Exception {
		BoardDTO board = service.getDetail(bno);
		model.addAttribute("board", board);
		List<BoardReply> reply = service.getDetail1(bno);
		model.addAttribute("reply", reply);
		
		return "login/customdetail";
	}
	@RequestMapping(value="/board/custom3", method=RequestMethod.GET)
	public String custom3() {
		 return"login/reply";
	}
	@RequestMapping(value="/board/custom3", method=RequestMethod.POST)
	public String custom3(Model model,BoardReply boardreply, RedirectAttributes one,
			HttpServletRequest request )throws Exception {
		  request.setCharacterEncoding("utf-8");
		  int r = service.reply(boardreply);
		  if(r>0) {
			  one.addFlashAttribute("one", "댓글 작성에 성공하였습니다");
			  return "redirect:/board/custom2?bno="+ boardreply.getBno();
		  }
		 return "redirect:/board/custom2?bno="+ boardreply.getBno();
	}
}
