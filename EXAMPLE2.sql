SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;
