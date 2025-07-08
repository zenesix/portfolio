package kr.co.four.qna.model;

import lombok.Data;
import java.util.Date;

@Data
public class QnaBoard {
    private Long id;
    private String title;
    private String content;
    private String writer;
    private String password; // 비밀글용
    private Boolean isSecret;
    private Date createdAt;
    private Date updatedAt;
    private Integer viewCount;
} 