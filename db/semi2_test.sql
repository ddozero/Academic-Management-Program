select * from class

String sql = "update clss set idx =?

select classidx, g.groupidx, g.groupname, classname, c.tname, entirescount, reqscount, to_char(comingdate, 'yyyy-mm-dd') as comingdate, to_char(enddate, 'yyyy-mm-dd') as enddate, entiredate, chargemname
from class c, classgroup g
where c.groupidx = g.groupidx 
order by classidx desc;


-- ���� ���� ��� classidx ��ȸ (�� / �׷� �����ؼ� ��ȸ��) 
select classidx, g.groupidx, g.groupname, classname, c.tname, entirescount, reqscount, to_char(comingdate, 'yyyy-mm-dd') as comingdate, to_char(enddate, 'yyyy-mm-dd') as enddate, entiredate, chargemname
from class c, classgroup g
where c.groupidx = g.groupidx and classidx = '8'
order by classidx desc;

-- ���� ���� ������Ʈ(groupidx�� ���������� �ؼ� ���̸� ��ȸ) 

update class set
groupidx = (select groupidx from classgroup where groupname = ?),
classname = ?, tname = ?, entirescount = ?, reqscount = ?, comingdate = to_date(?, 'yyyy-mm-dd'), enddate = to_date(?, 'yyyy-mm-dd'), entiredate = ?, chargemname = ?
where classidx = ?;


commit