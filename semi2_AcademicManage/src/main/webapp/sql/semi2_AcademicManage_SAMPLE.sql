--각 테이블별 작성쿼리문--
-- 회원구분테이블 샘플데이터-- 
INSERT INTO MEMBER VALUES(1,'server')
INSERT INTO MEMBER VALUES(2,'student')
INSERT INTO MEMBER VALUES(3,'teacher')
INSERT INTO MEMBER VALUES(4,'manager')

--회원테이블--
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 1, '이종원', 'M', 'server', '1234', '010-2222-2222', 'server@sys.com', '천안', TO_DATE('2000-05-12', 'YYYY-MM-DD'), 1)
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 2, '오진우', 'M', 'student', '1234', '010-2222-3333', 'student@sys.com', '서울', TO_DATE('2000-12-12', 'YYYY-MM-DD'), 1)
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 3, '채수림', 'F', 'teacher', '1234', '010-2222-4444', 'teacher@sys.com', '서울', TO_DATE('1986-01-12', 'YYYY-MM-DD'), 1)
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 4, '김도영', 'F', 'manager', '1234', '010-2222-5555', 'manager@sys.com', '김포', TO_DATE('1990-11-12', 'YYYY-MM-DD'), 1)
