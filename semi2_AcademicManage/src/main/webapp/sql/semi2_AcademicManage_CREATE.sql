-- 모든 테이블 보기- 
SELECT * FROM MEMBER
SELECT * FROM MEMBER1
SELECT * FROM CLASSGROUP
SELECT * FROM CLASS
SELECT * FROM MEMBER2
SELECT * FROM MEMBER3
SELECT * FROM ITEM
SELECT * FROM CLASSDETIL2
SELECT * FROM CLASSDETIL
SELECT * FROM CLASSESTIMATE
SELECT * FROM RECORD
SELECT * FROM RECORDISSUE
SELECT * FROM TEST
SELECT * FROM SANSWER
SELECT * FROM BOARD

SELECT* FROM TAB


-- 테이블 생성--
-- 회원구분테이블--
CREATE TABLE MEMBER (
    midx NUMBER(4) PRIMARY KEY,
    membersort VARCHAR2(20) NOT NULL UNIQUE
)

--회원테이블--
CREATE TABLE MEMBER1 (
    idx NUMBER(10) PRIMARY KEY,
    midx NUMBER(4),
    name VARCHAR2(30) NOT NULL,
    sex VARCHAR2(1) CHECK (SEX IN ('M', 'F')) NOT NULL,
    id VARCHAR2(30) NOT NULL UNIQUE,
    pwd VARCHAR2(50) NOT NULL,
    tel VARCHAR2(20) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    addr VARCHAR2(70) NOT NULL,
    birth DATE NOT NULL,
    appro NUMBER(1) DEFAULT 0 CHECK (APPRO IN(0, 1)),
-- FOREIGN KEY 설정 (midx -> MEMBER 테이블의 midx 참조)--
    CONSTRAINT fk_MEMBER1_midx FOREIGN KEY (midx) REFERENCES MEMBER(midx)
)

--반테이블--
CREATE TABLE CLASSGROUP (
    groupidx NUMBER(10) PRIMARY KEY,
    idx NUMBER(10),
    groupname VARCHAR2(20) NOT NULL,
    mname VARCHAR2(30) NOT NULL,
    tname VARCHAR2(30) DEFAULT '미지정' NOT NULL,
    scount number(15) NOT NULL,
--FOREIGN KEY 설정 -- 
    CONSTRAINT fk_MEMBER1_idx FOREIGN KEY(idx) REFERENCES MEMBER1(idx)
)

--강좌테이블--
CREATE TABLE CLASS (
    classidx NUMBER(10) PRIMARY KEY,
    groupidx NUMBER(10),
    classname VARCHAR2(70) NOT NULL,
    tname VARCHAR2(15) NOT NULL,
    entirescount NUMBER(10) NOT NULL,
    reqscount NUMBER(10) NOT NULL,
    comingdate DATE NOT NULL,
    enddate DATE NOT NULL,
    entiredate DATE NOT NULL,
    chargemname VARCHAR2(20) NOT NULL,
--FOREIGN KEY 설정 -- 
    CONSTRAINT fk_CLASSGROUP_groupidx FOREIGN KEY(groupidx) REFERENCES CLASSGROUP(groupidx)
)

--학생세부사항테이블--
CREATE TABLE MEMBER2 (
    m2idx NUMBER(10) PRIMARY KEY,
    idx NUMBER(10),
    classidx NUMBER(10),
    edu VARCHAR2(50) NOT NULL,
    licen VARCHAR2(50) NOT NULL,
    career VARCHAR2(60) NOT NULL,
    memo VARCHAR2(200) NOT NULL,
    imgaddr VARCHAR(100) NOT NULL,
--FOREIGN KEY 설정 -- 
    CONSTRAINT fk_MEMBER1_idx2 FOREIGN KEY(idx) REFERENCES MEMBER1(idx),
    CONSTRAINT fk_CLASS_classidx FOREIGN KEY(classidx) REFERENCES CLASS(classidx) 
)

--매니저&강사세부사항테이블--
CREATE TABLE MEMBER3 (
    m3idx NUMBER(10) PRIMARY KEY,
    idx NUMBER(10),
    classidx NUMBER(10),
    groupidx NUMBER(10),
    edu2 VARCHAR2(50) NOT NULL,
    career VARCHAR2(60) NOT NULL,
    comingdate DATE NOT NULL,
    selecclass VARCHAR2(70) NOT NULL,
    groupname VARCHAR2(20) NOT NULL,
    memo VARCHAR2(100) NOT NULL,
    imgaddr VARCHAR(100) NOT NULL,
--FOREIGN KEY 설정 -- 
    CONSTRAINT fk_MEMBER1_idx3 FOREIGN KEY(idx) REFERENCES MEMBER1(idx),
    CONSTRAINT fk_CLASS_classidx2 FOREIGN KEY(classidx) REFERENCES CLASS(classidx),
    CONSTRAINT fk_CLASSGROUP_groupidx2 FOREIGN KEY(groupidx) REFERENCES CLASSGROUP(groupidx)
)


--비품테이블--
CREATE TABLE ITEM (
    itemidx NUMBER(10) PRIMARY KEY,
    groupidx NUMBER(10),
    itemname VARCHAR2(30) NOT NULL,
    itemcost NUMBER(30) NOT NULL,
    itemcount NUMBER(10) NOT NULL,
--FOREIGN KEY 설정 -- 
    CONSTRAINT fk_CLASSGROUP_groupidx3 FOREIGN KEY(groupidx) REFERENCES CLASSGROUP(groupidx)
)



--주차테이블--
CREATE TABLE CLASSDETIL2 (
    weekidx NUMBER(10) PRIMARY KEY,
    weeknum NUMBER(10) NOT NULL,
    weekname VARCHAR2(30) NOT NULL,
    weekcon VARCHAR2(60) NOT NULL,
    weekperiod VARCHAR2(70) NOT NULL
)

--강좌세부사항테이블--
CREATE TABLE CLASSDETIL (
    class2idx NUMBER(10) PRIMARY KEY,
    classidx NUMBER(10),
    weekidx NUMBER(10),
    class2name VARCHAR2(50) NOT NULL,
    classintro VARCHAR2(70) NOT NULL,
--FOREIGN KEY 설정 -- 
    CONSTRAINT fk_CLASS_classidx3 FOREIGN KEY(classidx) REFERENCES CLASS(classidx),
    CONSTRAINT fk_CLASSDETIL2_weekidx FOREIGN KEY(weekidx) REFERENCES CLASSDETIL2(weekidx)
)

--강좌평가테이블--
CREATE TABLE CLASSESTIMATE (
    estidx NUMBER(10) PRIMARY KEY,
    classidx NUMBER(10),
    idx NUMBER(10),
    estinum NUMBER(10) NOT NULL,
    esticon VARCHAR2(80) NOT NULL,
--FOREIGN KEY 설정 -- 
    CONSTRAINT fk_CLASS_classidx4 FOREIGN KEY(classidx) REFERENCES CLASS(classidx),
    CONSTRAINT fk_MEMBER1_idx4 FOREIGN KEY(idx) REFERENCES MEMBER1(idx)
)

--출결테이블--
CREATE TABLE RECORD (
    recordidx NUMBER(10) PRIMARY KEY,
    midx NUMBER(4),
    idx NUMBER(10),
    classidx NUMBER(10),
    recordtime NUMBER(10) NOT NULL,
    entirate NUMBER(10) NOT NULL,
    currate NUMBER(10) NOT NULL,
    status NUMBER(4) NOT NULL,
    attendate DATE DEFAULT SYSDATE NOT NULL,
    intime DATE DEFAULT SYSDATE NOT NULL,
    outtime DATE DEFAULT SYSDATE NOT NULL,
-- FOREIGN KEY 설정--
    CONSTRAINT fk_MEMBER1_midx2 FOREIGN KEY (midx) REFERENCES MEMBER(midx),
    CONSTRAINT fk_MEMBER1_idx5 FOREIGN KEY(idx) REFERENCES MEMBER1(idx),
    CONSTRAINT fk_CLASS_classidx5 FOREIGN KEY(classidx) REFERENCES CLASS(classidx)
)

--출결이슈테이블--
CREATE TABLE RECORDISSUE (
    issueidx NUMBER(4) PRIMARY KEY,
    idx NUMBER(10),
    issuestatus VARCHAR(10) NOT NULL,
    issuedivi VARCHAR(10) NOT NULL,
    appro NUMBER(1) DEFAULT 0 CHECK (APPRO IN(0, 1)), 
    filename VARCHAR(30) NOT NULL,
    reqdate DATE DEFAULT SYSDATE NOT NULL,
-- FOREIGN KEY 설정--
    CONSTRAINT fk_MEMBER1_idx6 FOREIGN KEY(idx) REFERENCES MEMBER1(idx)
)

--시험문제테이블--
CREATE TABLE TEST (
    testidx NUMBER(15) PRIMARY KEY,
    classidx NUMBER(10),
    num NUMBER(15) NOT NULL,
    exam NUMBER(15) NOT NULL,
    rightanswer VARCHAR2(15) NOT NULL,
    score NUMBER(10) NOT NULL,
-- FOREIGN KEY 설정--
    CONSTRAINT fk_CLASS_classidx6 FOREIGN KEY(classidx) REFERENCES CLASS(classidx)
) 

--학생시험정보테이블--
CREATE TABLE SANSWER ( 
    sansweridx NUMBER(15) PRIMARY KEY,
    classidx NUMBER(10),
    idx NUMBER(10),
    groupidx NUMBER(10),
    testidx NUMBER(15),
    sanswer VARCHAR2(15) DEFAULT '없음',
    yesorno NUMBER(1) DEFAULT 0 CHECK (YESORNO IN(0, 1)), 
    submit NUMBER(1) DEFAULT 0 CHECK (SUBMIT IN(0, 1)), 
-- FOREIGN KEY 설정--
    CONSTRAINT fk_CLASS_classidx7 FOREIGN KEY(classidx) REFERENCES CLASS(classidx),
    CONSTRAINT fk_MEMBER1_idx7 FOREIGN KEY(idx) REFERENCES MEMBER1(idx),
    CONSTRAINT fk_CLASSGROUP_groupidx4 FOREIGN KEY(groupidx) REFERENCES CLASSGROUP(groupidx),
    CONSTRAINT fk_TEST_testidx FOREIGN KEY(testidx) REFERENCES TEST(testidx)
)

--게시판테이블--
CREATE TABLE BOARD (
    boardidx NUMBER(15) PRIMARY KEY,
    membersort VARCHAR2(20),
    category VARCHAR2(20) NOT NULL,
    name VARCHAR2(10) NOT NULL,
    pwd VARCHAR2(20) NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    writedate DATE NOT NULL,
    readnum number(4) DEFAULT 0,
    ref NUMBER(4) DEFAULT 0,
    lev NUMBER(4) DEFAULT 0,
    sunbun NUMBER(4) DEFAULT 0,
    secret NUMBER(1) DEFAULT 0 CHECK (SECRET IN(0, 1)), 
-- FOREIGN KEY 설정--
    CONSTRAINT fk_MEMBER_membersort FOREIGN KEY(membersort) REFERENCES MEMBER(membersort)
) 


--각테이블 고유번호 시퀀스생성--
--midx는 숫자가 정해져있으므로 제외-- 
CREATE SEQUENCE sq_MEMBER1_idx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_MEMBER2_m2idx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_MEMBER3_m3idx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_CLASSGROUP_groupidx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_ITEM_itemidx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_CLASS_classidx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_CLASSDETIL2_weekidx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_CLASSDETIL_class2idx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_CLASSESTIMATE_estidx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_RECORD_recordidx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_RECORDISSUE_issueidx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_TEST_testidx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_SANSWER_sansweridx START WITH 1 INCREMENT BY 1

CREATE SEQUENCE sq_BOARD_boardidx START WITH 1 INCREMENT BY 1

