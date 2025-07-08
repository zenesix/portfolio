package kr.co.four.qna.model;

import lombok.Data;
import java.util.Date;

@Data
public class QnaComment {
    private Long id;
    private Long boardId;
    private String commenter;
    private String comment;
    private Date createdAt;
} 