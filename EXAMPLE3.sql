SELECT
    TO_CHAR (HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO,
    COUNT(*) as CNT
FROM EMP
GROUP BY TO_CHAR (HIREDATE, 'YYYY'), DEPTNO;
