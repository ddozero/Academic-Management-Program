--�л�������α׷� ���õ�����--
--INSERT �������(��->�Ʒ�) ���ּ���-- 


--1.ȸ�� �������̺�--
insert into MEMBER values(1,'server')
insert into MEMBER values(2,'student')
insert into MEMBER values(3,'teacher')
insert into MEMBER values(4,'manager') 

--2.ȸ�� ���̺�  
select * from member1 
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 1, '������', 'M', 'server',  '1234', '010-2222-2222', 'server@sys.com',  'õ��', TO_DATE('2000-05-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 2, '������', 'M', 'student', '1234', '010-2222-3333', 'student@sys.com', '����', TO_DATE('2000-12-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 3, 'ä����', 'F', 'teacher', '1234', '010-2222-4444', 'teacher@sys.com', '����', TO_DATE('1986-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 4, '�赵��', 'F', 'manager', '1234', '010-2222-5555', 'manager@sys.com', '����', TO_DATE('1990-11-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 2, '������', 'M', 'student2', '1234', '010-2222-6666', 'student2@sys.com', '�λ�', TO_DATE('1993-11-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 3, '��ä��', 'M', 'teacher2', '1234', '010-2222-7777', 'teacher2@sys.com', '����', TO_DATE('1980-11-12', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBER1 VALUES(sq_MEMBER1_idx.nextval, 4, '���ֿ�', 'F', 'manager2', '1234', '010-2222-8888', 'manager2@sys.com', '���', TO_DATE('1994-11-12', 'YYYY-MM-DD'), 1);

 
--3.�����̺�
INSERT INTO CLASSGROUP VALUES (sq_CLASSGROUP_groupidx.nextval, 2, 'A��', '�赵��', 'ä����', 20);
INSERT INTO CLASSGROUP VALUES (sq_CLASSGROUP_groupidx.nextval, 5, 'B��', '���ֿ�', '��ä��', 20); 


--4.���� ���̺�
INSERT INTO CLASS VALUES (sq_CLASS_classidx.nextval, 1, '�ڹ� �鿣��', 'ä����', 30, 25, TO_DATE('2025-03-01','YYYY-MM-DD'), TO_DATE('2025-07-30','YYYY-MM-DD'), TO_DATE('2025-08-01','YYYY-MM-DD'), '�赵��');
INSERT INTO CLASS VALUES (sq_CLASS_classidx.nextval, 2, '���̽� ����', '��ä��', 40, 30, TO_DATE('2025-04-01','YYYY-MM-DD'), TO_DATE('2025-08-30','YYYY-MM-DD'), TO_DATE('2025-09-01','YYYY-MM-DD'), '���ֿ�');

--5.�л� ���λ��� ���� ��
INSERT INTO MEMBER2 VALUES(sq_MEMBER2_m2idx.nextval, 2, 1, '�з�None', '�ڰ���None', '���None', 'Ư�̻���None', '�̹������None');
INSERT INTO MEMBER2 VALUES(sq_MEMBER2_m2idx.nextval, 5, 2, '�з�None', '�ڰ���None', '���None', 'Ư�̻���None', '�̹������None');

--6.�Ŵ���/���� ���λ��� ���̺� 
INSERT INTO MEMBER3 VALUES(sq_MEMBER3_m3idx.nextval, 3, 1, 1, '����', '���� ��� 5��', TO_DATE('2025-03-01','YYYY-MM-DD'), '�ڹ� �鿣��', 'A��', '������', 'teacher.jpg');
INSERT INTO MEMBER3 VALUES(sq_MEMBER3_m3idx.nextval, 6, 2, 2, '�ڻ�', '���� ��� 8��', TO_DATE('2025-04-01','YYYY-MM-DD'), '���̽� ����', 'B��', '������', 'teacher2.jpg');

--7.��ǰ ���̺� 
INSERT INTO ITEM VALUES (sq_ITEM_itemidx.nextval, 1, '��Ʈ��', 1000000, 15);
INSERT INTO ITEM VALUES (sq_ITEM_itemidx.nextval, 1, 'å��', 50000, 10);
INSERT INTO ITEM VALUES (sq_ITEM_itemidx.nextval, 2, '��Ʈ��', 1000000, 15);
INSERT INTO ITEM VALUES (sq_ITEM_itemidx.nextval, 2, 'å��', 50000, 10);

--8.�������̺�
INSERT INTO CLASSDETIL2 VALUES (sq_CLASSDETIL2_weekidx.nextval, 1, 1,'����','�ڹ�OT', '2025-03-01 ~ 2025-03-07');
INSERT INTO CLASSDETIL2 VALUES (sq_CLASSDETIL2_weekidx.nextval, 1, 2,'����','�ڹ� ����', '2025-03-01 ~ 2025-03-07');
INSERT INTO CLASSDETIL2 VALUES (sq_CLASSDETIL2_weekidx.nextval, 2, 1,'����','���̽�OT', '2025-03-01 ~ 2025-03-07');
INSERT INTO CLASSDETIL2 VALUES (sq_CLASSDETIL2_weekidx.nextval, 2, 2,'����','���̽� ����', '2025-03-01 ~ 2025-03-07'); 

--9.���� ���λ��� ���� 
INSERT INTO CLASSDETIL VALUES (sq_CLASSDETIL_class2idx.nextval, 1, 1, '�ڹ� �鿣��', '�ڹ� �Ұ� �� ���� ȯ�� ����');
INSERT INTO CLASSDETIL VALUES (sq_CLASSDETIL_class2idx.nextval, 2, 1, '���̽� ����', '���̽� �Ұ��� ���� ȯ�� ����');

--10.���� �� ���̺� 
INSERT INTO CLASSESTIMATE VALUES (sq_CLASSESTIMATE_estidx.nextval, 1, 2, 5, '���ƿ�');
INSERT INTO CLASSESTIMATE VALUES (sq_CLASSESTIMATE_estidx.nextval, 2, 5, 3, '�Ⱦ��');

--11.��� ���̺� 
INSERT INTO RECORD VALUES (sq_RECORD_recordidx.nextval, 2, 3, 1, 1, 100, 100, 1, SYSDATE, SYSDATE, SYSDATE);
INSERT INTO RECORD VALUES (sq_RECORD_recordidx.nextval, 3, 6, 2, 1, 100, 100, 1, SYSDATE, SYSDATE, SYSDATE);

--12.��� �̽� ���̺� 
INSERT INTO RECORDISSUE VALUES (sq_RECORDISSUE_issueidx.nextval, 2, '����', '������', 0, 'late.pdf', SYSDATE);

--13.���� ���� ���̺� 
INSERT INTO TEST VALUES (sq_TEST_testidx.nextval, 1, 1, '1+1=?', '2', 10);
INSERT INTO TEST VALUES (sq_TEST_testidx.nextval, 2, 1, '2+2=?', '4', 10);

--14.�л��������� ���̺� 
INSERT INTO SANSWER VALUES (sq_SANSWER_sansweridx.nextval, 1, 2, 1, 1, '2', 1, 1);
INSERT INTO SANSWER VALUES (sq_SANSWER_sansweridx.nextval, 2, 5, 2, 2, '4', 1, 1);

--15.�Խ��� ���̺�
INSERT INTO BOARD VALUES (sq_BOARD_boardidx.nextval, 'manager', '��������', '�赵��', '1234', '�������� 3�� 1���Դϴ�.', SYSDATE, 0, 0, 0, 0, 0);