#뷰 만들기
# 2학년 학생의 데이터를 뽑아보자 (학번, 이름, 학년)
create view STNO ( snum, sname, sgrade )
as select num, name, grade
from student
where grade=2; 

select * from stno;
select snum, sname, sgrade
from stno
where sname= '허효선';

# 두 개의 테이블로 뷰 만들기 
#학생, 학과 테이블에서 전공이 시디나 컴공인 학생 이름, 학번, 학년, 학과명 뽑아내기
create view STDEP(snum,sname,sgrade,dname) #STDEP로 뷰 이름 지정/ (뷰의 컬럼)
as select s.num, s.name, s.grade, d.name 
from student s, department d # 원본테이블입력하고 뒤에 이름 지정
where s.dep=d.num and ( d.name like "컴퓨터%" or  d.name like "시각%"); 
drop view stdep;

select * from stdep;

#업데이트(원본 테이블의 기본키 必, 갱신하면 원본 테이블도 바뀜)
update stno set sgrade='2' where snum='2'; # 3학년으로 바꾸어라.

