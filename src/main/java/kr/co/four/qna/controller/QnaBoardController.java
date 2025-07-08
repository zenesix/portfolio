package kr.co.four.qna.controller;

import kr.co.four.qna.model.QnaBoard;
import kr.co.four.qna.model.QnaFile;
import kr.co.four.qna.service.QnaBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

@RestController
@RequestMapping("/api/porsche/qna")
public class QnaBoardController {
    @Autowired
    private QnaBoardService qnaBoardService;

    // 게시글 목록
    @GetMapping("/boards")
    public List<QnaBoard> getAllBoards() {
        return qnaBoardService.getAllBoards();
    }

    // 게시글 상세
    @GetMapping("/boards/{id}")
    public QnaBoard getBoard(@PathVariable Long id) {
        return qnaBoardService.getBoardById(id);
    }

    // 게시글 작성
    @PostMapping("/boards")
    public ResponseEntity<?> createBoard(@RequestPart QnaBoard board,
                                         @RequestPart(required = false) List<MultipartFile> files) {
        qnaBoardService.createBoard(board, files);
        return ResponseEntity.ok().build();
    }

    // 게시글 수정
    @PutMapping("/boards/{id}")
    public ResponseEntity<?> updateBoard(@PathVariable Long id,
                                         @RequestPart QnaBoard board,
                                         @RequestPart(required = false) List<MultipartFile> files) {
        board.setId(id);
        qnaBoardService.updateBoard(board, files);
        return ResponseEntity.ok().build();
    }

    // 게시글 삭제
    @DeleteMapping("/boards/{id}")
    public ResponseEntity<?> deleteBoard(@PathVariable Long id) {
        qnaBoardService.deleteBoard(id);
        return ResponseEntity.ok().build();
    }

    // 게시글 첨부파일 목록
    @GetMapping("/boards/{boardId}/files")
    public List<QnaFile> getFiles(@PathVariable Long boardId) {
        return qnaBoardService.getFilesByBoardId(boardId);
    }

    // 첨부파일 다운로드 (단건)
    @GetMapping("/files/{fileId}")
    public QnaFile getFile(@PathVariable Long fileId) {
        return qnaBoardService.getFileById(fileId);
    }

    // 첨부파일 삭제
    @DeleteMapping("/files/{fileId}")
    public ResponseEntity<?> deleteFile(@PathVariable Long fileId) {
        qnaBoardService.deleteFile(fileId);
        return ResponseEntity.ok().build();
    }

    // 비밀글 비밀번호 확인
    @PostMapping("/boards/{id}/check-secret")
    public ResponseEntity<?> checkSecret(@PathVariable Long id, @RequestBody String password) {
        boolean result = qnaBoardService.checkSecret(id, password);
        return ResponseEntity.ok(result);
    }

    
} 