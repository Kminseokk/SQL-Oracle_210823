SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
  GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
  ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
  GROUP BY ROLLUP(DEPTNO, JOB);

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
  GROUP BY CUBE(DEPTNO, JOB);


SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
  GROUP BY GROUPING SETS(DEPTNO, JOB);


sELECT DEPTNO, LISTAGG(ENAME, ‘,’) WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES
  FROM EMP
  GROUP BY DEPTNO;

SELECT DEPTNO, JOB, MAX(SAL)
  FROM EMP
  GROUP BY DEPTNO, JOB
  ORDER BY DEPTNO, JOB;
  
SELECT *
  FROM (SELECT DEPTNO, JOB, SAL FROM EMP)
  PIVOT(MAX(SAL) FOR DEPTNO IN (10, 20, 30))
  ORDER BY JOB;


SELECT * 
FROM ( SELECT DEPTNO,
  MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK",
  MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN",
  MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT",
  MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER",
  MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
  FROM EMP
  GROUP BY DEPTNO
  ORDER BY DEPTNO
  )
UNPIVOT(
  SAL FOR JOB IN (CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST)
  )
ORDER BY DEPTNO, JOB;

------------------------------------------------


select * from subway_statistics

--잠실이 들어간 역들을 조회하고 싶다면?

  station_name like '잠실%'

 

 

-- 잠실이 들어간 역들이면서 탑승 시간이 7이거나 9인 데이터를 조회하고 싶다면?

  and (boarding_time = 7 or boarding_time=9)

  and boarding_time in (7, 9)

 

 

-- 구분을 승차한 사람을 보고 싶다면?

  gubun = '승차'

 

 

 --탑승일(YY/DD/MM)에서 요일까지 출력되기를 원한다면?

  to_char(boarding_date,'DY')as day

 

 

-- 잠실역에서 가장 많은 승객수를 기준으로 정렬되기를 원한다면?

  select * from subway_statistics
    where station_name like '잠실(216)' 
    ORDER BY passenger_number desc

 

 

-- 정렬된 값을 기준으로, 조건을 넣고 싶다면?

  group by ~~

  having sum(~~) between ~~ and ~~

  order by ~~

SELECT * 
FROM EMP, DEPT
ORDER BY EMPNO;

SELECT * 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
	E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;
---------------------------------------------------
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
	E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO
ORDER BY E1.EMPNO;

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
  DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING (DEPTNO)
WHERE SAL > = 3000
ORDER BY DEPTNO, E.EMPNO;

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
	E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE SAL > = 3000
ORDER BY E.DEPTNO, EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
	E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;
 
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
	E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO, MGR_EMPNO;
 
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
	E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;
