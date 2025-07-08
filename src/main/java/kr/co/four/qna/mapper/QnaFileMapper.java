package kr.co.four.qna.mapper;

import kr.co.four.qna.model.QnaFile;
import java.util.List;

public interface QnaFileMapper {
    void insert(QnaFile file);
    QnaFile findById(Long id);
    List<QnaFile> findByBoardId(Long boardId);
    void delete(Long id);
    void deleteByBoardId(Long boardId);
} 