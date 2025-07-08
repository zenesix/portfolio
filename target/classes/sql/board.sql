mysql 문법
create table `webstore`.`board` (
`bno` int NOT NULL AUTO_INCREMENT,
`title` VARCHAR(45) NOT NULL,
`content` VARCHAR(45) NOT NULL,
`id` VARCHAR(45) NOT NULL,
`reddate` DATETIME NULL,
`readcnt` INT NULL,
`etc` varchar (45) NULL,
primary key (`bno`))
ENGINE=InnoDB
default character set = utf8;
)

---------------------------------------------------------------------------
maria db 문법 
create table `webstore`.`board` (
`bno` int NOT NULL AUTO_INCREMENT,
`title` VARCHAR(45) NOT NULL,
`content` VARCHAR(45) NOT NULL,
`id` VARCHAR(45) NOT NULL,
`reddate` DATETIME NULL,
`readcnt` INT NULL,
`etc` varchar (45) NULL,
CONSTRAINT test_pk PRIMARY KEY (bno)
)
ENGINE=InnoDB
DEFAULT CHARSET = utf8
COLLATE= urf_general_ci


-- board 전체목록(조회): 요청 데이터 -> X , rs -> List<BoardDTO board>
select * from board;
-- List<BoardDTO board>

-- 글보기 (선택조회): 요청데이터 -> bno, rs(결과): BoardDTO
select * from board 
where bno = 1;

-- 조회수 증가 : 요청데이터 -> bno, rs -> int
update board
set readcnt = readcnt + 1 
where bno = 1;

-- 글 추가 : 요청 데이터 BoardDTO, rs -> int
INSERT INTO webstore.board
(bno, title, content, id, reddate, readcnt, etc)
VALUES(0, '', '', '', '', NULL, NULL);

-- 글 수정:  요청 데이터 ->boardDTO , rs -> int
UPDATE webstore.board
SET title='', content='', id='', reddate='', readcnt=NULL, etc=null
WHERE bno=0;

-- 글 삭제: 요청 데이터 -> bno, rs -> int
DELETE FROM webstore.board
WHERE bno=0;

