package kr.co.four.qna.service;

import kr.co.four.qna.model.QnaComment;
import java.util.List;

public interface QnaCommentService {
    void addComment(QnaComment comment);
    List<QnaComment> getCommentsByBoardId(Long boardId);
    void deleteComment(Long id);
} 