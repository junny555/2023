--SQL 학습하기
--1. DDL (테이블 조작 언어)
--1-1. 테이블 생성(create)
--형식 Create table 테이블 이름 (컬럼 데이터 타입 널 여부 (기본키나 기본값)
--);


CREATE TABLE member (
midx MEMBER NOT NULL PRIMARY KEY, --숫자형 기본키로 널 허용하지 않으며 다른 행과 구분하는 고유값이다.
memberld VARCHAR2(50) NOT NULL,
memberPwd VARCHAR2(50) NOT null,
memberName VARCHAR2(50) NOT null,
memberEmail VARCHAR2(50) NULL,
memberGender VARCHAR2(30) NULL,
memberAddr VARCHAR2(10) null,
memberBirth VARCHAR2(20) null,
delYN CHAR(1) DEFAULT 'N',
writeday DATE DEFAULT sysdate,
ip VARCHAR2(30) null
);