SELECT * 
	FROM 사원, 부서
WHERE 사원.`소속부서`= 부서.`부서번호`;

SELECT *
 FROM emp
 Join dept
 on emp.deptno = dept.DEPTNO;
	
### join
SELECT *
FROM 주문
JOIN 제품
ON 주문.`주문제품` = 제품.`제품번호`
WHERE 주문.`주문고객` = 'banana';

SELECT 주문.`주문제품`, 주문.`주문일자`
FROM 고객
JOIN 주문
ON 고객.`고객아이디` = 주문.`주문고객`
WHERE 고객.`나이`>=30;


#'고명석' 고객이 주문한 제품의 제품명 검색
SELECT p.`제품명`
FROM 고객 c
JOIN 주문 O
ON c.`고객아이디` = O.`주문고객`
JOIN 제품 p
ON O.`주문제품` = p.`제품번호`
WHERE c.`고객이름` = '고명석';

# '서울시 마포구'를 배송지로 등록한 적이 있는 고객의 이름, 직업,
# 주문한 제품명, 단가, 제조업체 검색

SELECT 고객이름, 직업,제품명, 수량, 주문일자
FROM 주문 O
JOIN 고객 C
ON O.`주문고객` = C.`고객아이디`
JOIN 제품 P
ON O.`주문제품` = P.`제품번호`
WHERE O.`배송지` = '서울시 마포구';

### 연습문제
#1
SELECT ename, emp.deptno, dname
FROM emp
JOIN dept
ON emp.DEPTNO = dept.DEPTNO;

#2.
SELECT *
FROM emp
JOIN dept
ON emp.DEPTNO = dept.DEPTNO;

#3.
SELECT ename, comm, sal, loc
FROM emp
JOIN dept
ON emp.DEPTNO = dept.DEPTNO
WHERE emp.COMM IS NOT NULL;

#4
SELECT SUM(sal), dname, loc
 FROM emp
 JOIN dept
   ON emp.DEPTNO = dept.DEPTNO
 where dept.loc = 'NEW YORK' OR dept.LOC = 'DALLAS'
 GROUP BY emp.DEPTNO;
 
# 부하직원과 매니저 이름 
SELECT e1.ENAME AS empname, e2.ENAME AS mgrname
 FROM emp e1
 JOIN emp e2
 ON e1.MGR = e2.EMPNO;
 
### OUTER JOIN
SELECT * FROM 제품;
SELECT * FROM 주문;

SELECT *
 FROM 제품 P
 left JOIN 주문 O
 ON P.`제품번호` = O.`주문제품`;
 
SELECT *
 FROM 주문 O
 right JOIN  제품 P
 ON P.`제품번호` = O.`주문제품`;
 
 
 ### 연습문제 5-2
 
 CREATE TABLE IT_MEMBER (
 NUM INT
 , NAME VARCHAR(10)
 , COURSE_NO INT
);
INSERT INTO IT_MEMBER VALUES (1, 'AA', 1);
INSERT INTO IT_MEMBER VALUES (2, 'BB', 1);
INSERT INTO IT_MEMBER VALUES (3, 'CC', 2);
INSERT INTO IT_MEMBER VALUES (4, 'DD', 2);
INSERT INTO IT_MEMBER VALUES (5, 'EE', 4);
INSERT INTO IT_MEMBER VALUES (6, 'FF', NULL);

CREATE TABLE COURSE02 (
 COURSE_NO INT
 , COURSE_NAME VARCHAR(20)
);
INSERT INTO COURSE02 VALUES (1, 'DIGITAL');
INSERT INTO COURSE02 VALUES (2, 'BIG DATA');
INSERT INTO COURSE02 VALUES (3, 'CLOUD');
INSERT INTO COURSE02 VALUES (4, 'NFC');

SELECT * FROM it_member;
SELECT * FROM course02;

#1
SELECT * 
 FROM it_member i
 JOIN course02 c
 ON i.course_no = c.course_no;

#2
SELECT * 
 FROM IT_MEMBER i
 left JOIN COURSE02 c
 ON i.course_no = c.course_no;

#3
SELECT * 
 FROM IT_MEMBER i
 right JOIN COURSE02 c
 ON i.course_no = c.course_no;

### sub-query
SELECT * FROM emp;

SELECT * 
 FROM emp
 WHERE sal in (
 		SELECT sal
		 FROM emp
		 WHERE sal = 1250
 				);
 				
## 연습문제 ##

#1
SELECT * 
FROM emp
WHERE sal >= (SELECT sal
					FROM emp
					WHERE ename = 'allen');

#3
SELECT empno, ename, job, deptno
FROM emp
WHERE deptno = (SELECT deptno
					FROM emp
					WHERE mgr IS NULL);
					
#4
SELECT *
FROM emp
WHERE sal <(SELECT AVG(sal)
				FROM emp
				WHERE deptno = (SELECT deptno
									FROM emp
									WHERE comm =0));


### UPDATE
SELECT * FROM 제품;

UPDATE 제품 set 제품명 = '통큰파이'
 WHERE 제품명 = '쿵떡파이';
 
SET @@AUTOCOMMit = 0;
ROLLBACK;
COMMIT;


UPDATE 제품 set 제품명 = '신박만두'
 WHERE 제품명 = '그냥만두';