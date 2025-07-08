/* mybatis SqlSession 메소드들 
 * 
 * 1.sqlsession.selectlist("매퍼네임스페이스.id")
 * 2.sqlsession.selectOne("매퍼네임스페이스.id", int bno)
 * 2.sqlsession.inset("매퍼네임스페이스.id", boardDTO)
 * 3.sqlsession.update("매퍼네임스페이스.id", boardDTO)
 * 4.sqlsession.delete("매퍼네임스페이스.id", bno)
 * 
 */

package kr.co.four.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	//1순위 마이바티스 사용
	@Inject
	private SqlSession sqlsession;
	
	//2순위 마이바티스 매퍼  네임스페이스 처리
	private static final String namespace= "kr.co.four.boardMapper";

	
	//3구순위
	@Override
	public List<BoardDTO> list() throws Exception {
		// 전체목록 
		return sqlsession.selectList(namespace+".list");
	}

	@Override
	public BoardDTO getDetail(int bno) throws Exception {
		// 선택조회 (글 읽기)
		return sqlsession.selectOne(namespace+".detail", bno);
	}

	@Override
	public int updateReadCnt(int bno) throws Exception {
		// 조회수 1증가
		return sqlsession.update(namespace + ".updateReadCnt", bno);
	}

	@Override
	public int register(BoardDTO boardDTO) throws Exception {
		// 글 추가
		return sqlsession.insert(namespace+".register", boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// 글 수정
		return sqlsession.update(namespace +  ".update", boardDTO);
	}

	@Override
	public int delete(int bno) throws Exception {
		// 글 삭제
		return sqlsession.delete(namespace + ".delete", bno);
	}

	@Override
	public List<BoardReply> getDetail1(int bno) {
		// 댓글 목록 보기
		return sqlsession.selectList(namespace+".detail1", bno);
	}

	@Override
	public int reply(BoardReply boardreply) {
		// 댓글쓰기
		return sqlsession.insert(namespace+".reply", boardreply);
	}

	@Override
	public BoardReply detail1(int reno) {
		// 댓글 선택 조회
		return sqlsession.selectOne(namespace+".detail12", reno);
	}

	@Override
	public int update1(BoardReply boardreply) throws Exception {
		// 댓글 수정
		return sqlsession.update(namespace +".update1", boardreply);
	}

	@Override
	public int replyDelete(int reno) {
		// 댓글 삭제 
		return sqlsession.delete(namespace +".replyDelete1", reno) ;
	}

}
