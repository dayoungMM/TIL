### 데이터 삽입

INSERT INTO 부서 (부서번호, 부서이름) VALUES (1,'인사부');
INSERT INTO 부서 (부서번호, 부서이름) VALUES (2,'연구부');
INSERT INTO 부서 (부서번호, 부서이름) VALUES (3,'홍보부');

INSERT INTO 사원 (사원번호, 사원이름, 소속부서) VALUES (1001, 'AAA', 3);
INSERT INTO 사원 (사원번호, 사원이름, 소속부서) VALUES (1002, 'BBB', 2);
INSERT INTO 사원 (사원번호, 사원이름, 소속부서) VALUES (1003, 'CCC', 1);


INSERT INTO MEMBER (num, NAME, email, phone)
	VALUES (1,'A','aaa@gmail.com', '010-0000-0001');

INSERT INTO MEMBER (num, NAME, email, phone)
	VALUES (2,'B','bbb@gmail.com', '010-0000-0002');


INSERT INTO MEMBER (num, NAME, email, phone)
	VALUES (3,'C','ccc@gmail.com', '010-0000-0003');


INSERT INTO MEMBER (num, NAME, email, phone)
	VALUES (4,'D','ddd@gmail.com', '010-0000-0004');
### 실습###

CREATE TABLE 고객 (
 고객아이디 VARCHAR(20),
 고객이름 VARCHAR(10) NOT NULL,
 나이 INT,
 등급 VARCHAR(10) NOT NULL,
 직업 VARCHAR(20),
 적립금 INT DEFAULT 0,
 PRIMARY KEY(고객아이디)
);
CREATE TABLE 제품 (
 제품번호 CHAR(3),
 제품명 VARCHAR(20),
 재고량 INT,
 단가 INT,
 제조업체 VARCHAR(20),
 PRIMARY KEY(제품번호)
);

CREATE TABLE 주문 (
 주문번호 CHAR(3),
 주문고객 VARCHAR(20),
 주문제품 CHAR(3),
 수량 INT,
 배송지 VARCHAR(30),
 주문일자 DATETIME,
 PRIMARY KEY(주문번호),
 FOREIGN KEY(주문고객) REFERENCES 고객(고객아이디),
 FOREIGN KEY(주문제품) REFERENCES 제품(제품번호)
);


INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);
INSERT INTO 고객 VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);
INSERT INTO 고객 VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);
INSERT INTO 고객 VALUES ('orange', '김용욱', 22, 'silver', '학생', 0);
INSERT INTO 고객 VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);
INSERT INTO 고객 VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);
INSERT INTO 고객 VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);

INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
INSERT INTO 제품 VALUES ('p04', '맛난초콜렛', 1250, 2500, '한빛제과');
INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
INSERT INTO 제품 VALUES ('p07', '달콤비스켓', 1650, 1500, '한빛제과');
	
	
INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '2013-01-01');
INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '2013-01-10');
INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '2013-01-11');
INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '2013-02-01');
INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '2013-02-20');
INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '2013-03-02');
INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '2013-03-15');
INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '2013-04-10');
INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '2013-04-11');
INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '2013-05-22');



### 데이터 호출: select
SELECT 고객아이디, 고객이름, 등급
FROM 고객;

SELECT 고객아이디, 고객이름, 나이, 등급, 직업, 적립금
FROM 고객;

SELECT 제품명, 제조업체 FROM 제품;
SELECT DISTINCT 제조업체, 제품명
FROM 제품;

SELECT 제품명, 단가 AS '가격'
FROM 제품;

SELECT 제품명, 단가+500 AS '조정단가'
FROM 제품;

### 연습문제###
# 제약조건 삭제 및 재생성
INSERT INTO dept(deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept(deptno, dname, loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept(deptno, dname, loc) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept(deptno, dname, loc) VALUES (40, 'OPERATIONS', 'BOSTON');
 
INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);


SELECT * FROM EMP;
SELECT DEPTNO, DNAME, LOC FROM DEPT;

SELECT ename, job, hiredate, sal, deptno FROM emp;

SELECT DISTINCT job, deptno FROM emp;

DESC dept;

SELECT * FROM dept;

SELECT dname AS '부서명', loc AS '부서위치' FROM dept; 

#### select
SELECT 제품명, 단가, ROUND(단가*0.8,0) AS'조정단가' FROM 제품;

### where

SELECT 제품명, 재고량, 단가 
FROM 제품
WHERE 제조업체='한빛제과';

SELECT 주문제품, 수량, 주문일자
FROM 주문
WHERE 수량>=30 AND 주문일자>= '2013-03-20';

SELECT 주문제품, 수량, 주문일자
FROM 주문
WHERE 수량>=30 AND 배송지= '강원도 춘천시';

### 연습문제 3-4, 3-5

SELECT sal, round(sal*1.1,0) AS 'increased sal', sal*12 + ifnull(comm,0) AS annual
FROM emp;

SELECT ename, sal, comm, comm*0.95  FROM emp;

SELECT ename, job FROM emp
WHERE mgr=7839;

SELECT job, deptno FROM emp
WHERE sal >=3000;

SELECT ename, job, sal FROM emp
WHERE job != 'clerk' AND job !='salesman';

SELECT sal, deptno
FROM emp
WHERE mgr = 7839 OR job = 'analyst';

SELECT * FROM emp
WHERE (empno = 7698 OR empno = 7839) AND deptno = 10;

### Like###
SELECT * FROM 고객
WHERE 직업 LIKE '___' AND 고객아이디 LIKE '%a%';

### IS NULL ###
SELECT 고객이름 FROM 고객
WHERE 나이 IS not NULL;

### 연습문제###
SELECT * FROM emp;

SELECT ename, job FROM emp
WHERE ename LIKE 'A%';

SELECT ename, job FROM emp
WHERE ename LIKE '%N';

SELECT ename, deptno FROM emp
WHERE ename LIKE '__R_' ;

SELECT ename, sal FROM emp
WHERE ename LIKE '_I%';

SELECT ename, job, sal FROM emp
WHERE MGR IS NULL;

SELECT ename, hiredate, sal FROM emp
WHERE comm IS NULL;

SELECT * FROM emp
WHERE MGR IS NOT NULL AND deptno = 20;

SELECT * FROM emp
WHERE (comm is NOT NULL) AND (hiredate LIKE '1981-02-%');

SELECT * FROM emp
WHERE (comm is NOT NULL) AND (hiredate >= '1981-02');

### 연습문제
SELECT * FROM emp
ORDER BY ename DESC;

SELECT * FROM emp
ORDER BY hiredate;

SELECT * FROM emp
ORDER BY deptno DESC, 
ename ASC;

SELECT * FROM emp
LIMIT 0,5; -- index 0번부터 5개

SELECT * FROM emp
LIMIT 5,5; -- index 5번부터 5개


# 30번 부서에 근무하는 사람들을 급여가 높은 순으로 정렬하여 5건씩 출력

SELECT * FROM emp 
WHERE deptno = 30
ORDER BY sal DESC
LIMIT 0,5;

SELECT * FROM emp 
WHERE deptno = 30
ORDER BY sal DESC
LIMIT 5,10;


### 연습문제(최종)
SELECT * FROM emp;
SELECT * FROM dept;

SELECT empno, ename, sal FROM emp
WHERE deptno = 10;

SELECT ename, hiredate, deptno FROM emp
WHERE empno = 7369;

SELECT * FROM emp
WHERE ename = 'allen';

SELECT * FROM emp
WHERE job != 'manager';

SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

SELECT * FROM emp
WHERE deptno >= 20;

SELECT * FROM emp
WHERE ename >= 'K'
ORDER BY ename asc;