DROP VIEW IF EXISTS v_customer_spending;

CREATE VIEW v_customer_spending AS
SELECT
    c.customer_id,
    c.full_name,
    COALESCE(c.country,'Unknown') AS country,
    COALESCE(c.risk_rating,'Unknown') AS risk_rating,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(COALESCE(SUM(t.amount),0),2) AS total_amount,
    ROUND(COALESCE(AVG(t.amount),0),2) AS avg_transaction
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN Transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.full_name,
    c.country,
    c.risk_rating;