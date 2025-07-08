package kr.co.four.qna.service.impl;

import kr.co.four.qna.model.QnaBoard;
import kr.co.four.qna.model.QnaFile;
import kr.co.four.qna.mapper.QnaBoardMapper;
import kr.co.four.qna.mapper.QnaFileMapper;
import kr.co.four.qna.service.QnaBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.util.StringUtils;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
    @Autowired
    private QnaBoardMapper qnaBoardMapper;

    @Autowired
    private QnaFileMapper qnaFileMapper;

    @Value("${qna.upload.dir:/upload/qna/}")
    private String uploadDir;

    @Override
    public List<QnaBoard> getAllBoards() {
        return qnaBoardMapper.findAll();
    }

    @Override
    public QnaBoard getBoardById(Long id) {
        return qnaBoardMapper.findById(id);
    }

    @Override
    public void createBoard(QnaBoard board, List<MultipartFile> files) {
        qnaBoardMapper.insert(board);
        if (files != null && !files.isEmpty()) {
            saveFiles(board.getId(), files);
        }
    }

    @Override
    public void updateBoard(QnaBoard board, List<MultipartFile> files) {
        qnaBoardMapper.update(board);
        if (files != null && !files.isEmpty()) {
            saveFiles(board.getId(), files);
        }
    }

    private void saveFiles(Long boardId, List<MultipartFile> files) {
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                String fileName = StringUtils.cleanPath(file.getOriginalFilename());
                String filePath = uploadDir + System.currentTimeMillis() + "_" + fileName;
                File dest = new File(filePath);
                dest.getParentFile().mkdirs();
                try {
                    file.transferTo(dest);
                    QnaFile qnaFile = new QnaFile();
                    qnaFile.setBoardId(boardId);
                    qnaFile.setFileName(fileName);
                    qnaFile.setFilePath(filePath);
                    qnaFileMapper.insert(qnaFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void deleteBoard(Long id) {
        qnaBoardMapper.delete(id);
    }

    @Override
    public List<QnaFile> getFilesByBoardId(Long boardId) {
        return qnaFileMapper.findByBoardId(boardId);
    }

    @Override
    public QnaFile getFileById(Long fileId) {
        return qnaFileMapper.findById(fileId);
    }

    @Override
    public void deleteFile(Long fileId) {
        QnaFile file = qnaFileMapper.findById(fileId);
        if (file != null) {
            File f = new File(file.getFilePath());
            if (f.exists()) f.delete();
            qnaFileMapper.delete(fileId);
        }
    }

    @Override
    public boolean checkSecret(Long id, String password) {
        QnaBoard board = qnaBoardMapper.findById(id);
        if (board != null && Boolean.TRUE.equals(board.getIsSecret())) {
            return board.getPassword() != null && board.getPassword().equals(password);
        }
        return false;
    }
} 