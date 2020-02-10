#인덱스 생성
CREATE INDEX STindex ON ST(stno,stname);

/*
외래키로 넣은 컬럼도 자동으로 인덱스 지정됨
인덱스 만들 컬럼에 중복된 값이 있으면 생성불가
유니크 속성의 컬럼 지정!
기본키는 인덱스로 이미 있기때문에 또 안만들어도 됨

Foreign Keys-외래키 컬럼 클릭하면 Target부분에
외래키가 어디로 연결되는지 확인 가능
*/

#인덱스 삭제
drop index STindex ON ST;

/*
1.문법 확인
2.메타데이터(시스템 카탈로그)
3.권한
4.실행계획(optimizer)
*/


/*
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 인덱스 요구사항

학생-학번과 이름으로 수강내역이나 학과를 검색한다.
학과-학과번호나 이름으로 교수나 과목을 검색한다.
교수-교수번호나 이름으로 과목이나 학과를 검색한다.
과목-과목번호나 이름으로 교수나 강의 장소를 검색한다.
수강내역-학번으로 자주 검색, 조회한다. >> 기본키
건물-건물번호(층+호)로 강의를 조회한다. >> 기본키

*/

select * from co;
create index STdex on ST(stname);
create index MAdex on MA(maname);
create index PFdex on PF(pfname);
create index SUBJdex on SUBJ(subjname);

