package kr.co.four.qna.model;

import lombok.Data;
import java.util.Date;

@Data
public class QnaFile {
    private Long id;
    private Long boardId;
    private String fileName;
    private String filePath;
    private Date uploadedAt;
} 