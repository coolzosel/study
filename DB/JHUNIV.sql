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
    pfname int,
    P_jumin date,
    P_addr varchar(15), /*시군구까지*/
    ma int,
    primary key(pfno),
    foreign key(ma) references MA(mano)
    on update cascade on delete cascade
);

CREATE TABLE SUBJ ( /*subject*/
    subjno int,
    subjname varchar(8),
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
    grade varchar(2),
    retake varchar(1) check(retake in('Y','N')),
    primary key(st, sub),
    foreign key(st) references ST(stno)
    on update cascade on delete cascade,
    foreign key(sub) references SUBJ(subjno)
    on update cascade on delete cascade
);

DROP TABLE BD;  DROP TABLE MA;  DROP TABLE PF;  DROP TABLE SUBJ;  DROP TABLE ST;  DROP TABLE CO;
select * from BD; select * from MA; select * from PF; select * from SUBJ; select * from ST; select * from CO;

insert into BD values(1101,'1관',101); /*고유번호-몇관+몇층+몇호*/
insert into BD values(2205,'2관',205);
insert into BD values(2203,'2관',203);
insert into BD values(4102,'2관',1201);
insert into BD values(5,'1관',1101); 