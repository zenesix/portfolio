package kr.co.four.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject private BoardDAO boarddao;

	@Override
	public List<BoardDTO> list() throws Exception {
		// 글 전체 목록
		return boarddao.list();
	}

	@Override
	public BoardDTO getDetail(int bno) throws Exception {
		// 글 (선택조회)
		// return boarddao.updateReadCnt(bno); 조회수 같은경우 리턴 안받아도되니 여기다 넣어도됌
		return boarddao.getDetail(bno);
	}

	@Override
	public int updateReadCnt(int bno) throws Exception {
		// 조회수 증가
		return boarddao.updateReadCnt(bno);
	}

	@Override
	public int register(BoardDTO boardDTO) throws Exception {
		// 글 추가
		return boarddao.register(boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// 글 수정
		return boarddao.update(boardDTO);
	}

	@Override
	public int delete(int bno) throws Exception {
		// 글 삭제
		return boarddao.delete(bno);
	}

	@Override
	public List<BoardReply> getDetail1(int bno) {
		// 댓글 목록 조회
		return boarddao.getDetail1(bno);
	}

	@Override
	public int reply(BoardReply boardreply) {
		// 댓글 쓰기
		return boarddao.reply(boardreply);
	}

	@Override
	public BoardReply detail1(int reno) {
		// 댓글 선택 조회
		return boarddao.detail1(reno);
	}

	@Override
	public int update1(BoardReply boardreply) throws Exception {
		// 댓글 수정
		return boarddao.update1(boardreply);
	}

	@Override
	public int replyDelete(int reno) {
		// TODO Auto-generated method stub
		return boarddao.replyDelete(reno);
	}

}
