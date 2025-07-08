package kr.co.four.qna.service;

import kr.co.four.qna.model.QnaBoard;
import kr.co.four.qna.model.QnaFile;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public interface QnaBoardService {
    List<QnaBoard> getAllBoards();
    QnaBoard getBoardById(Long id);
    void createBoard(QnaBoard board, List<MultipartFile> files);
    void updateBoard(QnaBoard board, List<MultipartFile> files);
    void deleteBoard(Long id);
    List<QnaFile> getFilesByBoardId(Long boardId);
    QnaFile getFileById(Long fileId);
    void deleteFile(Long fileId);
    boolean checkSecret(Long id, String password);
} 