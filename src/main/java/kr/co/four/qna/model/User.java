package kr.co.four.qna.model;

import lombok.Data;

@Data
public class User {
    private Long id;
    private String username;
    private String password;
    private String role;
} 