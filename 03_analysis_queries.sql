-- Customers spending above their country's average

SELECT
    cs.full_name,
    cs.country,
    cs.risk_rating,
    cs.total_amount,
    (
        SELECT AVG(total_amount)
        FROM v_customer_spending
        WHERE country = cs.country
    ) AS country_average
FROM v_customer_spending cs
WHERE cs.total_amount >
(
    SELECT AVG(total_amount)
    FROM v_customer_spending
    WHERE country = cs.country
)
ORDER BY cs.total_amount DESC
LIMIT 20;


-- Self join comparison of similar customers

SELECT
    a.country,
    a.risk_rating,
    a.full_name AS customer_1,
    b.full_name AS customer_2,
    a.total_amount AS customer1_spending,
    b.total_amount AS customer2_spending,
    ABS(a.total_amount - b.total_amount) AS spending_difference
FROM v_customer_spending a
JOIN v_customer_spending b
ON a.country = b.country
AND a.risk_rating = b.risk_rating
AND a.customer_id < b.customer_id
ORDER BY spending_difference DESC
LIMIT 20;