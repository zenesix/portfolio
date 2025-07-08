package kr.co.four.qna.controller;

import kr.co.four.qna.model.QnaBoard;
import kr.co.four.qna.model.QnaFile;
import kr.co.four.qna.model.QnaComment;
import kr.co.four.qna.service.QnaBoardService;
import kr.co.four.qna.service.QnaCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

@Controller
@RequestMapping("/porsche/qna")
public class QnaPageController {
    @Autowired
    private QnaBoardService qnaBoardService;
    @Autowired
    private QnaCommentService qnaCommentService;

    // 목록
    @GetMapping("/list")
    public String listPage(Model model) {
        List<QnaBoard> boards = qnaBoardService.getAllBoards();
        model.addAttribute("boards", boards);
        return "porsche/qna/list";
    }

    // 글쓰기 폼
    @GetMapping("/write")
    public String writePage() {
        return "porsche/qna/write";
    }

    // 글 등록 처리
    @PostMapping("/write")
    public String writeAction(QnaBoard board, @RequestParam(value = "files", required = false) List<MultipartFile> files) {
        qnaBoardService.createBoard(board, files);
        return "redirect:/porsche/qna/list";
    }

    // 상세
    @GetMapping("/view/{id}")
    public String viewPage(@PathVariable Long id, Model model) {
        QnaBoard board = qnaBoardService.getBoardById(id);
        List<QnaFile> files = qnaBoardService.getFilesByBoardId(id);
        List<QnaComment> comments = qnaCommentService.getCommentsByBoardId(id);
        model.addAttribute("board", board);
        model.addAttribute("files", files);
        model.addAttribute("comments", comments);
        return "porsche/qna/view";
    }

    // 글수정 폼
    @GetMapping("/edit/{id}")
    public String editPage(@PathVariable Long id, Model model) {
        QnaBoard board = qnaBoardService.getBoardById(id);
        model.addAttribute("board", board);
        return "porsche/qna/edit";
    }

    // 글수정 처리
    @PostMapping("/edit/{id}")
    public String editAction(@PathVariable Long id, QnaBoard board, @RequestParam(value = "files", required = false) List<MultipartFile> files) {
        board.setId(id);
        qnaBoardService.updateBoard(board, files);
        return "redirect:/porsche/qna/view/" + id;
    }

    // 글삭제 처리
    @PostMapping("/delete/{id}")
    public String deleteAction(@PathVariable Long id) {
        qnaBoardService.deleteBoard(id);
        return "redirect:/porsche/qna/list";
    }

    // 댓글 등록
    @PostMapping("/comment/{boardId}")
    public String commentAction(@PathVariable Long boardId, QnaComment comment) {
        comment.setBoardId(boardId);
        qnaCommentService.addComment(comment);
        return "redirect:/porsche/qna/view/" + boardId;
    }
} 