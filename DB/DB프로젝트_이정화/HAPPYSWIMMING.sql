create database SWIM;
use SWIM;
-- drop database SWIM;

create table dept ( -- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 부서 정보
    num int,
    name varchar(10),
    primary key(num)
); -- 부서 이름 고민해보기. 안전팀 / 관리팀 / 지도팀


create table emp ( -- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 직원 정보
    num int, 
    name varchar(10),
    birthdate date,
    part varchar(10),
    hiredate date,
    dept int,
    primary key(num),
    foreign key(dept) references dept(num) 
    on delete cascade on update cascade
);


create table lesson ( -- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  강습
    num int,
    name varchar(10),
    s_time time,
    e_time time,
    primary key(num)
);

drop table class;
create table class ( -- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  강습반
    ecode int,
    lcode int,
    class varchar(3),
    primary key(ecode, lcode),
    foreign key(ecode) references emp(num) 
    on delete cascade on update cascade, 
    foreign key(lcode) references lesson(num) 
    on delete cascade on update cascade
);


create table smember ( -- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 회원
    num int,
    name varchar(10),
    birthdate date,
    sex varchar(1) check(sex in('여','남')),
    dia varchar(1) check(dia in('O','X')),
    tel varchar(13),
    primary key(num)
);
    

create table lesson_details ( -- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 수강내역
    mcode int, -- 회원번호
    lcode int, -- 강습번호
    s_date date,
    e_date date,
    primary key(mcode, lcode),
    foreign key(mcode) references smember(num)
    on delete cascade on update cascade,
    foreign key(lcode) references lesson(num) 
    on delete cascade on update cascade
);

create table locker ( -- >>>>>>>>>>락커
    num int,
    s_date date,
    e_date date,
    mcode int, -- 회원번호
    primary key(num),
    foreign key(mcode) references smember(num) 
    on delete cascade on update cascade
);
# 검색하기
select * from dept;
select * from emp;
select * from lesson;
select * from class;
select * from smember;
select * from lesson_details;
select * from locker;

# dept 데이터 삽입
insert into dept values (1,'관리팀');
insert into dept values (2,'안전팀');
insert into dept values (3,'지도팀');

# emp 데이터 삽입
insert into emp values (1,'박지환',900121,'강사',190618,3);
insert into emp values (2,'김다예',930107,'강사',191105,3);
insert into emp values (3,'이준희',870315,'강사',170321,3);
insert into emp values (4,'노은재',820429,'강사',150809,3);
insert into emp values (5,'고화연',930502,'강사',200112,3);
insert into emp values (6,'이선',891102,'가드',190718,2);
insert into emp values (7,'박다은',940708,'가드',181224,2);
insert into emp values (8,'마희영',860401,'가드',160927,2);
insert into emp values (9,'박혜진',900121,'데스크',181030,1);
insert into emp values (10,'김소희',900121,'데스크',170627,1);
insert into emp values (0,'이정화',931017,'센터장',150809,1);
insert into emp values (11,'김시원',900121,'강사',170627,3);
insert into emp values (12,'최우식',890516,'가드',180219,2);

delete from lesson;
# lesson 데이터 삽입 
insert into lesson values (11,'새벽1','06:00:00','06:50:00');
insert into lesson values (12,'새벽2','07:00','07:50');  -- 새벽수영 / 6시 ~ 7시 50분
insert into lesson values (21,'아침1','08:00','08:50');
insert into lesson values (22,'아침2','09:00','09:50'); -- 아침수영 / 8시 ~ 9시 50분
insert into lesson values (31,'오전1','10:00','10:50');
insert into lesson values (32,'오전2','11:00','11:50'); -- 오전수영 / 10시 ~ 11시 50분
insert into lesson values (41,'오후1','13:00','13:50');
insert into lesson values (42,'오후2','14:00','14:50');
insert into lesson values (43,'오후3','15:00','15:50'); -- 오후수영 / 13시 ~ 15시 50분
insert into lesson values (91,'자유1','16:00','16:50');
insert into lesson values (92,'자유2','17:00','17:50'); -- 자유수영 / 16시 ~ 17시 50분
insert into lesson values (51,'저녁1','18:00','18:50');
insert into lesson values (52,'저녁2','19:00','19:50'); -- 저녁수영 / 18시 ~ 19시 50분
insert into lesson values (61,'야간1','20:00','20:50'); -- 야간수영 / 20시 ~ 20시 50분

/*
수영 시간표 code
새벽 - 1_ / 6:00~6:50 / 7:00~7:50
아침 - 2_ / 8:00~8:50 / 9:00~9:50
오전 - 3_ / 10:00~10:50 / 11:00~11:50
오후 - 4_ / 13:00~13:50 / 14:00~14:50 / 15:00~15:50
자유수영 - 9_ / 16:00~16:50 / 17:00~17:50
저녁 - 5_ / 18:00~18:50 / 19:00~19:50 
야간 - 6_ / 20:00~20:50
*/

# class 데이터 삽입 
insert into class values (1,51,'초급');
insert into class values (1,52,'중급');
insert into class values (1,61,'상급');
insert into class values (1,41,'초급');
insert into class values (1,42,'중급');
insert into class values (1,43,'상급'); # 박지환

insert into class values (2,51,'중급');
insert into class values (2,52,'상급');
insert into class values (2,61,'초급');
insert into class values (2,41,'중급');
insert into class values (2,42,'상급');
insert into class values (2,43,'초급'); # 김다예

insert into class values (5,51,'상급');
insert into class values (5,52,'초급');
insert into class values (5,61,'중급');
insert into class values (5,41,'상급');
insert into class values (5,42,'초급');
insert into class values (5,43,'중급'); # 고화연 

insert into class values (3,11,'초급');
insert into class values (3,21,'중급');
insert into class values (3,31,'상급');
insert into class values (3,12,'상급');
insert into class values (3,22,'중급');
insert into class values (3,32,'상급'); # 이준희

insert into class values (4,11,'상급');
insert into class values (4,12,'중급');
insert into class values (4,31,'초급');
insert into class values (4,21,'상급');
insert into class values (4,22,'초급');
insert into class values (4,32,'초급'); # 노은재

insert into class values (11,11,'중급');
insert into class values (11,12,'초급');
insert into class values (11,32,'중급');
insert into class values (11,21,'초급');
insert into class values (11,22,'상급');
insert into class values (11,31,'중급'); # 김시원


# smember 데이터 삽입
insert into smember values (1,'허효선',19960505,'여','O','010-8888-7777');
insert into smember values (2,'이민지',19970125,'여','O','010-2511-7260');
insert into smember values (3,'황인기',19871005,'남','O','010-4182-5314');
insert into smember values (4,'신진혁',19920430,'남','X','010-8487-1257');
insert into smember values (5,'임성빈',19960610,'남','O','010-9452-5513');
insert into smember values (6,'김찬준',19900814,'남','X','010-8478-4474');
insert into smember values (7,'장승원',19851224,'남','O','010-4185-1127');
insert into smember values (8,'황진옥',19880319,'여','X','010-7742-4944');
insert into smember values (9,'주상현',19880917,'남','O','010-2351-4947');
insert into smember values (10,'신준석',19840408,'남','X','010-9875-0417');
insert into smember values (11,'김민성',19891203,'남','X','010-0516-7973');
insert into smember values (12,'이채원',19930108,'여','O','010-9300-0108');
insert into smember values (13,'박나래',19840915,'여','X','010-0249-7973');
insert into smember values (14,'오나미',19911103,'여','X','010-1567-3449');
insert into smember values (15,'한혜진',19820812,'여','X','010-9774-4112');
insert into smember values (16,'차은우',19950718,'남','X','010-9513-1081');
insert into smember values (17,'김유연',19930921,'여','X','010-8888-7777');
insert into smember values (18,'주현진',19930913,'여','X','010-8888-7777');
insert into smember values (19,'김한',19901008,'남','X','010-8888-7777');
insert into smember values (20,'박애린',19930618,'여','X','010-8888-7777');

update smember set tel='010-1577-1389' where num=17;
update smember set tel='010-5681-1764' where num=18;
update smember set tel='010-0396-4976' where num=19;
update smember set tel='010-6517-4997' where num=20;


# lesson_details 데이터 삽입
insert into lesson_details values (1,51,20200101,20200131);
insert into lesson_details values (1,52,20200101,20200131);
insert into lesson_details values (1,92,20200101,20200131);
insert into lesson_details values (2,61,20200101,20200131);
insert into lesson_details values (2,52,20200201,20200229);
insert into lesson_details values (2,11,20200201,20200229);
insert into lesson_details values (3,52,20200201,20200229);
insert into lesson_details values (3,41,20200201,20200229);
insert into lesson_details values (4,21,20200201,20200229);
insert into lesson_details values (4,22,20200201,20200229);
insert into lesson_details values (5,52,20200201,20200229);
insert into lesson_details values (6,61,20200101,20200131);
insert into lesson_details values (7,31,20200201,20200229);
insert into lesson_details values (8,21,20200201,20200229);
insert into lesson_details values (9,32,20200201,20200229);
insert into lesson_details values (10,12,20200201,20200229);
insert into lesson_details values (11,12,20200201,20200229);
insert into lesson_details values (11,61,20200201,20200229);
insert into lesson_details values (12,32,20200201,20200229);
insert into lesson_details values (13,41,20200201,20200229);
insert into lesson_details values (14,42,20200201,20200229);
insert into lesson_details values (14,92,20200201,20200229);
insert into lesson_details values (14,51,20200201,20200229);
insert into lesson_details values (15,43,20200201,20200229);
insert into lesson_details values (15,42,20200201,20200229);
insert into lesson_details values (16,43,20200201,20200229);
insert into lesson_details values (17,51,20200201,20200229);
insert into lesson_details values (18,52,20200201,20200229);
insert into lesson_details values (19,52,20200201,20200229);
insert into lesson_details values (19,61,20200201,20200229);
insert into lesson_details values (20,22,20200201,20200229);



# locker 데이터 삽입
insert into locker values (1,20200101,20200331,5);
insert into locker values (2,20191201,20200229,1);
insert into locker values (3,null,null,null);
insert into locker values (4,20200201,20200430,2);
insert into locker values (5,20200201,20200430,15);
insert into locker values (6,20191201,20200331,20);
insert into locker values (7,20200101,20200331,19);
insert into locker values (8,null,null,null);
insert into locker values (9,20200101,20200331,11);
insert into locker values (10,20200101,20200331,13);
insert into locker values (11,null,null,null);
insert into locker values (12,20191201,20200229,3); #
insert into locker values (13,20191201,20200229,16);
insert into locker values (14,20200201,20200430,4);
insert into locker values (15,20200101,20200331,8);
insert into locker values (16,20200101,20200331,9);
insert into locker values (17,20200201,20200430,14);
insert into locker values (18,20191201,20200229,17); #
insert into locker values (19,null,null,null);
insert into locker values (20,null,null,null);

-- delete from locker where num=1;




#락커테이블과 회원테이블을 조회해 락커번호와 락커 사용 회원 이름과 마감날짜를 출력하라
select L.num as 락커번호, M.name as 회원명, L.e_date as 마감날짜
from locker L, smember M where L.mcode=M.num;

#락커테이블과 회원테이블을 조회해 락커번호와 락커 사용 회원 이름과 마감날짜를 출력하라. 단, 사용하지 않는 락커도 같이 출력하라
select L.num as 락커번호, M.name as 회원명, L.e_date as 마감날짜
from locker L left outer join smember M on L.mcode=M.num;

#회원 테이블을 조회해 5월~7월에 태어난 회원의 이름, 성별, 연락처, 생년월일을 출력하라
select name as 이름, sex as 성별, tel as 연락처, birthdate as 생년월일
from smember
where substr(birthdate,7,1) between 5 and 7 
order by birthdate asc;

#부서테이블과 직원테이블을 조회해 부서명, 직원이름, 직원파트를 출력하라.
select d.name as 부서, e.name 이름, e.part as 담당
from dept d, emp e
where d.num=e.dept order by d.name asc;

#직원테이블에서 박씨 성을 가진 직원의 이름, 담당, 나이를 출력하라
select name as 이름, part as 담당, 2020-substr(birthdate,1,4)+1 as 나이
from emp
where name LIKE "박%";

# 강습테이블, 강습디테일 테이블을 이용해 야간강습을 수강하는 인원과 강습명을 출력
select L.name as 강습명, count(*) as 수강인원
from lesson_details LD, lesson L
where LD.lcode=L.num and L.name LIKE "야간%";

# 강습테이블, 강습디테일 테이블을 이용해 강습명과 수강인원을 출력.
select L.name as 강습명, count(*) as 수강인원
from lesson_details LD, lesson L
where LD.lcode=L.num
group by L.name;

#직원 테이블에서 박지환 강사보다 늦게 입사한 강사의 이름, 담당, 입사일을 출력하라
select name as 이름, part as 담당, hiredate as 입사일
from emp
where hiredate > (select hiredate from emp where name='박지환') and part= '강사';

#락커테이블과 회원테이블을 이용해 락커 사용이 이번 달 마감인 사람을 출력하라(2월 마감)
select l.num as 락커번호, m.name as 회원, l.e_date as 마감일
from locker l, smember m
where l.mcode=m.num and l.e_date = 20200229;

select l.num as 락커번호, m.name as 회원, l.e_date as 마감일
from locker l, smember m
where l.mcode=m.num and substr(l.e_date,7,1)=2;

#락커테이블과 회원테이블을 조회해 락커번호와 락커 사용 회원 이름과 연장신청 여부를 출력하라. 2월 달 마감인 사람은 신청 必 아닌 사람은 不
select L.num as 락커번호, M.name as 회원명, if(substr(l.e_date,7,1)=2,'必','不')as 연장신청
from locker L, smember M where L.mcode=M.num;

#직원테이블과 부서테이블을 이용해 부서별로 가장 나이가 많은 직원의 부서명, 이름, 담당, 나이를 출력하라
select d.name, e.name, e.part, 2020-substr(birthdate,1,4)+1 as 나이, birthdate
from emp e, dept d 
where d.num=e.dept 
and 2020-substr(e.birthdate,1,4) 
in(select max(2020-substr(p.birthdate,1,4)) from emp p, dept t where p.dept=t.num group by t.name)group by d.name; 
-- 왜 안되는지 모르겠음..ㅠㅠ..

#회원테이블을 조회해 할인여부 (복지할인, 여성할인) 할인받는 회원의 이름과 여부를 출력하라. 중복 할인은 할인률이 높은 것 기준으로 할인이 적용됨(복지할인 50%, 여성할인 20%)
select name as 회원명, 
    if(dia='O','복지할인',
        (if(2020-substr(birthdate,1,4) between 18 and 55,if(sex='여','여성할인','해당없음'),'해당없음')
	)
) as '할인대상 여부'
from smember;

#강습테이블과 반테이블과 직원테이블을 조회하여 강습명, 반 명, 강사 이름을 출력하라 
select L.name as 강습명, C.class as 반, emp.name as 강사
from class C inner join lesson L
on L.num=C.lcode
inner join emp
on emp.num=c.ecode
order by L.num asc, c.class desc;

 
# 회원테이블과 강습테이블과 강습디테일테이블을 조회해, 30세 이상의 회원의 이름과 나이, 강습명을 출력하라.
select m.name as 이름, 2020-substr(m.birthdate,1,4)+1 as 나이, l.name as 강습명
from smember m inner join lesson_details ld
on m.num=ld.mcode
inner join lesson L
on L.num=ld.lcode
where 2020-substr(m.birthdate,1,4)+1 >= 30 ;

#부서테이블과 직원테이블을 조회해 부서별 평균 나이를 출력
select d.name as 부서, round(avg(2020-substr(e.birthdate,1,4)+1),1) as '평균 나이'
from dept d, emp e
where e.dept=d.num
group by d.name;

#회원테이블을 조회해, 김씨 성을 가진 회원/ 26살이하이며 여성인 회원 이름, 나이, 성별을 합집합으로 출력
select name as 이름, sex as 성별, 2020-substr(birthdate,1,4)+1 as 나이
from smember m1
where m1.name LIKE '김%'
union
select name, sex, 2020-substr(birthdate,1,4)+1
from smember m2
where 2020-substr(m2.birthdate,1,4)+1 <= 26 and sex='여';



create index deptdex on dept(name);
create index empdex on emp(name,part,dept);
create index lessondex on lesson(name);
create index classdex on class(class);
create index memberdex on smember(name);
-- drop index deptdex; 
-- drop index empdex; 
-- drop index lessondex; 
-- drop index classdex; 
-- drop index memberdex; 

create user '정화'@'localhost' identified by '1017';
grant all privileges on *.* to '정화'@'localhost';
grant all privileges on swim.* to '정화'@'localhost';
drop user '정화'@'localhost';
# 권한 생성, 부여, 삭제
