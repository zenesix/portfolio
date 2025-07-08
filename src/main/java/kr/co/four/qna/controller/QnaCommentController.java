package kr.co.four.qna.controller;

import kr.co.four.qna.model.QnaComment;
import kr.co.four.qna.service.QnaCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/qna/comments")
public class QnaCommentController {
    @Autowired
    private QnaCommentService qnaCommentService;

    // 댓글 등록
    @PostMapping
    public ResponseEntity<?> addComment(@RequestBody QnaComment comment) {
        qnaCommentService.addComment(comment);
        return ResponseEntity.ok().build();
    }

    // 댓글 목록
    @GetMapping("/{boardId}")
    public List<QnaComment> getComments(@PathVariable Long boardId) {
        return qnaCommentService.getCommentsByBoardId(boardId);
    }

    // 댓글 삭제
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteComment(@PathVariable Long id) {
        qnaCommentService.deleteComment(id);
        return ResponseEntity.ok().build();
    }
} 