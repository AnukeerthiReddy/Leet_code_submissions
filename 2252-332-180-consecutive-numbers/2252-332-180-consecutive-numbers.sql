SELECT distinct(num) AS ConsecutiveNums
FROM (
  SELECT num,
         LAG(num, 1) OVER (ORDER BY id) AS prev_num,
         LEAD(num, 1) OVER (ORDER BY id) AS next_num
  FROM Logs
) AS Subquery
WHERE num = prev_num AND num = next_num;