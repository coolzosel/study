CREATE DATABASE school;
use school;

CREATE TABLE department(
    depnum int,
    name varchar(10),
    position varchar(4),
    primary key(depnum)
);

CREATE TABLE professor(
    pronum int,
    name varchar(10),
    birthdate int,
    age int check(age>1 and age<100),
    dept int,
    primary key(pronum),
    foreign key(dept) references department(depnum)
    on delete cascade on update cascade
);

CREATE TABLE student(
    stnum int,
    name varchar(3),
    age int check(age>1 and age<100),
    grade int check(grade IN(1,2,3,4)),
    Pno int,
    Dno int,
    primary key(stnum),
    foreign key(Pno) references professor(pronum),
    foreign key(Dno) references department(depnum)  
    on delete cascade on update cascade
);

DROP TABLE department, professor; 
DROP TABLE student;

insert into department values(1,'시각디자인학','A동');
insert into department values(2,'산업디자인학','B동');
insert into department values(3,'컴퓨터공학','C동');
insert into department values(4,'사회복지학','D동');
insert into department values(5,'국어국문학','E동');

insert into professor values(12,'김나래',830608,38,2);
insert into professor values(35,'정지윤',651121,56,5);
insert into professor values(74,'김석훈',800729,41,1);
insert into professor values(22,'박소연',781003,43,3);
insert into professor values(60,'이혜민',710318,50,4);

insert into student values(2012,'이정화',28,4,74,1);
insert into student values(2019,'김다솔',21,2,60,4);
insert into student values(2015,'신래연',26,3,35,2);
insert into student values(2020,'박미나',20,1,35,5);
insert into student values(2014,'강훈',25,4,22,3);

SELECT professor.pronum, professor.name, department.name, department.position
FROM professor, department
WHERE professor.dept=DEPARTMENT.DEPNUM; /*교수-학과*/

SELECT student.stnum, student.name,student.grade, department.name, department.position
FROM student, department
WHERE student.dno=DEPARTMENT.DEPNUM; /*학생-학과*/

SELECT professor.name,professor.age, student.name, student.grade
FROM professor, student
WHERE professor.pronum=student.pno; /*교수-학생*/


select * from professor;
select * from department;
select * from student;

update professor set name = "김현지"
where pronum = 12;

update department set name = "노어노문학과"
where depnum = 5;

delete from department 
where depnum=2 and position='b동';
