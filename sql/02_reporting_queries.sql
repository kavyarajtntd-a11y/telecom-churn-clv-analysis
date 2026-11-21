-- Phase 3: MySQL 8.0+ reporting and reconciliation queries.
USE telecom_churn_clv;

-- Q1. Confirm row counts; fact should contain 7,043 records.
SELECT 'dim_customer' AS table_name, COUNT(*) AS rows_count FROM dim_customer
UNION ALL SELECT 'dim_services', COUNT(*) FROM dim_services
UNION ALL SELECT 'dim_contract', COUNT(*) FROM dim_contract
UNION ALL SELECT 'fact_subscriptions', COUNT(*) FROM fact_subscriptions;

-- Q2. Historical churn share in this snapshot, not a monthly churn rate.
SELECT COUNT(*) AS total_customers,
       SUM(churn) AS churned_customers,
       ROUND(100.0 * AVG(churn), 2) AS historical_churn_percent
FROM fact_subscriptions;

-- Q3. Churn % by contract and average monthly bill.
SELECT dc.Contract AS contract_type,
       COUNT(*) AS customer_count,
       SUM(f.churn) AS churned,
       ROUND(100.0 * AVG(f.churn), 2) AS churn_percent,
       ROUND(AVG(f.monthly_charges), 2) AS avg_monthly_charges
FROM fact_subscriptions f
JOIN dim_contract dc ON dc.contract_key = f.contract_key
GROUP BY dc.Contract
ORDER BY churn_percent DESC;

-- Q4. Churn % by internet service.
SELECT ds.InternetService AS internet_service,
       COUNT(*) AS customer_count,
       ROUND(100.0 * AVG(f.churn), 2) AS churn_percent
FROM fact_subscriptions f
JOIN dim_services ds ON ds.service_key = f.service_key
GROUP BY ds.InternetService
ORDER BY churn_percent DESC;

-- Q5. Average revenue per retained subscriber (ARPU proxy for this snapshot).
-- MonthlyCharges is listed subscription charge, not verified collected revenue.
SELECT COUNT(*) AS retained_subscribers,
       ROUND(SUM(monthly_charges), 2) AS listed_monthly_charges,
       ROUND(AVG(monthly_charges), 2) AS arpu_proxy
FROM fact_subscriptions
WHERE churn = 0;

-- Q6. Top quartile by historical charges; segmentation is not true future CLV.
WITH ranked AS (
  SELECT customer_id, total_charges,
         NTILE(4) OVER (ORDER BY total_charges DESC, customer_id) AS spend_quartile
  FROM fact_subscriptions
)
SELECT spend_quartile,
       COUNT(*) AS customers,
       ROUND(MIN(total_charges), 2) AS min_total_charges,
       ROUND(MAX(total_charges), 2) AS max_total_charges
FROM ranked
GROUP BY spend_quartile
ORDER BY spend_quartile;

-- Q7. Illustrative gross revenue proxy only: assume 24 additional months per customer.
-- This is a scenario, not an observed remaining lifespan or profit-based CLV.
SELECT customer_id, monthly_charges,
       ROUND(monthly_charges * 24, 2) AS illustrative_24m_revenue
FROM fact_subscriptions
WHERE churn = 0
ORDER BY illustrative_24m_revenue DESC
LIMIT 10;

-- Q8. Foreign-key reconciliation: should return zero unmatched facts.
SELECT COUNT(*) AS unmatched_dimension_rows
FROM fact_subscriptions f
LEFT JOIN dim_customer c ON c.customer_id=f.customer_id
LEFT JOIN dim_services s ON s.service_key=f.service_key
LEFT JOIN dim_contract dc ON dc.contract_key=f.contract_key
WHERE c.customer_id IS NULL OR s.service_key IS NULL OR dc.contract_key IS NULL;
