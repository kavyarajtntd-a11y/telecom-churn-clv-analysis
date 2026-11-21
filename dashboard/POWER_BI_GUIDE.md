# Power BI Desktop: Reproduce the dashboard

## Sources and relationships
Import the four CSVs under `data/warehouse/` and name the tables `dim_customer`, `dim_services`, `dim_contract` and `fact_subscriptions`.

Model relationships: `fact_subscriptions[customer_id]` many-to-one to `dim_customer[customer_id]`; `fact_subscriptions[service_key]` many-to-one to `dim_services[service_key]`; `fact_subscriptions[contract_key]` many-to-one to `dim_contract[contract_key]`. Use one-direction filter propagation, dimension to fact.

## DAX measures

```dax
Total Customers = COUNTROWS(fact_subscriptions)
Churned Customers = CALCULATE(COUNTROWS(fact_subscriptions), fact_subscriptions[churn] = 1)
Retained Customers = CALCULATE(COUNTROWS(fact_subscriptions), fact_subscriptions[churn] = 0)
Recorded Churn Share = DIVIDE([Churned Customers], [Total Customers])
Retained Listed Monthly Charges = CALCULATE(SUM(fact_subscriptions[monthly_charges]), fact_subscriptions[churn] = 0)
Retained ARPU Proxy = DIVIDE([Retained Listed Monthly Charges], [Retained Customers])
Illustrative 24M Revenue Proxy = [Retained Listed Monthly Charges] * 24
```

Format `Recorded Churn Share` as percent. Show the proxy measures as USD with a note that currency is inherited from the teaching data and these are not verified billings.

## Suggested report pages

1. Executive: cards for customer count, historical churn share, retained customers, retained ARPU proxy.
2. Churn segments: bar chart of historical churn share by `dim_contract[Contract]` and `dim_services[InternetService]`. Add payment method and senior citizen slicers.
3. Revenue scenario: 12, 24 and 36 month proxy comparisons, documenting the fixed-horizon assumptions.
4. Classification: import `reports/model_comparison.csv` for F1/ROC-AUC comparison. Test-set predictions in `reports/holdout_retention_priorities.csv` are demonstration-only and should be labeled accordingly.

## Validation

Check customer count = 7,043, churned count = 1,869, and retained count = 5,174. Confirm no ambiguous relationships. The native `.pbix` must be saved separately in Power BI Desktop.
