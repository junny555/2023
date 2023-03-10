/*
--SQL 학습하기
--1. DDL (테이블 조작 언어)
--1-1. 테이블 생성(create)
--형식 Create table 테이블 이름 (컬럼 데이터 타입 널 여부 (기본키나 기본값)
--);


CREATE TABLE member (
midx number NOT NULL PRIMARY KEY, --숫자형 기본키로 널 허용하지 않으며 다른 행과 구분하는 고유값이다.
memberld VARCHAR2(50) NOT NULL,
memberPwd VARCHAR2(50) NOT null,
memberName VARCHAR2(50) NOT null,
memberEmail VARCHAR2(50) NULL,
memberGender VARCHAR2(30) NULL,
memberAddr VARCHAR2(10) null,
memberBirth VARCHAR2(20) null,
delYN CHAR(1) DEFAULT 'N',
writeday DATE DEFAULT SYSDATE,
ip VARCHAR2(30) null
);
--테이블삭제
DROP TABLE member;
DROP TABLE member1230;


CREATE TABLE member1230(
midx NUMBER NOT NULL PRIMARY KEY,
memberID VARCHAR2(50)NOT NULL,
memberPwd VARCHAR2(50)NOT NULL,
memberName VARCHAR2(50) NOT NULL,
		memberEmail VARCHAR2(50),
		memberGender VARCHAR2(30),
		memberAddr VARCHAR2(10),
		memberBirth VARCHAR2(20),
		delYn CHAR(1) DEFAULT 'N',
		writeday DATE DEFAULT SYSDATE,
		ip VARCHAR2(30) NULL
);

--테이블 변경
--ALTER TABLE 테이블 이름 키워드 (ADD, MODIFY) 컬럼 데이터 타입 널 여부 기본값;
ALTER TABLE member1230 MODIFY memberGender VARCHAR2(10);

--테이블 컬럼 삭제
ALTER TABLE member1230 DROP COLUMN ip;

--테이블 컬럼 추가
ALTER TABLE member1230 ADD ip VARCHAR(30);



--2  테이터 조작하기 (DML) -select insert update delete 구문
--데이터 입력하기
--형식 INSERT INTO 테이블 이름 (컬럼,컬럼,컬럼,컬럼) values('값', '값','값','값');
INSERT INTO member1230(midx,memberid,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(1,'test1','1111','홍길동','test@naver.com','female','19990101','123.0.0.1');

COMMIT;

SELECT * FROM member1230;

--데이터 변경 update
--형식은 update 테이블 이름 set 변경할 컬럼 = 변경할 컬럼값,변경할 컬럼2=변경할 컬럼값2 where 컬럼명= 컬럼값
UPDATE member1230 set memberName='홍길순' WHERE midx=1; --midx가 1번인 행에 대해서 이름을 홍길순으로 바꿔라
SELECT




COMMIT;
SELECT * FORM member1230;

--회원번호 1번인 사람의 이메일을 lsj@naver.com 으로 변경하고 생년월일을 19990101변경
UPDATE member1230 SET memberEmail='lsj2naver.com',memberBirth='19990101' WHERE midx=1;
SELECT memberEmail,memberBirth FROM member1230;

COMMIT;


INSERT INTO member1230(midx,memberid ,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(1,'test1','1111','홍길둥','test@naver.com','male','19990101','127.0.0.0');


--데이터 삭제
--(형식) delete from 테이블 이름 where 칼럼 = 컬럼값;
--회원번호 2번에 대해서 데이터를 삭제하시오
DELETE FROM member1230 WHERE midx=2;
--복원 (commit 실행전이라면 )
ROLLBACK;
SELECT * FROM member1230;



INSERT INTO member1230(midx,memberid,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(1,'test1','1111','홍길남','test11@naver.com','male','서울','20000101','123.456.789.100');


INSERT INTO member1230(midx,memberid,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(2,'test4','1111','홍길북','test33@naver.com','male','창원','20010101','123.456.789.400');


INSERT INTO member1230(midx,memberid,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(4,'test5','1111','홍길서','test44@naver.com','male','부산','20020101','123.456.789.500');


INSERT INTO member1230(midx,memberid ,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(5,'test6','1111','홍길가','test55@naver.com','male','여수','20030101','123.456.789.600');

INSERT INTO member1230(midx,memberid ,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(6,'test7','1111','홍길나','test66@naver.com','male','순천','20040101','123.456.789.700');

;INSERT INTO member1230(midx,memberid ,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(5,'test8','1111','홍길다','test77@naver.com','male','익산','20050101','123.456.789.800');

INSERT INTO member1230(midx,memberid ,memberPwd,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
VALUES(5,'test9','1111','홍길라','test88@naver.com','male','정읍','20060101','123.456.789.900');


--형식 select 컬럼,컬럼 from 테이블이름 where 조건 group 조건 order 정렬방식;
-- 전체데이터를 가져오기
SELECT * FROM member1230;

--조건식 데이터를 가져오기
SELECT * FROM member1230 WHERE midx=1;

--회원번호가 1번 8번 9번인 사람의 데이터를 출력하시오
SELECT * FROM member1230 WHERE midx=1 OR midx=8 OR midx=9; --or조건사용
SELECT * FROM member1230 WHERE midx IN(1,8,9); --in함수
 --범위조건
 --회원번호 4번부터 8반까지 회원들의 정보를 출력하시오.
 SELECT * FROM member1230 WHERE midx>= 4 AND midx<=8; --and 조건
 SELECT * FORM member1230 WHERE midx berween 4 AND 8; --between 조건


 --회원번호 2번에서 8번까지 사람들중 지역이 서울인 사람의 데이터를 출력해라
 SELECT * FORM member1230 WHERE memberaddr ='서울' AND midx BETWEEN 2 AND 8;
 --정렬 오름차순 정렬 내림차순 정렬
 --회원번호를  최근 등록한 사람들 순으로 정렬하시오.
 SELECT * FORM member1230 ORDER BY midx DESC --(descending)
 --회원번호를 오름차순으로 정렬
 SELECT * FORM member1230 ORDER BY midx ASC; --asc는 생략이 가능하다

 --회원번호가 4 7 10 번인 사람의 이름을 오름차순으로 출력하시오
 SELECT * FORM member1230 WHERE midx IN(4,7,10)ORDER BY membername ASC;


 --검색조건
 --like 조건 컬럼 like '%검색어%'
--성이 김씨인 사람의 데이터를 출력하시오
select * from member1230 WHERE membername like '%김%'; --김이라는 글짜가 중간에 포함되어있는 사람들
SELECT * FROM member1230 WHERE membername LINK '김%'; --앞글자가 김인 사람들


--회원중에 네이버 메일을 사용하는 회원들의 이름을 출력하시오
SELECT * FROM member1230 WHERE memberemail LIKE '%naver.com';

--전주에 사는 회원들중에 2000년대 생 사람들의 이름들을 오름차순으로 정렬
SELECT * FROM member1230 WHERE memberaddr='전주' AND memberBirth LIKE '2%';

--문자열자르기
--형식 substr(컬럼,자리수 ,개수 )
--회원이름
--김씨 성을 가진 회원들의 이름 만 출력 하시오
SELECT SUBSTR(membername,2) AS NAME FROM member1230 WHERE membername LIKE '김%';

-홍씨 성을 가진 회원들 중간 한자리 이름만 출력하시오.


*/
--SQL 학습하기

--	1. DDL(테이블 조작 언어)
/*
	1-1 테이블 생성하기(CREATE)
	CREATE TABLE 테이블이름 (
		컬럼 데이터타입 널여부 기본키or기본값
		);
*/
CREATE TABLE member(
		midx NUMBER NOT	NULL PRIMARY KEY,
		memberId VARCHAR2(50) NOT NULL,
		memberPw VARCHAR2(50) NOT NULL,
		memberName VARCHAR2(50) NOT NULL,
		memberEmail VARCHAR2(50),
		memberGender VARCHAR2(30),
		memberAddr VARCHAR2(10),
		memberBirth VARCHAR2(20),
		delYn CHAR(1) DEFAULT 'N',
		writeday DATE DEFAULT SYSDATE,
		ip VARCHAR2(30) NULL
);

--테이블 삭제
DROP TABLE member;
DROP TABLE member1230;

CREATE TABLE member1230(
midx NUMBER NOT	NULL PRIMARY KEY,
		memberId VARCHAR2(50) NOT NULL,
		memberPw VARCHAR2(50) NOT NULL,
		memberName VARCHAR2(50) NOT NULL,
		memberEmail VARCHAR2(50),
		memberGender VARCHAR2(30),
		memberAddr VARCHAR2(10),
		memberBirth VARCHAR2(20),
		delYn CHAR(1) DEFAULT 'N',
		writeday DATE DEFAULT SYSDATE,
		ip VARCHAR2(30)
	--	memberphone VARCHAR2(12) NOT null
);

/*
	테이블 수정
	ALTER TABLE 테이블 이름 키워드(ADD-추가,MODIFY-수정) 컬럼 데이터타입 NULL여부 기본값;
*/
ALTER TABLE member1230 MODIFY memberGender VARCHAR2(10);

ALTER TABLE member1230 DROP COLUMN ip;

ALTER TABLE member1230 ADD ip VARCHAR(30);

----------------------------------------------------------------------------------------------------

--2. 데이터 조작하기(DML) = SELECT, DELETE, INSERT, UPDATE
/*
	데이터 삽입하기
	INSERT INTO 테이블이름(컬럼,컬럼,컬럼 ...) VALUES('값','값','값'...) 숫자의 경우 ''를 쓰지 않고 작성
*/

INSERT INTO member1230(midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
	VALUES(1,'test1','1111','홍길동','test1@a.a','man','전주','19000101','127.0.0.1');
INSERT INTO member1230 VALUES(2,'test2','2222','홍길서','s@a.a','man','서울','20000101','Y',SYSDATE,'127.0.0.2');
INSERT INTO member1230 VALUES(3,'test3','3333','홍미영','a@a.a','man','대전','20010101','Y',SYSDATE,'127.0.0.3');
INSERT INTO member1230 VALUES(4,'test4','4444','홍마영','b@a.a','woman','대구','20020101','N',SYSDATE,'127.0.0.4');
INSERT INTO member1230 VALUES(5,'test5','5555','홍무영','c@a.a','woman','부산','20030101','Y',SYSDATE,'127.0.0.5');
INSERT INTO member1230 VALUES(6,'test6','6666','황모영','d@a.a','man','순천','20041001','N',SYSDATE,'127.0.0.6');
INSERT INTO member1230 VALUES(7,'test7','7777','성윤모','e@a.a','woman','여수','20050101','Y',SYSDATE,'127.0.0.7');
INSERT INTO member1230 VALUES(8,'test8','8888','성윤무','f@a.a','man','강릉','20060101','N',SYSDATE,'127.0.0.8');
INSERT INTO member1230 VALUES(9,'test9','9999','성윤마','g@a.a','man','인천','20070101','N',SYSDATE,'127.0.0.9');
INSERT INTO member1230 VALUES(10,'test10','1010','성윤히','h@a.a','man','경기','20080101',default,SYSDATE,'127.0.0.10');
COMMIT;


/*
	데이터 탐색하기
	SELECT * FROM 테이블이름;
*/

SELECT * FROM member1230;

/*
	데이터 수정하기
	UPDATE 테이블이름 SET 변형할 컬럼=변경할 컬럽값, 변경할 컬럼=변경할 컬럼값 WHERE 컬럼명=컬럼값;
*/
UPDATE member1230 SET memberName='홍길순' WHERE midx=1;
SELECT memberName FROM member1230;
COMMIT;
-- 회원번호가 1번인 사람의 email을 sbu@naver.com으로 변경하고, 생년월일을 19990101로 변경
UPDATE member1230 SET memberEmail='sbu@naver.com', memberBirth='19990101' WHERE midx=1;
SELECT memberEmail, memberBirth FROM member1230;
COMMIT;

/*
	데이터 삭제하기 및 복원하기
	DELETE FROM 테이블 이름 WHERE 칼럼= 칼럼값;
*/
-- 회원번호 2번인 사람의 데이터를 삭제
DELETE FROM member1230 WHERE MIDX=2;
SELECT * FROM member1230;
--COMMIT 하기 전이라면 ROLLBACK(복원)
ROLLBACK;
SELECT * FROM member1230;

--회원번호 5번인 사람의 이름을 출력하시오.
SELECT memberName FROM member1230 WHERE MIDX=5;
--홍씨 성을 가진 회원의 중간 한자리 이름만 출력하시오
SELECT SUBSTR(membername,2,1) FROM member1230 WHERE memberName LIKE '홍';

--회원 이름의 마지막 글자만을 출력하시오
SELECT SUBSTR (membername,-1)AS NAME FORM member1230

--미영이라는 사람의 이메일 주소 출력
SELECT memberemail FORM member1230 WHERE SUBSTR(membername,2,2)='미영';

회원 전화번호 컬럼 추가
--memberphone varchar(12)null 처리

ALTER TABLE member1230 ADD memberphone VARCHAR2(12);


UPDATE member1230 SET memberphone='01045671990'WHERE midx=1;
UPDATE member1230 SET memberphone='01045671991'WHERE midx=2;
UPDATE member1230 SET memberphone='01045671992'WHERE midx=3;
UPDATE member1230 SET memberphone='01045671993'WHERE midx=4;
UPDATE member1230 SET memberphone='01045671994'WHERE midx=5;
UPDATE member1230 SET memberphone='01045671995'WHERE midx=6;
UPDATE member1230 SET memberphone='01045671996'WHERE midx=7;
UPDATE member1230 SET memberphone='01045671997'WHERE midx=8;
UPDATE member1230 SET memberphone='01045671998'WHERE midx=9;
UPDATE member1230 SET memberphone='01045671999'WHERE midx=10;
COMMIT;
SELECT * FROM member1230;

ALTER TABLE member1230 MODIFY(memberEmail visible);
ALTER TABLE member1230 MODIFY(membergender visible);
ALTER TABLE member1230 MODIFY(memberaddr visible);
ALTER TABLE member1230 MODIFY(memberbirth visible);
ALTER TABLE member1230 MODIFY(delyn visible);
ALTER TABLE member1230 MODIFY(writeday visible);
ALTER TABLE member1230 MODIFY(ip visible);

SELECT * FROM member1230;

--ex 김아랑 이름과 tttt33@naver.com 이메일을 쓰는 사람의 아이디를 출력하시오
SELECT * FROM member1230 WHERE membername='김아랑' AND membermail='ttt@naver.com';
--3번 회원이 회원 탈퇴 했음
--회운탈퇴 여부  delyn 를 y 로 변경
UPDATE member1230 SET delyn='y' WHERE midx =3;
COMMIT;
?띾쭏??
SELECT * FROM member1230 WHERE delyn='N';


--그룹 절을 사용
--형식 select * from 테이블 이름  group by 컬럼
--회원들의
지역을 지역별로 출력하시오
SELECT memberAddr FROM member1230 GROUP BY memberaddr ; --그룹절안의 컬럼을 출력할 수 있다.
--회원들의 지역별로 인원수
--count 함수 사용
SELECT MEMBERADDR, COUNT(*) AS cnt
FROM MEMBER1230 GROUP BY memberaddr
--sum 함수 사용
--지역별로 각 회원의 회원번호 합을 출력하시오
SELECT memberaddr,SUM(midx) AS cnt FROM member1230 GROUP BY memberaddr;

--avg() 평균함수
SELECT MEMBERADDR,AVG(midx) AS AVG FROM member1230 GROUP BY memberaddr;
--max() 최고값 min()최저값
SELECT memberaddr,MAX(midx) AS maxmidx,MIN(midx) AS minmidx FROM MEMBER1230 GROUP BY memberaddr;
--전체그룹에 대해서 최근 회원번호를 출력하시오
SELECT MAX(midx) AS maxmidx FROM member1230;
SELECT min(midx) AS minmidx FROM member1230 ;
SELECT count(midx) AS cnt FROM member1230 ;
SELECT sum(midx) AS summidx FROM member1230 ;
SELECT AVG(midx) AS maxmidx FROM member1230 ;
--가입된 회원의 총 인원수를 출력하시오
SELECT COUNT(*) FROM MEMBER1230 WHERE DELYN='n'
--전주에 사는 회원들의  평균나이를 출력하시오
SELECT AVG(2023-SUBSTR(memberbirth,1,4)) AS avgage FROM member1230 WHERE memberaddr='전주';
--SELECT AVG(midx) AS avg_age FROM member1230 WHERE memberaddr= '전주';
--최근에 등록된 서울에 사는 사람의 이름을 출력하시오
SELECT MAX(midx) AS maxmidx FROM MEMBER1230 WHERE memberaddr='서울';
--회원번호 1~7번까지 사람들의 나이의 총합을 구하시오
SELECT SUM(2023-SUBSTR(memberBirth,1,4)) AS sumage FROM member1230 WHERE midx BETWEEN 1 AND 7;

COMMIT;

--휴대폰 끝자리가 5인사람들의 명단을 지역별 이름 내림차순으로 정렬하시오
SELECT memberaddr,membername FROM MEMBER1230
WHERE memberphone LIKE '%5'
GROUP BY memberaddr,memberName
ORDER BY  membername DESC;

--사는지역별로 사람들의 인원수 출력
SELECT  memberaddr,COUNT(midx)FROM MEMBER1230 GROUP BY memberaddr;


--insert () 함수 : 검색어의 시작점 위치뽑기
--사람들의 메일주소의 자리위치를 출력하시오
SELECT INSTR(memberemail,'@') AS jari FROM member1230;

--회원들의 사용하는 각 메일별로 사람들의 인원수를 출력하시오.
--select substr(memberemail,instr(memberemail,'@')),count(*)from memeber1230
--GROUP BY SUBSTR(memberemail,INSTR(memberemail,'@'));

--지역별 성별인원수 출력
SELECT memberaddr,membergender, COUNT(*) FROM member1230 GROUP BY memberaddr,memberGender ORDER BY memberaddr;

--서브쿼리(쿼리안에 쿼리)
--회원번호가 회원번호 평큔이하인 사람들의 데이터를 출력하시오
SELECT * FROM member1230 WHERE midx < (SELECT AVG(midx) FROM MEMBER1230) ;
--나이가 가장 작은 사람의 전화번호를 출력하시오
SELECT * FROM MEMBER1230 WHERE (2023 -substr(memberBirth,1,4)=(SELECT MIN(2023-SUBSTR(memberbirth,1,4)) FROM MEMBER1230));

--다중행값을 뽑아내는 서브쿼리
--회원번호중에 회원번호가 홀수인 사람들의 이름을 서브쿼리로 활용해서 출력하세요
--mod(컬럼,2)=1; ?깆쑄紐?

--홀수체크
SELECT membername FroM member1230 WHERE midx IN(SELECT midx FROM member1230 WHERE MOD(midx,2)=1);

--인라인 뷰 서브쿼리 (컬럼
--회원명단을 출력하고 탈퇴된 회원은 탈퇴라고 출력하세요
SELECT membername,(SELECT '탈퇴' FROM member1230 b WHERE a.midx=b.midx AND b.delyn='y')FROM MEMBER1230;

--인라인뷰 서브쿼리 (단일테이불이 아닌 제약테이블 사용)
SELECT * FROM MEMBER1230 a,(SELECT * FROM member1230 WHERE membergender='man')b WHERE a.midx=b.midx

--각 지역별 여성 인원수를 서브쿼리를 활용하여 출력하세요
--SELECT * FROM memberaddr a, (SELECT * FROM member1230 WHERE membergender='woman')b WHERE member1230;
SELECT memberGender, COUNT(*)FROM MEMBER1230
WHERE midx IN(SELECT midx FROM member1230 WHERE memberGender='woman'


GROUP BY memberaddr;


--정답 select memberaddr,count(*)from member 1230
--where midx in(select midx from member1230 where membergender='woman')
--group by memberaddr;

--case when then else end 조건식
--회원이 성별이 male 이면 남성이라고 출력하고 female 이면 여성출력

SELECT midx,
CASE memberGender --성별이
WHEN 'man'THEN '남성'
WHEN 'woman' THEN '여성'
else'모름' END AS gender
FROM member1230;

SELECT midx,
CASE
WHEN membergender='man' THEN '남성'
WHEN membergender='woman' THEN '여성'
ELSE '모름' END AS gender
FROM member1230;


--decode()조건식
SELECT midx,DECODE(membergender,'man','남성','woman','여성','모름')AS gender FROM MEMBER1230

--회원탈퇴 되었으면 delyn='y' 탈퇴 출력 n이면 가입이라고 출력하시오 (CASE 문 활용)
SELECT midx,
CASE
WHEN delyn ='y' THEN '탈퇴'
WHEN delyn ='n' THEN '가입'
ELSE '모름'END AS delYn

FROM MEMBER1230

--회원번호 짝수인 사람의 ip 를 null처리하기
UPDATE member1230 SET ip = NULL WHERE MOD(midx,2)=0;
COMMIT;
SELECT * FROM member1230;異붿쟻遺덇?異붿쟻媛??

--ip가 널인 사람은 추적불가로 출력하고 아닌 사람은 추적가능이라고 출력하시오
--null 체크하는 함수 nvl() nvl2()
SELECT NVL(ip,'추적불가')FROM member1230;
SELECT NVL2(ip,'추적가능','추적불가')FROM member1230;


--날짜 함수
--시스템 냘짜 출력
SELECT SYSDATE FROM dual; --컬럼값을 출력하기 위한 임시테이블
--시스템 날짜를 문자열로 출력하시오
--2000-01-01


--날짜형을 문자형으로 변환
SELECT TO_CHAR(SYSDATE,'yyyy-mm--dd') AS 현재날짜 FROM dual;


--문자형을 날짜형으로 변환
SELECT TO_date ('20000101','yyyymmdd') AS 날짜 FROM dual;

--member1230에 writeday 컬럼의 데이터를 문자형으로 2023-01-01 형태대로 출력

SELECT TO_CHAR(writeday,'yyyy--mm--dd') AS ymd FROM member1230;


--특정일에 달수를 더할때 add_months()
--현재 날짜에서 3개월 후의 날짜를 출력하시오
SELECT ADD_MONTHS(sysdate,3) AS ymd FROM dual;

--특정일의 해당월의 마지막 날짜를 출력 lats_day
SELECT LAST_DAY(sysdate)FROM dual;

--현재날짜로 부터 6개월후의 마지막 날짜를 출력
SELECT ADD_MONTHS(SYSDATE,6) AS LAST_DAY FROM dual;
SELECT ADD_MONTHS(SYSDATE,3) AS

--정답 select last_day(add_months(sysdate,6) from dual;

--요일 next_day ('기준일','찾을요일')
--다음 일요일의 날짜를 출력하시오
SELECT sysdate,NEXT_DAY(sysdate,1 )AS 다음일요일날짜 FROM dual;

--trunc 첫날짜를 뽑기
--현재일로 부터 2개월 후에 첫날짜를 출력하시오
SELECT TRUNC(ADD_MONTHS(SYSDATE,2),'mm')FROM dual;
--현재일로부터 올해년도 첫날짜를 출력하시오
SELECT TRUNC(SYSDATE,'yyyy')FROM dual;

--현재날짜의 3개월 후에 그 달의 세번째 토요일의 날짜를 출력하시오

SELECT NEXT_DAY(ADD_MONTHS(SYSDATE,3),7) FROM dual;

SELECT NEXT_DAY(TRUNC(ADD_MONTHS(SYSDATE,3),'MM')+14,7) FROM dual;

--join문


--테이블 생성
--board1230

CREATE TABLE board1230 (
bidx NUMBER not NULL PRIMARY key,
subject VARCHAR2(50) NOT null,
CONTENTS VARCHAR2(1000) null,
writer VARCHAR2(20) null,
delyn CHAR(1) DEFAULT 'n',
writeday DATE DEFAULT sysdate,

ip VARCHAR2(30)null,
midx NUMBER NOT NULL ,
CONSTRAINTS midx_fk FOREIGN KEY(midx) REFERENCES member1230(midx)
);


SELECT * FROM board1230;

INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(1,'첫번째 글입니다','첫번째 내용','김민수','111.222.333.444',1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(2,'두번째 글입니다','두번째 내용','행인','222.222.333.444',2);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(3,'세번째 글입니다','세번째 내용','아이언맨','222.222.333.555',1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(4,'네번째 글입니다','네번째 내용','토르',null,3);

INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(5,'다섯번째 글입니다','다섯번째 내용','스파이더맨',null,4);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(6,'여섯번째 글입니다','여섯번째 내용','슈퍼맨',null,3);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(7,'일곱번째 글입니다','일곱번째 내용','원더우먼',null,5);

INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(8,'여뎗번째 글입니다','여덟번째 내용','베트맨',null,6);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(9,'아홉번째 글입니다','아홉번째 내용','이순신',null,1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(10,'열번째 글입니다','열번째 내용','김순자',null,9);

COMMIT;
?ㅼ꽢踰덉㎏ ?댁슜
--inner join (공통된 컬럼으로 묶어서 하나의 테이블로 만드는 작업)
--형식 (테이블 A inner join 테이블 B on a.pk컬럼 = b(컬럼)
--3번째 글 을 쓴 사람의 나이 알려주셈
SELECT * FROM member1230 A
INNER JOIN board1230 b ON a.midx = b.midx;
WHERE b.bidx=3;

SELECT SYSDATE-SUBSTR(A.memberbirth,1,4) AS age FROM MEMBER1230
JOIN board1230 B ON A.midx
WHERE b.midx =3;


SELECT * FROM member1230 A ,board1230 B WHERE a.midx=b.midx;


SELECT * FROM board1230;


--홍길순인 사람이 쓴 글의 갯수 출력
SELECT * FROM MEMBER1230 a INNER JOIN

board1230 b ON a.midx=b.midx WHERE a.membername ='홍길순';

--지역별 게시물 쓴 사람 인원수 출력
--distinct 중복제거
SELECT a.memberaddr,COUNT(*)FROM  MEMBER1230 a INNER JOIN board1230 b ON a.midx=b.midx GROUP
BY a.memberaddr;

SELECT DISTINCT b.midx FROM board1230 b;

--게시글 내용중 다섯이라는 글자가 포함된 글의 쓴 사람의 아이디를 출력
SELECT *
FROM BOARD1230
WHERE CONTENTS LIKE '%다섯%';
--정답 select a.memberid from member1230
--a inner join board1230 b on a.midx =b.midx
--where b.contents like '%다섯%';

--회원번호 1,8번에 해당하는 사람이 쓴 게시글의 ip를 추출하고 없으면 ip없음으로 출력
--SELECT a.midx,NVL(b.ip,'ip없음')FROM MEMBER1230 a INNER JOIN board1230 b ON a.midx=b.midx WHERE a.midx IN (1,8);


--게시글 쓴 사람의 닉네임이 3글자 이상인 사람의 성별 출력
SELECT DECODE(a.membergender,'man','남','woman','여')AS gender FROM MEMBER1230 a INNER JOIN board1230 b ON a.midx=b.midx
WHERE LENGTH(b.writer)>=3;




--crud 작업?

--left outer join
--왼쪽에 있는 모든 것과 오른쪽에 있는 공통된 데이터
--형식 select * from table a left outer join 테이블 b on a 공통 컬럼 = b.공통컬럼
--각 지역별로 글쓴 사람의 인원수 출력
SELECT a.memberaddr, COUNT(DISTINCT b.midx) FROM member1230 a LEFT OUTER JOIN
board1230 b ON a.midx=b.midx GROUP BY a.memberaddr;



SELECT * FROM member1230 a LEFT OUTER JOIN board1230 b ON a.midx=b.midx --표준쿼리

SELECT * FROM member1230 a, board1230 b WHERE a.midx =b.midx(+)AND 조건식;

--성별로 글쓴 사람의 인원수 출력(남성몇명,여성몇명)
SELECT a.memberGender,COUNT(DISTINCT b.midx) FROM MEMBER1230 a LEFT OUTER  JOIN
board1230 b ON a.midx=b.midx GROUP BY a.membergender;

--게시글을 쓴 사람들 중에 최고 나이많은 사람의 나이와 가장 어린 사람의 나이를 출력하시오

SELECT
    MAX(memberBirth) AS max,
    MIN(memberBirth) AS MIN
FROM
    MEMBER1230 b;

--선생님 풀이 select max(2023-substr(memberbirth,1,4)),min(2023-substr(memberbirth,1,4))from member1230 a join board1230 b on a.midx=b.midx

--3번 5번인 사람이 쓴 글의 내용중에 안녕이라는 글자가 포함된 글을 번호로 출력하시오
SELECT board1230
FROM CONTENTS JOIN board1230 ON CONTENTS,ip =CONTENTS,ip
WHERE CONTENTS,ip IN(3,5) AND
CONTENTS LIKE '%안녕 %';

--선생님풀이 select bidx from bodrd1230 where midx in(3,5) and contents like '%안녕%';

--시퀀스(sequence)- 순서를 갖춘 장면 (자동번호표)
--자동번호를 표를 만들어내는 객체
--형식 create sequence 시퀀스이름
-- increment by 1(증가)
--start with 1;
CREATE SEQUENCE midx_seq
INCREMENT BY 1
START WITH 1;


SELECT MIDX_SEQ.NEXTVAL FROM dual; --번호표

SELECT MIDX_SEQ.CURRVAL FROM dual;--현재값출력 올라가지않음

DELETE FROM member1230; --오류 나중삭제

DELETE
 FROM BOARD1230; --이것먼저 삭제
 COMMIT;
 SELECT * FROM member1230;
 SELECT * FROM BOARD1230 ;

 INSERT INTO member1230(midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
	VALUES(midx_seq.NEXTVAL,'test1','1111','홍길동ㅁ','test1@a.a','man','전주','19000101','127.0.0.1');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test2','2222','홍길서ㅁ','s@a.a','man','서울','20000101','Y',SYSDATE,'127.0.0.2');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test3','3333','홍미영ㅁ','a@a.a','man','대전','20010101','Y',SYSDATE,'127.0.0.3');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test4','4444','홍마영ㅁ','b@a.a','woman','대구','20020101','N',SYSDATE,'127.0.0.4');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test5','5555','홍무영ㅁ','c@a.a','woman','부산','20030101','Y',SYSDATE,'127.0.0.5');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test6','6666','황모영ㅁ','d@a.a','man','순천','20041001','N',SYSDATE,'127.0.0.6');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test7','7777','성윤모ㅁ','e@a.a','woman','여수','20050101','Y',SYSDATE,'127.0.0.7');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test8','8888','성윤무ㅁ','f@a.a','man','강릉','20060101','N',SYSDATE,'127.0.0.8');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test9','9999','성윤마ㅁ','g@a.a','man','인천','20070101','N',SYSDATE,'127.0.0.9');
INSERT INTO member1230 VALUES(midx_seq.NEXTVAL,'test10','1010','성윤히ㅁ','h@a.a','man','경기','20080101',default,SYSDATE,'127.0.0.10');
COMMIT;

DROP SEQUENCE midx_seq;

SELECT * FROM MEMBER1230 ;
COMMIT;



--게시글 모두를 지우고 스퀀스 bidx_seq 를 생성해서 게시글 샘플데이터 적용
SELECT * FROM BOARD1230  ;
CREATE SEQUENCE bidx_seq

INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'첫번째 글입니다','첫번째 내용','김민수','111.222.333.444',1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'두번째 글입니다','두번째 내용','행인','222.222.333.444',2);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'세번째 글입니다','세번째 내용','아이언맨','222.222.333.555',1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'네번째 글입니다','네번째 내용','토르',null,3);

INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'다섯번째 글입니다','다섯번째 내용','스파이더맨',null,4);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'여섯번째 글입니다','여섯번째 내용','슈퍼맨',null,3);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'일곱번째 글입니다','일곱번째 내용','원더우먼',null,5);

INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'여뎗번째 글입니다','여덟번째 내용','베트맨',null,6);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAL,'아홉번째 글입니다','아홉번째 내용','이순신',null,1);
INSERT INTO board1230(bidx,subject,contents,writer,ip,midx)VALUES(bidx_seq.NEXTVAl,'열번째 글입니다','열번째 내용','김순자',null,9);
 COMMIT;

SELECT * FROM BOARD1230 ;


