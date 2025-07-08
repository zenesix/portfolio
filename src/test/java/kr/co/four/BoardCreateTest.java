package kr.co.four;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.four.board.BoardDAO;
import kr.co.four.board.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardCreateTest {
	@Inject private BoardDAO boardDAO;
	
	@Test
	public void testInsert()throws Exception {
		BoardDTO board; //행선언
		for(int i =0; i<10; i++) {
			board= new BoardDTO();
			board.setTitle("Test title[" + i +"]");
			board.setContent("Test test[" + i + "]");
			board.setId("root");
			boardDAO.register(board);
			
			Thread.sleep(1);
		}
		
	}
 
}
