SELECT
    DEPTNO,
    TRUNC(AVG(SAL),0) AS AVG_SAL,
    MAX(SAL) AS MAX_SAL, 
    MIN(SAL) AS MIN_SAL, 
    COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNo;
