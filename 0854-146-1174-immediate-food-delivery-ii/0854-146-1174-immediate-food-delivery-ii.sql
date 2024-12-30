# Write your MySQL query statement below
WITH FirstOrders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM 
        delivery
    GROUP BY 
        customer_id
),
ImmediateFirstOrders AS (
    SELECT 
        f.customer_id,
        CASE 
            WHEN d.order_date = d.customer_pref_delivery_date THEN 1 
            ELSE 0 
        END AS is_immediate
    FROM 
        FirstOrders f
    JOIN 
        delivery d 
    ON 
        f.customer_id = d.customer_id AND f.first_order_date = d.order_date
)
SELECT 
    ROUND(SUM(is_immediate) / COUNT(*) * 100, 2) AS immediate_percentage
FROM 
    ImmediateFirstOrders;

