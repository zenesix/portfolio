package kr.co.four.qna.mapper;

import kr.co.four.qna.model.QnaBoard;
import java.util.List;

public interface QnaBoardMapper {
    List<QnaBoard> findAll();
    QnaBoard findById(Long id);
    void insert(QnaBoard board);
    void update(QnaBoard board);
    void delete(Long id);
} 