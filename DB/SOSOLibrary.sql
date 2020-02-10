CREATE DATABASE shop;
use shop;
CREATE TABLE BOOK_info (    /*도서정보*/
    Bookno INT(8),
    Title VARCHAR(50),
    Writer VARCHAR(50),
    Publisher VARCHAR(50),
    Zone VARCHAR(50),
    PRIMARY KEY(Bookno),
    FOREIGN KEY(Zone) REFERENCES LOCATION_info(Zone)
);
    
CREATE TABLE MEMBER_info (    /*회원정보*/
	Memberno INT(10),
    name VARCHAR(30),
    Phone INT(11),
    Address VARCHAR(30),
    PRIMARY KEY(Memberno)
);

CREATE TABLE STAFF_info (    /*직원정보*/
	Staffno INT(4),
    Name VARCHAR(50),
    Position VARCHAR(50),
    Hiredate DATE,
    Zone VARCHAR(50),
    PRIMARY KEY(Staffno)
);

CREATE TABLE LOCATION_info (    /*위치정보*/
	Zone VARCHAR(50),
    Floor VARCHAR(10),
    Name VARCHAR(50) not null unique,
    Category VARCHAR(50) unique,
    PRIMARY KEY(Zone)
); 

CREATE TABLE RENT_Info (    /*대여정보*/
	Bookno INT(10),
	Memberno INT(10),
    RentD DATE,
    ReturnD DATE,
    PRIMARY KEY(Bookno, Memberno)
);

CREATE TABLE User (
    User_ID VARCHAR(50),
    Password VARCHAR(50),
    Name VARCHAR(50),
    EMaill VARCHAR(50),
    Phone VARCHAR(50),
    Address VARCHAR(50),
    PRIMARY KEY(User_ID)
);

CREATE TABLE EMPLOYEE (
    EMPNO INT(10),
    EMPNAME VARCHAR(10),
    DNO INT(2),
    PRIMARY KEY(EMPNO),
    FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DEPTNO)
);

CREATE TABLE DEPARTMENT (
    DEPTNO INT(2),
    DEPTNAME VARCHAR(10),
    FLOOR INT(10),
    PRIMARY KEY(DEPTNO)
);

DROP TABLE BOOK_info;
DROP TABLE MEMBER_info;
DROP TABLE RENT_info;
DROP TABLE LOCATION_info;
DROP TABLE STAFF_info;
DROP TABLE User;
DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;

ALTER TABLE BOOK_info ADD Price int(10);
ALTER TABLE BOOK_info DROP Price;
ALTER TABLE BOOK_info MODIFY Price VARCHAR(10);

DESC BOOK_info;

insert into employee values(1014,'박나윤',1);
insert into employee(empno, dno) values(1012,3);

delete from employee;
delete from employee
where empno = 1012;

update employee set dno = 3
where empno=1017;
