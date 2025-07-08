package kr.co.four.qna.mapper;

import kr.co.four.qna.model.QnaComment;
import java.util.List;

public interface QnaCommentMapper {
    void insert(QnaComment comment);
    List<QnaComment> findByBoardId(Long boardId);
    void delete(Long id);
} 