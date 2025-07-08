package kr.co.four.qna.service.impl;

import kr.co.four.qna.model.QnaComment;
import kr.co.four.qna.mapper.QnaCommentMapper;
import kr.co.four.qna.service.QnaCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class QnaCommentServiceImpl implements QnaCommentService {
    @Autowired
    private QnaCommentMapper qnaCommentMapper;

    @Override
    public void addComment(QnaComment comment) {
        qnaCommentMapper.insert(comment);
    }

    @Override
    public List<QnaComment> getCommentsByBoardId(Long boardId) {
        return qnaCommentMapper.findByBoardId(boardId);
    }

    @Override
    public void deleteComment(Long id) {
        qnaCommentMapper.delete(id);
    }
} 