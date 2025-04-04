--학사관리프로그램 샘플데이터--
--INSERT 순서대로(위->아래) 해주세요-- 


--1.회원 구분테이블--
insert into MEMBER values(1,'server')
insert into MEMBER values(2,'student')
insert into MEMBER values(3,'teacher')
insert into MEMBER values(4,'manager') 

--2.회원 테이블  
select * from member1 
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 1, '이종원', 'M', 'server',  '1234', '010-2222-2222', 'server@sys.com',  '천안', TO_DATE('2000-05-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 2, '오진우', 'M', 'student', '1234', '010-2222-3333', 'student@sys.com', '서울', TO_DATE('2000-12-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 3, '채수림', 'F', 'teacher', '1234', '010-2222-4444', 'teacher@sys.com', '서울', TO_DATE('1986-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 4, '김도영', 'F', 'manager', '1234', '010-2222-5555', 'manager@sys.com', '김포', TO_DATE('1990-11-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 2, '남광준', 'M', 'student2', '1234', '010-2222-6666', 'student2@sys.com', '부산', TO_DATE('1993-11-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 3, '김채현', 'M', 'teacher2', '1234', '010-2222-7777', 'teacher2@sys.com', '제주', TO_DATE('1980-11-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 4, '박주연', 'F', 'manager2', '1234', '010-2222-8888', 'manager2@sys.com', '울산', TO_DATE('1994-11-12', 'YYYY-MM-DD'), 1);

 
--3.반테이블
INSERT INTO CLASSGROUP VALUES (sq_CLASSGROUP_groupidx.nextval, 2, 'A반', '김도영', '채수림', 20);
INSERT INTO CLASSGROUP VALUES (sq_CLASSGROUP_groupidx.nextval, 5, 'B반', '박주연', '김채현', 20); 


--4.강좌 테이블
INSERT INTO CLASS VALUES (sq_CLASS_classidx.nextval, 1, '자바 백엔드', '채수림', 30, 25, TO_DATE('2025-03-01','YYYY-MM-DD'), TO_DATE('2025-07-30','YYYY-MM-DD'), TO_DATE('2025-08-01','YYYY-MM-DD'), '김도영');
INSERT INTO CLASS VALUES (sq_CLASS_classidx.nextval, 2, '파이썬 기초', '김채현', 40, 30, TO_DATE('2025-04-01','YYYY-MM-DD'), TO_DATE('2025-08-30','YYYY-MM-DD'), TO_DATE('2025-09-01','YYYY-MM-DD'), '박주연');

--5.학생 세부사항 테이 블
INSERT INTO MEMBER2 VALUES(sq_MEMBER2_m2idx.nextval, 2, 1, '학력None', '자격증None', '경력None', '특이사항None', '이미지경로None');
INSERT INTO MEMBER2 VALUES(sq_MEMBER2_m2idx.nextval, 5, 2, '학력None', '자격증None', '경력None', '특이사항None', '이미지경로None');

--6.매니저/강사 세부사항 테이블 
INSERT INTO MEMBER3 VALUES(sq_MEMBER3_m3idx.nextval, 3, 1, 1, '석사', '강사 경력 5년', TO_DATE('2025-03-01','YYYY-MM-DD'), '자바 백엔드', 'A반', '성실함', 'teacher.jpg');
INSERT INTO MEMBER3 VALUES(sq_MEMBER3_m3idx.nextval, 6, 2, 2, '박사', '강사 경력 8년', TO_DATE('2025-04-01','YYYY-MM-DD'), '파이썬 기초', 'B반', '게으름', 'teacher2.jpg');

--7.비품 테이블 
INSERT INTO ITEM VALUES (sq_ITEM_itemidx.nextval, 1, '노트북', 1000000, 15);
INSERT INTO ITEM VALUES (sq_ITEM_itemidx.nextval, 1, '책상', 50000, 10);
INSERT INTO ITEM VALUES (sq_ITEM_itemidx.nextval, 2, '노트북', 1000000, 15);
INSERT INTO ITEM VALUES (sq_ITEM_itemidx.nextval, 2, '책상', 50000, 10);

--8.주차테이블
INSERT INTO CLASSDETIL2 VALUES (sq_CLASSDETIL2_weekidx.nextval, 1, 1,'주차','자바OT', '2025-03-01 ~ 2025-03-07');
INSERT INTO CLASSDETIL2 VALUES (sq_CLASSDETIL2_weekidx.nextval, 1, 2,'주차','자바 기초', '2025-03-01 ~ 2025-03-07');
INSERT INTO CLASSDETIL2 VALUES (sq_CLASSDETIL2_weekidx.nextval, 2, 1,'주차','파이썬OT', '2025-03-01 ~ 2025-03-07');
INSERT INTO CLASSDETIL2 VALUES (sq_CLASSDETIL2_weekidx.nextval, 2, 2,'주차','파이썬 기초', '2025-03-01 ~ 2025-03-07'); 

--9.강좌 세부사항 테이 
INSERT INTO CLASSDETIL VALUES (sq_CLASSDETIL_class2idx.nextval, 1, 1, '자바 백엔드', '자바 소개 및 개발 환경 구축');
INSERT INTO CLASSDETIL VALUES (sq_CLASSDETIL_class2idx.nextval, 2, 1, '파이썬 기초', '파이썬 소개및 개발 환경 구축');

--10.강좌 평가 테이블 
INSERT INTO CLASSESTIMATE VALUES (sq_CLASSESTIMATE_estidx.nextval, 1, 2, 5, '좋아요');
INSERT INTO CLASSESTIMATE VALUES (sq_CLASSESTIMATE_estidx.nextval, 2, 5, 3, '싫어요');

--11.출결 테이블 
INSERT INTO RECORD VALUES (sq_RECORD_recordidx.nextval, 2, 3, 1, 1, 100, 100, 1, SYSDATE, SYSDATE, SYSDATE);
INSERT INTO RECORD VALUES (sq_RECORD_recordidx.nextval, 3, 6, 2, 1, 100, 100, 1, SYSDATE, SYSDATE, SYSDATE);

--12.출결 이슈 테이블 
INSERT INTO RECORDISSUE VALUES (sq_RECORDISSUE_issueidx.nextval, 2, '지각', '사유서', 0, 'late.pdf', SYSDATE);

--13.시험 문제 테이블 
INSERT INTO TEST VALUES (sq_TEST_testidx.nextval, 1, 1, '1+1=?', '2', 10);
INSERT INTO TEST VALUES (sq_TEST_testidx.nextval, 2, 1, '2+2=?', '4', 10);

--14.학생시험정보 테이블 
INSERT INTO SANSWER VALUES (sq_SANSWER_sansweridx.nextval, 1, 2, 1, 1, '2', 1, 1);
INSERT INTO SANSWER VALUES (sq_SANSWER_sansweridx.nextval, 2, 5, 2, 2, '4', 1, 1);

--15.게시판 테이블
INSERT INTO BOARD VALUES (sq_BOARD_boardidx.nextval, 'manager', '공지사항', '김도영', '1234', '개강일은 3월 1일입니다.', SYSDATE, 0, 0, 0, 0, 0);