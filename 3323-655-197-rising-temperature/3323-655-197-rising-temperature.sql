# Write your MySQL query statement below
SELECT b.id
FROM weather AS a
JOIN weather AS b
  ON a.recordDate = DATE_ADD(b.recordDate, INTERVAL -1 DAY)
WHERE b.temperature > a.temperature