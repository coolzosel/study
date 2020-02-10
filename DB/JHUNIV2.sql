CREATE database univ;
Use univ;

CREATE TABLE BD ( /*buliding*/
    bdno int,
    bdname varchar(4) not null,
    position int not null,
    primary key(bdno)     
);

CREATE TABLE MA ( /*major*/
    mano int,
    maname varchar(10),
    bd int, /*학과 건물*/
    primary key(mano),
    foreign key(bd) references BD(bdno) 
    on update cascade on delete cascade
);

CREATE TABLE PF ( /*professor*/
    pfno int,
    pfname varchar(4),
    P_jumin date,
    P_addr varchar(15), /*시군구까지*/
    ma int,
    primary key(pfno),
    foreign key(ma) references MA(mano)
    on update cascade on delete cascade
);

CREATE TABLE SUBJ ( /*subject*/
    subjno int,
    subjname varchar(15),
    pf int,
    bd int,
    need varchar(1) check(need in('O','X')) not null,
    primary key(subjno),
    foreign key(pf) references PF(pfno)
    on update cascade on delete cascade,
    foreign key(BD) references BD(bdno)
    on update cascade on delete cascade
);
    
CREATE TABLE ST ( /*student*/
    stno int,
    stname varchar(5),
    stgrade int check (stgrade in (1,2,3,4,5,6)) default 1,
    S_jumin date,
    S_addr varchar(15),
    ma int,
    primary key(stno),
    foreign key(ma) references MA(mano)
    on update cascade on delete cascade
);

CREATE TABLE CO ( /*course 수강내역 */
    st int, sub int,
    grade varchar(2) check(grade in('A','B','C','D','F')),
    retake varchar(1) check(retake in('Y','N')),
    primary key(st, sub),
    foreign key(st) references ST(stno)
    on update cascade on delete cascade,
    foreign key(sub) references SUBJ(subjno)
    on update cascade on delete cascade
);

DROP TABLE BD;  DROP TABLE MA;  DROP TABLE PF;  DROP TABLE SUBJ;  DROP TABLE ST;  DROP TABLE CO;
select * from BD; select * from MA; select * from PF; select * from SUBJ; select * from ST; select * from CO;
/* 건물 / 학과 / 교수 / 강의 / 학생 / 수강내역 */
select st.stname, ma.maname 
from st, ma
where st.ma=ma.mano; /*학생이름+학과이름*/




update MA set maname='사회복지학' where mano=301;
delete from st where stno=2017018;

/* 
1관1층-시각디자인학, 1관2층-산업디자인학, 1관3층-패션디자인학, 1관4층-영상디자인학, 1관5층-실내디자인학
2관1층-전기전자공학, 2관2층-화학공학, 2관3층-컴퓨터공학, 2관4층-기계공학, 2관5층-수학교육학
3관1층-사회복지학, 3관2층-노인복지학, 3관3층-간호학, 3관4층-유아교육학, 3관5층-생활체육학
4관1층-국어국문학, 4관2층-중어중문학, 4관3층-문예창작학 4관4층-역사학 4관5층-영어영문학 */

insert into BD values(1101,'1관',101); /*건물 고유번호-몇관+몇층+몇호 1*/ 
insert into BD values(2405,'2관',405); 
insert into BD values(3106,'3관',106); 
insert into BD values(1209,'1관',209); 
insert into BD values(2310,'2관',310); 
insert into BD values(4305,'4관',305); /*6*/ 
insert into BD values(2207,'2관',207);
insert into BD values(3509,'3관',509); 
insert into BD values(4505,'4관',505);
insert into BD values(4101,'4관',101);
insert into BD values(1503,'1관',503); /*11*/ 
insert into BD values(4412,'4관',412);
insert into BD values(3202,'3관',202);
insert into BD values(3306,'3관',306); 
insert into BD values(1410,'1관',410); 
insert into BD values(2105,'2관',105); /*16*/
insert into BD values(3401,'3관',401);
insert into BD values(1311,'1관',311); 
insert into BD values(4207,'4관',207); 
insert into BD values(2508,'2관',508);



insert into MA values(101,'시각디자인학',1101); /*학과 코드=학과실*/
insert into MA values(102,'산업디자인학',1209);
insert into MA values(103,'패션디자인학',1311);
insert into MA values(104,'영상디자인학',1410);
insert into MA values(105,'실내디자인학',1503); # 1관

insert into MA values(201,'전기전자공학',2105); 
insert into MA values(202,'화학공학',2207);
insert into MA values(203,'컴퓨터공학',2310);
insert into MA values(204,'기계공학',2405);
insert into MA values(205,'수학교육학',2508); # 2관

insert into MA values(301,'사회복지학',3106); 
insert into MA values(302,'노인복지학',3202); 
insert into MA values(303,'간호학',3306); 
insert into MA values(304,'유아교육학',3401); 
insert into MA values(305,'생활체육학',3509); # 3관

insert into MA values(401,'국어국문학',4101); 
insert into MA values(402,'중어중문학',4207);
insert into MA values(403,'문예창작학',4305);
insert into MA values(404,'역사학',4412);
insert into MA values(405,'영어영문학',4505); # 4관



insert into PF values(11,'이정화',931017,'서울시성동구',101); /*교수*/
insert into PF values(12,'김멍멍',800503,'서울시은평구',102);
insert into PF values(13,'권야옹',750312,'수원시팔달구',103);
insert into PF values(14,'박음메',860828,'강원강릉시',104);
insert into PF values(15,'김누누',890630,'성남시분당구',105);

insert into PF values(21,'왕재수',660000,'서울시땡땡구',201);
insert into PF values(22,'홍길동',840000,'경기땡땡구',202);
insert into PF values(23,'허효선',960000,'인천땡땡구',203);
insert into PF values(24,'노마진',590000,'서울땡땡구',204);
insert into PF values(25,'사차원',880000,'제주땡땡구',205);

insert into PF values(31,'이민지',970125,'서울시땡땡구',301);
insert into PF values(32,'김촐싹',770000,'경기시흥시',302);
insert into PF values(33,'이말랑',770000,'서울시땡땡구',303);
insert into PF values(34,'박준',770000,'대전땡땡구',304);
insert into PF values(35,'고만해',770000,'부산땡땡구',305);

insert into PF values(41,'박유나',770000,'인천땡땡구',401);
insert into PF values(42,'왕천재',770000,'서울시땡땡구',402);
insert into PF values(43,'강나라',770000,'서울시땡땡구',403);
insert into PF values(44,'한마음',770000,'경기과천시',404);
insert into PF values(45,'김지지',770000,'서울시땡땡구',405);



select BD.bdname, bd.position, ma.maname, bd.bdno
from bd,ma
where bd.bdno=ma.bd;         #건물위치-학과


insert into SUBJ values(1,'비주얼네러티브',11,1101,'o'); /*강의*/
insert into SUBJ values(2,'빙하에 대하여',12,1209,'x');
insert into SUBJ values(3,'복식문화사',13,1311,'o');
insert into SUBJ values(4,'모션그래픽스',14,1410,'o');
insert into SUBJ values(5,'디지털3D스케치',15,1503,'x');

insert into SUBJ values(6,'전자회로II',21,2105,'o');
insert into SUBJ values(7,'양자화학',22,2207,'o');
insert into SUBJ values(8,'객체지향프로그래밍',23,2310,'o');
insert into SUBJ values(9,'전산기계제도',24,2405,'o');
insert into SUBJ values(10,'확률과통계',25,2508,'x');

insert into SUBJ values(11,'행정과 법',31,3106,'x');
insert into SUBJ values(12,'사례관리론',32,3202,'x');
insert into SUBJ values(13,'간호학개론',33,3306,'o');
insert into SUBJ values(14,'가족관계론',34,3401,'o');
insert into SUBJ values(15,'트레이닝방법론',35,3509,'x');

insert into SUBJ values(16,'국문학입문',41,4101,'o');
insert into SUBJ values(17,'영화와윤리',42,4207,'x');
insert into SUBJ values(18,'대중문화예술론',43,4305,'o');
insert into SUBJ values(19,'한국과세계',44,4412,'o');
insert into SUBJ values(20,'영어회화I',45,4505,'o');



insert into ST values(2012139,'김재연',4,930506,'서울시금천구',201); /*학생*/ 
insert into ST values(2017018,'안동수',4,981110,'수원시팔달구',101); 
insert into ST values(2020104,'박지환',1,010829,'강원강릉시',301); 
insert into ST values(2019088,'도라희',2,981110,'서울시은평구',102); 
insert into ST values(2019121,'김왕장',2,000503,'서울시강남구',104); #

insert into ST values(2020152,'김반',1,010805,'수원시영통구',202); 
insert into ST values(2017103,'유바람',4,980913,'서울시강북구',401); 
insert into ST values(2016114,'강진혜',3,971209,'서울시광진구',304); 
insert into ST values(2018058,'김래영',3,990310,'서울시마포구',203); 
insert into ST values(2018093,'이두나',3,990715,'인천미추홀구',103); #

insert into ST values(2016140,'서만군',2,970405,'서울시성북구',105); 
insert into ST values(2019125,'김채린',2,000320,'서울시동작구',204); 
insert into ST values(2019049,'이윤아',2,000915,'강원춘천시',302); 
insert into ST values(2020116,'임매진',1,010928,'강원강릉시',402); 
insert into ST values(2018085,'황진',3,981110,'강원속초시',405); #

insert into ST values(2017035,'김진수',4,980613,'서울시봉천구',205); 
insert into ST values(2015119,'박윤',3,950914,'수원시권선구',303); 
insert into ST values(2018064,'이다정',2,990401,'수원시장안구',305); 
insert into ST values(2019058,'이대명',2,001122,'서울시동대문구',403); 
insert into ST values(2020122,'김혁',1,010624,'제주시애월읍',404); #


select ma.maname, ma.mano, subj.subjname, subj.subjno
from ma, subj
where ma.bd=subj.bd; /* 학과-과목 */


insert into co values(2012139,6,'A','N'); /*수강내역*/
insert into co values(2015119,13,'A','N');
insert into co values(2016114,14,'A','N');
insert into co values(2016140,5,'A','N');
insert into co values(2017018,1,'A','N');

insert into co values(2017035,10,'B','N');



select * from st order by stno desc, stgrade asc; #정렬 >> 검색 속도를 엄청 잡아먹기 때문에 꼭 필요할 때만 사용!
select stno as '학번', stname as '이름' from st order by stno asc; #이름변경
select distinct bdname as '건물명' from bd; #중복데이터 한 번만 검색
select stname, s_jumin, s_jumin + 10 from st; #데이터 사칙연산

select stno, stname, stgrade
from st
where stgrade >=2 and stgrade <=3; /* 비교연산자 2보다 같거나 큰, 3보다 같거나 작은 수를 도출 */



select stno, stname, stgrade
from st
where stgrade between 2 and 3; # 위의 비교연산자 구문과 결과 도출은 똑같으며 둘 중 편한 것으로 입력.


select bdname, bdno
from bd
where bdname = '1관' or bdname = '4관'; # 특정 키워드 검색

select bdname, bdno
from bd
where bdname IN('1관', '3관'); # 위보다 더 편하게 입력할 수 있는 법

select stno, stname
from st
where stname LIKE '김%'; #김씨만 검색 / 글자 수 제한하고 싶을 땐 언더바 1개가 1글자. '김_' = 김씨 성의 두 글자 이름만 도출

select stno, stname, stgrade
from st
where stgrade <3 and (stname LIKE '김%' or stname LIKE '박%'); #조건 2가지 거는 법, 먼저 처리하고 싶은 건 괄호넣기

create table BB(
    num int,
    name varchar(3),
    age int,
    primary key(num)
);

create table CC(
    num int,
    name varchar(3),
    age int,
    primary key(num)
);

create table AA(
    num int,
    name varchar(3),
    age int,
    primary key(num)
);

select num, name, age
from aa
where name LIKE '김_'
UNION
select num, name, age
from bb
where age >=15 and name LIKE '박%'; #합집합
select * from aa;
select * from cc;



select aa.num, aa.name, aa.age
from aa
inner join bb #aa
on aa.age=bb.age; #교집합

select num, name, age 
from aa
where aa.age NOT IN (select age from cc); #차집합

select num, LOWER(name)
from aa; #소문자 변환 출력

select num, UPPER(name)
from aa; #대문자 변환 출력

select num, LENGTH(name)
from bb; # 데이터 바이트 출력

select num, CHAR_LENGTH(name)
from bb; # 캐릭터 데이터 갯수 출력

select num, CONCAT(name, age)
from aa; # 데이터 합쳐서 출력

select stno,stname, 2020-SUBSTRING(s_jumin,1,4) as 나이
from st; # 보고싶은 데이터 뽑아내기

select num, INSTR(name,'k')
from aa; # k가 들어가는 데이터 위치 표기

select stno, LPAD(stname, 4, '#') as '이름'
from st; # 왼쪽에 문자추가

select stno, RPAD(stname, 4, '님 ') as '이름'
from st; # 오른쪽에 문자추가
 
select num, LTRIM(name)
from aa; # 왼쪽 공백 지우기

select num, RTRIM(name)
from aa; # 오른쪽 공백 지우기

select age, TRIM(LEADING '2' FROM age)
from aa; # 앞에서 '2'로 시작하는 데이터의 앞을 지워라

select age, TRIM(TRAILING '0' FROM age)
from aa; # 뒤에서 '2'로 끝나는 데이터의 끝을 지워라

select age, TRIM(BOTH '2' and '0' FROM age)
from aa; # 앞뒤로 해당하는 데이터를 지워라 = 2, 0

select st,
case grade
when 'A' then '최우수'
when 'B' then '우수'
when 'C' then '보통'
else '미달'
end as '학점'
from co;

select if(grade='A','우수','보통') as 성적 from co;

create table person(
	num int,
    name varchar(5),
    jumin char(14),
    primary key(num)
);

select * from person;

insert into person values(1,'김이박','951002-1254879');
insert into person values(2,'박이김','000813-4254879');
insert into person values(3,'이박김','880512-3254879');
insert into person values(4,'손지민','551223-2254879');




/* 문제 1. 주민번호로 성별을 출력해내라 */

select name,
case substring(jumin,8,1)
when '1' then '남자' when '3' then '남자'
when '2' then '여자' when '4' then '여자'
else '모름'
end as 성별
from person; # case문으로 성별 출력

select name, if(substring(jumin,8,1)='1' or substring(jumin,8,1)='3','남자','여자') as 성별 from person;
# if문으로 성별 출력


/* 문제 2. 점수를 학점으로 변환하여라 
100~90:A 
90~80:B 
80~70:C 
이하면 F */
select * from STU;

create table STU (
    num int,
    name varchar(4),
    grade int,
    primary key(num)
);

insert into STU values(1,'홍길동',67);
insert into STU values(2,'안재재',83);
insert into STU values(3,'구연아',100);
insert into STU values(4,'김소나',96);
insert into STU values(5,'이준',71);

select name,
if(grade between 90 and 100,'A',
	if(grade between 80 and 89,'B',
		if(grade between 70 and 79,'C','F')))as 학점 from STU;


/* 문제 3. 출생연도가 짝수면 건강검진 대상, 아니면 미대상 */
create table health(
    num int,
    name varchar(5),
    brithyear int(4),
    primary key(num)
);

insert into health values(1,'김이나',1994);
insert into health values(2,'홍길동',1953);
insert into health values(3,'강예지',1977);
insert into health values(4,'나은영',1991);
insert into health values(5,'박순철',1986);

select num, name, if(substring(brithyear,1,4)%2=0,'대상','미대상') as 건강검진 from health;


create table test(
    num int,
    name varchar(10),
    grade float,
    age int,
    primary key(num)
);

insert into test values(1,'멍멍',1.3,10); insert into test values(2,'야옹',1.8,13); 
insert into test values(3,'음메',1.3,20); insert into test values(4,'짹짹',1.3,17);

select num, REPLACE(name, '냐', '야') from test; #문자열에 바꾸고 싶은 것 지정해서 변경

select num, ROUND(grade,1) from test; # 소수점 뒷자리 반올림

select num, TRUNCATE(grade,1) from test; # 소수점 뒷자리 반내림

select num, MOD(age,2) from test; # 나누고 남은 나머지 구하기

select num, POW(num,2) from test; # 제곱

select num, now() from test; # 현재 시간 출력

select pfname,p_jumin, DATE_ADD(p_jumin, INTERVAL 5 DAY) from pf; # 5일 추가해서 출력
# second, minute, hour, day, week, month, year 시간개념의 함수들

select pfno, LAST_DAY(p_jumin) from pf; # 마지막 날 표기

select count(*) from st; # 열의 갯수

select sum(age), sum(num) from test; # sum = 더하기

select avg(age), avg(num) from test; # avg = 평균값

select min(grade) from stu; # 최소값 출력
select max(grade) from stu; # 최대값 출력

select * from stu;

select name, avg(math) from school_1
where sex='여'
group by name; # 그룹바이 / 지정해서 그룹핑한 데이터들의 값을 출력

/*
grade=학년 1학년 2학년 3학년
name   1학년   2학년    3학년
점수1 :  10    [10]    10
점수2 :  100   [100]   100
점수3 :  100   [100]   50


select grade_점수 from jumsu
	 ( [10], [100], [50] )
group by 2학년 */


create table school_1(
    num int,
    name varchar(5),
    bdate date,
    sex varchar(2),
    korea int,
    math int,
    primary key(num)
);

select num, avg(korea), avg(math) from school_1
where sex='남' 
group by num
having avg(korea) > 40; # having 해빙절, 국어의 평균 값에 조건(40보다 큰) 걸기

select * from st;

select stname, s_addr
from st
where S_addr = (select S_addr from st where stname='박윤'); # 박윤이란 이름을 가진 사람의 주소 검색>> 단일 서브쿼리 검색

select stname, s_addr
from st
where s_addr in (select s_addr from st where s_addr LIKE '서울%'); # 서울사는 사람 검색>> 다중 서브쿼리 검색
/* =과 in 사용 잘 구분해서 사용하기, =는 단일검색 in은 여러데이터 검색할 때 사용 

1. =는 where ( 나이 >= 20 )사용

2. in는 like '서울%' 사용 */

select stname, s_addr
from st
where (stname, s_addr) in
(select stname, s_addr from st where stname LIKE '김%'); # 두가지 항목에서 검색하고 싶을 때, 다중칼럼 서브쿼리

# >>>>>>>>>>>>>>>>서브 쿼리를 만들어서 메인 쿼리에 던져준다 



/*
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 학교 / 요구사항

<모든 엔티티들에 속성들을 설명>
장소-번호(고유),건물이름,상세위치 표기
학과-번호(고유), 학과명, 위치, 담당교수(외래) 표기
학생-학생들은 각자 학번(고유), 이름, 학년, 학과(외래), 주민번호, 주소를 저장
교수-교수는 번호(고유), 이름, 주민번호, 학과(외래), 주소를 저장
강의-번호(고유),이름,담당교수,장소,필수여부
      필수강의와 선택강의로 구분되며 필수강의는 모든 학생이 수강해야함
수강내역-학생번호+강의번호(고유),점수,재수강여부 표기


학과:교수 / 1:N  -> 하나의 학과에는 여러 교수가 소속될 수 있고 한명의 교수는 한 학과에만 소속되어야 한다.
학과:학생 / 1:N(전체참여) -> 한 명의 학생이 하나의 학과를 전공할 수 있으며, 하나의 학과에 여러 학생이 소속될 수 있다. 모든 학생은 하나 이상의 학과를 갖고 있어야 한다.
교수:강의 / 1:N  -> 한 명의 교수는 여러 강의를 지도할 수 있으며, 강의 하나에는 한 명의 교수만 지도할 수 있다.
학생:강의 / N:M -> 여러 학생이 여러 과목을 수강할 수 있다.
장소:강의 / 1:N -> 하나의 장소에 여러 강의가 정해질 수 있고 강의 하나에는 하나의 장소만 가질 수 있다.
장소:학과 / 1:1 -> 장소 하나에 한 학과를 가지며 한 학과도 장소 하나를 가진다.

 */
