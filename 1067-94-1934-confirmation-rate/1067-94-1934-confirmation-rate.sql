# Write your MySQL query statement below
SELECT 
    s.user_id, 
    round((COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) / COUNT(*)),2) AS confirmation_rate
FROM 
    Signups s
left JOIN 
    Confirmations c 
ON 
    s.user_id = c.user_id
GROUP BY 
    s.user_id;

