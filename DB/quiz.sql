create database QUIZ;
use QUIZ;

create table student(
    num int, #학번
    name varchar(10),
    age int,
    height int, #키
    grade int check(grade in(1,2,3,4,5,6)),
    primary key(num)
);

drop table student;

insert into student values (1,'이정화',28,164,3);
insert into student values (2,'허효선',25,158,2);
insert into student values (3,'이민지',24,152,1);
insert into student values (4,'임성빈',25,170,2);
insert into student values (5,'황인기',25,190,2);


#키가 160 ~ 170 사이인 학생의 이름, 학번, 키를 검색하세요
select name as 이름, num as 학번, height as 키 from student
where height between 160 and 170;

#학년이 2학년, 4학년 학생의 이름, 학번, 학년 검색
select name as 이름, num as 학번, grade as 학년 from student
where grade in(2,4);

#성이 '이'씨인 학생의 이름, 학번을 검색
select name as 이름, num as 학번 from student
where name LIKE '이%';

#나이가 20살 이상이거나 학년이 2학년 이하인 학생의 이름, 학번, 나이, 학년 검색
select name as 이름, num as 학번, age as 나이, grade as 학년 from student
where age >= 20 or grade <= 2; 

#학생 테이블에 아이디, 주민번호 컬럼 추가 : 기존 학생 테이블에 추가된 아이디, 주민번호 컬럼 데이터 입력
alter table student add id varchar(10);
alter table student add jumin char(14);
update student set id='jh93' where num=1;
update student set jumin='931017-2000000' where num=1;
update student set id='SUNNY' where num=2;
update student set jumin='960505-2000000' where num=2;
update student set id='Ming97' where num=3;
update student set jumin='970125-2000000' where num=3;
update student set id='BINsss' where num=4;
update student set jumin='960812-1000000' where num=4;
update student set id='INgistar' where num=5;
update student set jumin='960307-1000000' where num=5;

select * from student;

#학생의 이름, 학번, 아이디 검색, 이 때 아이디는 모두 대문자로 출력
select name as 이름, num as 학번, upper(id) as ID from student;

#8월에 태어난 학생의 이름, 학번, 생년월일을 검색
select name as 이름, num as 학번, substring(jumin,1,6) as 생년월일
from student where substring(jumin,4,1)=8;

#학생테이블에 전화번호 컬럼 추가 -> ex:031)444-3615 or 02, 035... 등
alter table student add cal varchar(13);
update student set cal='02)2295-9479' where num=1;
update student set cal='032)555-1354' where num=2;
update student set cal='031)9551-2229' where num=3;
update student set cal='02)1135-7910' where num=4;
update student set cal='043)851-1105' where num=5;

#학생의 이름, 학번, 지역정보 검색 : 지역정보는 전화번호의 앞자리 이용 ex) 02:서울, 031:경기도
select name as 이름, num as 학번, 
if(substr(cal,1,3)='032','인천', if(substr(cal,1,3)='031','경기', if(substr(cal,1,3)='043','충북','서울')))
as 지역 from student; 
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> if문
select name as 이름, num as 학번,
case substr(cal,1,3)
when '032' then '인천'
when '031' then '경기'
when '043' then '충북'
else '서울'
end as 지역
from student; 
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> case문

select name as 이름, num as 학번,
case substr(cal,1,instr(cal,')')-1)
when '02' then '서울'
when '032' then '인천'
when '031' then '경기'
when '043' then '충북'
else '알수없음'
end as 지역
from student; 

select cal, instr(cal,')') from student; 

#교수테이블 생성, 데이터 입력
create table professor(
    num int, #교수번호
    name varchar(10),
    pay int, #연봉
    dpcode int, #학과코드
    primary key(num)
);

insert into professor values (1,'김멍멍',3500,10);
insert into professor values (2,'권야옹',3650,11);
insert into professor values (3,'이개굴',4100,12);
insert into professor values (4,'박음메',2850,13);
insert into professor values (5,'김꿀꿀',3700,14);


#교수 테이블에서 이름, 교수번호, 학과 이름을 출력 : 학과 이름은 학과 코드를 이용
select name as 이름, num as 교수번호,
case dpcode
when 10 then '시각디자인학과'
when 11 then '컴퓨터공학과'
when 12 then '사회복지학과'
when 13 then '수학과'
when 14 then '국어국문학과'
else NULL
end as 학과
from professor;

#교수 테이블에서 이름, 교수번호, 직급을 출력 : 직급은 연봉에 따라 3000미만은 조교수, 3000이상 5000이하는 부교수, 5000초과는 정교수
select name as 이름, num as 교수번호,
if(pay < 3000,'조교수',if(pay >= 3000 and pay <= 5000,'부교수','정교수')) as 직급
from professor;

#교수 테이블에 직급 컬럼 추가
alter table professor add rank_ varchar(10);
update professor set rank_='부교수' where num=1;
update professor set rank_='정교수' where num=2;
update professor set rank_='부교수' where num=3;
update professor set rank_='조교수' where num=4;
update professor set rank_='부교수' where num=5;

#직급별 교수의 평균 연봉 검색
select rank_ as 직급, round(avg(pay),0) as 평균연봉
from professor
group by rank_;

select * from professor;


#학과코드별 교수의 평균 연봉 검색, 단 평균 연봉이 3000 이상인 학과만 검색
select dpcode as 학과코드, round(avg(pay),0) as 평균연봉
from professor 
group by dpcode
having avg(pay) >= 3000; 

select 
case dpcode
when 10 then '시각디자인학과'
when 11 then '컴퓨터공학과'
when 12 then '사회복지학과'
when 13 then '수학과'
when 14 then '국어국문학과'
else NULL
end as 학과,
round(avg(pay),0) as 평균연봉
from professor 
group by dpcode ;/*
having avg(pay) >= 3000; # >>>>>>>>>>>>>>> 학과 이름 입력한 버전 */

#학과 테이블 생성 후, 데이터 5개 입력
create table department (
    num int,
    name varchar(15),
    position varchar(10),
    cal varchar(15),
    primary key(num)
);

select * from department;

insert into department values (1,'시각디자인학과','5관101호','02-5212-0312');
insert into department values (2,'컴퓨터공학과','3관201호','010-7300-0502');
insert into department values (3,'사회복지학과','2관101호','02-6392-0955');
insert into department values (4,'수학과','1관302호','010-6695-8547');
insert into department values (5,'국어국문학과','4관102호','02-1004-1234');

#학생 테이블과 학과 테이블을 외래키로 연결 
alter table student add dep int;
alter table student add foreign key(dep) references department(num) on delete cascade on update cascade;

#학생 테이블과 교수 테이블을 외래키로 연결
alter table student add pf int;
alter table student add foreign key(pf) references professor(num) on delete cascade on update cascade;

update student set dep=1, pf=1 where num=1;
update student set dep=2, pf=2 where num=2;
update student set dep=3, pf=3 where num=3;
update student set dep=4, pf=4 where num=4;
update student set dep=5, pf=5 where num=5; #데이터 삽입


#학생 테이블과 학과 테이블을 이용해 학생 이름, 학과번호, 학과 이름 검색 /  이너조인
select student.name as 학생, student.dep as 학과코드, department.name as 학과명
from student
inner join department
on student.dep=department.num;


#학생 테이블과 교수 테이블을 이용해 학생 이름, 교수번호, 교수 이름 검색
select student.name as 학생, student.pf as 교수번호, professor.name as 교수
from student
inner join professor
on student.pf=professor.num;

#고객 테이블 생성
create table guest (
    num int,
    name varchar(10),
    point int, #포인트(점수)
    Tel varchar(14),
    primary key(num)
);    
insert into guest values (1,'고양이',9000,'010-7777-7777');
insert into guest values (2,'강아지',4500,'010-2222-7777');
insert into guest values (3,'개구리',3600,'010-7857-1177');
insert into guest values (4,'송아지',1800,'010-9871-2557');
insert into guest values (5,'코끼리',6800,'010-0267-8547');


#사은품 테이블 생성
create table gift (
    num int,
    name varchar(10),
    min int, #포인트하한값
    max int, #포인트상한값
    primary key(num)
);
select*from gift;
insert into gift values (1,'노트북',9000,12000);
insert into gift values (2,'로봇청소기',7000,8999);
insert into gift values (3,'도서상품권(15만)',5000,6999);
insert into gift values (4,'치약세트',1000,2999);
insert into gift values (5,'침구세트',3000,4999);

select * from gift order by min asc; #포인트 작은 순으로 사은품 정렬

#각 고객이 가지고 있는 포인트 별로 받을 수 있는 사은품을 검색
select guest.name as 고객명, guest.point as 보유포인트, gift.name as 사은품
from guest inner join gift
on guest.point >= gift.min and guest.point <= gift.max
order by point asc; #보유포인트 작은 순대로 정렬하기

select guest.name as 고객명, guest.point as 보유포인트, gift.name as 사은품
from guest
inner join gift
on guest.point between gift.min and gift.max 
order by point asc;

#각 고객에게 제공해야하는 상품마다 필요한 수량 검색 / 그룹바이로 상품 묶고 갯수 출력
select gift.name as 사은품, count(guest.name) as 제공수량
from gift inner join guest
on guest.point between gift.min and gift.max 
group by gift.name;

select gift.name as 사은품, count(guest.name) as 제공수량
from gift left outer join guest
on guest.point between gift.min and gift.max 
group by gift.name; # 해당되는 컬럼 없는 걸 출력하고 싶을 때는 아우터 조인으로 출력

#학생테이블에 영어 점수, 수학 점수 컬럼 추가, 데이터 입력
alter table student add Eng int;
alter table student add Math int;
update student set Eng=78, Math=89 where num=1;
update student set Eng=86, Math=94 where num=2;
update student set Eng=100, Math=79 where num=3;
update student set Eng=68, Math=99 where num=4;
update student set Eng=53, Math=94 where num=5;

#학점 테이블 생성 후, 데이터 입력
create table grade (
	class char(1) check (class in('A','B','C','D','F')),
    min int,
    max int,
    primary key(class)
);
insert into grade values ('A',90,100);
insert into grade values ('B',80,89);
insert into grade values ('C',70,79);
insert into grade values ('D',60,69);
insert into grade values ('F',0,59);


#각 학생의 영어, 수학, 과목 학점을 검색
select student.name as 이름, student.eng as 영어점수, EN.class as 학점, student.math as 수학점수, MATH.class as 학점
from student inner join grade EN # 띄어쓰기하고 입력해주면 조인의 이름 지정됨
on student.eng between EN.min and EN.max
inner join grade MATH
on student.math between MATH.min and MATH.max;

select student.name as 이름, student.eng as 영어점수, EN.grade, MATH.grade
from student, grade as EN as MATH
where student.math between grade.min and grade.max; #??????????????????????이너조인 안쓰고 출력하기... 다시 해보기


#학생 테이블과 교수 테이블을 이용하여 학생 이름, 교수 이름 검색. 단, 지도교수가 결정되지 않은 학생도 출력
select student.name as 학생, professor.name as 교수
from student left outer join professor
on student.pf = professor.num;

#학생 테이블과 교수 테이블을 이용하여 학생 이름, 교수 이름 검색. 단, 지도학생이 배정되지 않은 교수도 출력
select student.name as 학생, professor.name as 교수
from student right outer join professor
on student.pf = professor.num;

#학생 테이블과 학과 테이블을 이용, 이정화 학생과 학과가 동일한 학생의 이름과 학과 이름을 검색 / 단일 서브쿼리
select student.name, department.name # 학생 이름과 학과 이름 보여줘
from student, department # 테이블 연결
where student.dep = department.num # 학생번호=학과번호가 같게 출력해줘
and student.dep = #학과번호(외래키)는 이정화의 학과번호(외래키)와 같게 출력해줘
(select student.dep from student where student.name= '이정화'); 

select * from student;
select * from department;


#교수 테이블에 입사일자 컬럼을 추가
alter table professor add pdate date;
update professor set pdate=19990313 where num=1;
update professor set pdate=20080612 where num=2;
update professor set pdate=20101026 where num=3;
update professor set pdate=20010817 where num=4;
update professor set pdate=20030108 where num=5;

#교수 테이블에서 김꿀꿀 교수보다 나중에 입사한 사람의 교수 이름과 학과 이름 검색
select professor.name as 교수, department.name as 학과, professor.pdate as 입사일
from professor, department
where professor.dpcode=department.num 
and professor.pdate > (select pdate from professor where name = '김꿀꿀');


select professor.name as 교수, department.name as 학과, professor.pdate as 입사일
from professor, department where substr(professor.dpcode,2,1)+1=department.num ;
# >>>>>>>>>>>>>>>>>> 교수 - 학과 검색

#교수 테이블에서 부교수 직급의 최소 연봉자보다 연봉이 높은 사람의 이름, 직급, 연봉 검색 / 단일서브쿼리 + 최소값
select name as 이름, rank_ as 직급, pay as 연봉
from professor
where pay > (select min(pay) from professor where rank_='부교수');

select * from professor ;
select*from student;
select*from department;

update professor set dpcode=1 where num=1 or num=2;
update professor set dpcode=3 where num=3;
update professor set dpcode=4 where num=4;
update professor set dpcode=5 where num=5;

#학생 테이블에서 각 학년 별로 최대 나이를 가진 학생의 학년, 이름, 나이 검색
select grade as 학년, name as 나이, age
from student
where age in (select max(age) from student group by grade);
# 단일 서브쿼리는 =, in 둘 다 사용 가능 BUT 다중(복합) 서브쿼리는 in만 사용 가능. 출력 결과를 여러 개 하고 싶을 경우는 in 사용.

#교수 테이블에서 학과 별로 입사일이 가장 오래된 교수의 교수 이름, 학과 명 검색 / 이너조인 or 프롬 테이블2
select d.name as 학과, p.name as 교수, p.pdate as 입사일
from professor p, department d 
where p.dpcode=d.num 
and p.pdate in (select min(pdate) from professor, department group by department.name) 
;

select b.name as 학과, a.name as 교수, a.pdate as 입사일
from professor a, department b
where a.dpcode=b.num and a.pdate in 
(select min(p.pdate)
from professor p, department d
where p.dpcode=d.num
group by d.name); # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 값 제대로 추출한 명령문

select b.name, a.name, a.pdate
from professor a
JOIN DEPARTMENT b
ON a.dpcode = b.num
group by b.name
having min(pdate);



select d.name, p.name, p.pdate 
from professor p, department d
where p.dpcode=d.num 
and p.pdate in (select min(pdate) from professor group by pdate); #서브쿼리해보기 안돼...ㅠㅠ


select min(p.pdate)
from professor p, department d
where p.dpcode=d.num
group by d.name;

select d.name, p.name as "이름", min(p.pdate)
from professor p, department d
where p.dpcode=d.num
group by p.rank_;


select d.name, p.name as "이름", min(p.pdate)
from professor p, department d
group by d.name;

select d.name, p.name, p.pdate
from professor p, department d
where p.dpcode=d.num group by d.name 
having p.pdate in (select min(pdate) from professor);
