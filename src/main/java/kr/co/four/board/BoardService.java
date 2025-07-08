package kr.co.four.board;

import java.util.List;

public interface BoardService {
	//-- board 전체목록(조회): 요청 데이터 -> X , rs -> List<BoardDTO board>
			// 메소드명:list()
			public List<BoardDTO> list() throws Exception;
			
			//-- 글 보기 (선택조회): 요청데이터 -> bno, rs(결과) -> BoardDTO
			// 메소드명: getDetail()
			public BoardDTO getDetail(int bno) throws Exception;
			
			//-- 조회수 증가
			//메소드명: updateReadCnt(): 요청데이터 -> bno, rs->int
			public int updateReadCnt(int bno) throws Exception;
			
			//-- 글 추가 : 요청 데이터 -> BoardDTO, rs -> int
			// 메소드명: register() -> insertBoard()도 괜찮음 => (테이블 필드에 del필드 생성: del=0 으로 )
			public int register(BoardDTO boardDTO) throws Exception;
			
			//-- 글 수정:  요청 데이터 ->BoardDTO , rs -> int
			// 메소드명: update()
			public int update(BoardDTO boardDTO) throws Exception; 
			
		    //-- 글 삭제: 요청 데이터 -> bno, rs -> int
			// 메소드명: delete() => update로 구현 가능(테이블 필드에 del필드 생성: del=1로 변경함)
			public int delete(int bno)throws Exception;
			
			//-- 해당글에 대한 댓글 목록 보기
			public List<BoardReply> getDetail1(int bno);
			
			//-- 댓글 쓰기
			public int reply(BoardReply boardreply);
			
			//-- 댓글 선택 조회
			public BoardReply detail1(int reno);
			
			//--댓글 수정
			public int update1(BoardReply boardreply)throws Exception;
			
            //--댓글 삭제
			public int replyDelete(int reno);
	}


