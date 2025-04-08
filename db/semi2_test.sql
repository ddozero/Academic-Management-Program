select * from class
select * from CLASSDETIL
select * from classdetil2


String sql = "update clss set idx =?

select classidx, g.groupidx, g.groupname, classname, c.tname, entirescount, reqscount, to_char(comingdate, 'yyyy-mm-dd') as comingdate, to_char(enddate, 'yyyy-mm-dd') as enddate, entiredate, chargemname
from class c, classgroup g
where c.groupidx = g.groupidx 
order by classidx desc;


-- 강좌 개설 목록 classidx 조회 (반 / 그룹 조인해서 조회함) 
select classidx, g.groupidx, g.groupname, classname, c.tname, entirescount, reqscount, to_char(comingdate, 'yyyy-mm-dd') as comingdate, to_char(enddate, 'yyyy-mm-dd') as enddate, entiredate, chargemname
from class c, classgroup g
where c.groupidx = g.groupidx and classidx = '8'
order by classidx desc;


-- 강좌 개설 업데이트(groupidx를 서브쿼리로 해서 반이름 조회) 
update class set
groupidx = (select groupidx from classgroup where groupname = ?),
classname = ?, tname = ?, entirescount = ?, reqscount = ?, comingdate = to_date(?, 'yyyy-mm-dd'), enddate = to_date(?, 'yyyy-mm-dd'), entiredate = ?, chargemname = ?
where classidx = ?;



--세부 강좌 조회 (class/CLASSDETIL 조인)
select c.classidx, g.groupidx, g.groupname, c.classname, c.tname, c.entirescount, c.reqscount, to_char(c.comingdate, 'yyyy-mm-dd') as comingdate, to_char(c.enddate, 'yyyy-mm-dd') as enddate,
c.entiredate, c.chargemname, d.classintro
from class c, classgroup g, CLASSDETIL d
where c.groupidx = g.groupidx 
and c.classidx = d.classidx 
and c.classidx='1'
order by c.classidx asc;

--세부 강좌 등록
INSERT INTO CLASSDETIL VALUES (sq_CLASSDETIL_class2idx.nextval, 8, 1, '풀스택과정수정', '풀스택 과정 수정')



SELECT * FROM class WHERE tname = '김채현' 

commit