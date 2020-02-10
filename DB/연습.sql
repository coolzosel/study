CREATE database training;
use training;


create table t1(
    no varchar(1),
    name varchar(3),
    num int,
    primary key(no)
);

create table t2(
    no varchar(1),
    DB varchar(10),
    primary key(no)
);

insert into t1 values('A','AAA',111);
insert into t1 values('B','AAB',112);
insert into t1 values('C','AAC',121);
insert into t1 values('D','ABA',132);
insert into t1 values('E','ABB',123);

insert into t2 values('A','Hi');
insert into t2 values('B','This is');
insert into t2 values('C','Hello world');

select t1.no, t1.name, t1.num, t2.DB
from t1 inner join t2
on t1.no = t2.no; # 이너 조인

select t1.no, t1.name, t1.num, t2.DB
from t1 left outer join t2
on t1.no = t2.no; # 레프트 아우터 조인, 왼쪽 테이블을 기준으로 매칭 출력

select t1.no, t1.name, t1.num, t2.DB
from t1 right outer join t2
on t1.no = t2.no; # 라이트 아우터 조인, 오른쪽 테이블을 기준으로 매칭 출력

select t1.no, t1.name, t1.num, t2.DB
from t1 left outer join t2
on t1.no = t2.no
UNION
select t1.no, t1.name, t1.num, t2.DB
from t1 right outer join t2
on t1.no = t2.no; # 레프트, 라이트 아우터 조인을 유니온해서 풀 아우터 조인

/*
이너조인은 null을 가진 것을 안보이게 매핑
아우터조인은 null을 가진 것도 같이 나타나게 매핑
*/