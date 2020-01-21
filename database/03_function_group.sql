#반올림
SELECT sal*0.8, ROUND(sal*0.8,0) FROM emp;
#문자열 추출
SELECT SUBSTR(hiredate, 1, 10) FROM emp;
#날짜표시
SELECT * FROM emp 
WHERE ename LIKE CONCAT('%','A','%');

SELECT NOW();

SELECT DATE_FORMAT(NOW(), '%y/%m/%d %H:%i:%s');

#조건문
SELECT *,
	IFNULL (comm,0), 
	Case deptno 
		when 10 then '총무'
		when 20 then '운영'
		ELSE '기타'
		end
 FROM emp;
 
# 집계함수 
SELECT * FROM 제품;

SELECT MAX(재고량) FROM  제품; 

### 만약 재고량 max 인 제품이름을 알고싶을때는 서브쿼리 이용
SELECT * 
FROM 제품
WHERE 재고량 = (SELECT MAX(재고량)
						FROM 제품);
						
# null값 때문에 나이 이용한 count 잘못됨						
SELECT COUNT(나이), COUNT(고객아이디) FROM 고객;

#따라서 다음과 같이
SELECT COUNT(*)FROM 고객;
SELECT COUNT(1)FROM 고객;

SELECT 1 FROM 고객;

### 연습문제
SELECT COUNT(1) FROM emp;

SELECT COUNT(*) 
FROM emp
WHERE mgr IS not NULL;

SELECT SUM(sal) FROM emp
WHERE sal<=2000;

SELECT COUNT(*), AVG(sal)
FROM emp
WHERE job = 'manager';

SELECT MIN(sal) FROM emp;

SELECT max(sal) FROM emp


select ename, sal 
FROM emp
WHERE sal = (SELECT max(sal) FROM emp
		WHERE deptno = 30);

SELECT count(DISTINCT(job) FROM emp;


### groupby
SELECT 제조업체, count(제조업체)FROM 제품
GROUP BY 제조업체;

SELECT 등급, round(AVG(적립금),0) AS 평균적립금, COUNT(*)
 FROM 고객
 GROUP BY 등급
 HAVING AVG(적립금)>=1000
 ORDER BY 평균적립금 asc;
 
 
 ## 연습문제
 SELECT COUNT(*), deptno 
 FROM emp
 GROUP BY deptno;
 
 SELECT COUNT(*), job
 FROM emp
 GROUP BY job;
 
 SELECT SUM(sal), deptno
 FROM emp
 GROUP BY deptno;
 
 SELECT COUNT(*),deptno, job
 FROM emp
 GROUP BY deptno, job;
 
 SELECT job, COUNT(*)
 FROM emp
 GROUP BY job
 HAVING COUNT(*)>=3;
 
 SELECT deptno, COUNT(*)
 FROM emp
 GROUP BY deptno
 HAVING COUNT(*)<=4;
 
 SELECT COUNT(*)AS 부하직원수, MGR FROM emp
 GROUP BY mgr
 HAVING 부하직원수=1 AND MGR IS NOT null;
 
 SELECT * FROM emp;
 ### 연습문제
 CREATE TABLE NOODLE (
 NUM INT
 , NAME VARCHAR(50)
 , COMPANY VARCHAR(10)
 , KIND VARCHAR(1)
 , PRICE INT
 , E_DATE DATETIME
);

INSERT INTO NOODLE VALUES (
 1, '안성탕면', '농심', 'M', 700, NOW() + INTERVAL 3 MONTH);
INSERT INTO NOODLE VALUES (
 1, '김치라면', '삼양', 'M', 700, NOW() + INTERVAL 3 MONTH);
INSERT INTO NOODLE VALUES (
 1, '진라면', '오뚜기', 'C', 800, NOW() + INTERVAL 3 MONTH);
INSERT INTO NOODLE VALUES (
 1, '꼬꼬면', '팔도', 'C', 1000, NOW() + INTERVAL 3 MONTH);
INSERT INTO NOODLE VALUES (
 2, '신라면', '농심', 'C', 1100, NOW() + INTERVAL 3 MONTH);
INSERT INTO NOODLE VALUES (
 2, '삼양라면', '삼양', 'M', 700, NOW() + INTERVAL 3 MONTH);
INSERT INTO NOODLE VALUES (
 3, '너구리', '농심', 'M', 850, NOW() + INTERVAL 3 MONTH);
INSERT INTO NOODLE VALUES (
 3, '나가사키짬뽕', '삼양', 'C', 1300, NOW() + INTERVAL 3 MONTH);
INSERT INTO NOODLE VALUES (
 4, '짜파게티', '농심', 'C', 1200, NOW() + INTERVAL 3 MONTH);
 
 SELECT * FROM noodle;
 SELECT company, 
 	convert(concat(COUNT(*),'개') USING UTF8) AS "COUNT",
 	CAST(concat(COUNT(*),'개') AS VARCHAR(20)) AS "CNT"
 FROM noodle
 group by company
 HAVING COUNT(*) >=3;
 
 SELECT company, concat(COUNT(*),'개') AS count
 FROM noodle
 group by company
 ORDER BY COUNT(*) ASC;
 
 SELECT company, concat(COUNT(*),'개') AS COUNT
 FROM noodle
 group by company
 HAVING COUNT >=3 ;
 
 SELECT * FROM noodle;
 SELECT NAME, company, date_format(e_date, '%Y년 %m월 %d일')
 FROM noodle
 WHERE (kind = 'M') AND (price>=800) ; 
 
 
SELECT concat(MAX(price),'원') AS PRICE
 FROM noodle;

SELECT company ,concat(min(price),'원') AS PRICE
FROM noodle
GROUP BY company
ORDER BY company;

SELECT company, concat(sum(price),'원') AS 제조사별합계
FROM noodle
GROUP BY company
ORDER BY sum(price) ASC; 

SELECT company, concat(round(AVG(price),0),'원') AS 제조사별평균
FROM noodle
GROUP BY company
ORDER BY round(AVG(price),0) DESC;

SHOW VARIABLES LIKE 'c%';
