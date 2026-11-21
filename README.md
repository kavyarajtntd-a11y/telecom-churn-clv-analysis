# Telecom Churn Prediction & Customer Lifetime Value (CLV) Analysis

## Final Project | Single Jupyter Notebook

This academic project explores recorded churn in the IBM Telco Customer Churn sample, prepares data for analysis, constructs a MySQL star schema, models recorded churn status, estimates a transparent revenue-based customer value scenario, and presents findings in charts and an interactive HTML dashboard preview.

**Original source:** https://www.kaggle.com/datasets/blastchar/telco-customer-churn  
**Data:** 7,043 customer records and 21 columns, in `data/WA_Fn-UseC_-Telco-Customer-Churn.csv`.  
**Main notebook:** `telecom-churn-clv-analysis.ipynb` (contains all phases in one file).

## What is included

| Phase | Contents |
|---|---|
| 1 | Problem statement, objectives, dataset approval information, initial inspection |
| 2 | Raw-data preservation, missing values, duplicate checks, `TotalCharges` repair, categorical encoding and scaling demonstration |
| 3 | Three dimension tables, subscription fact table, CSV warehouse exports, MySQL DDL, SQL reporting queries and optional importer |
| 4 | Churn by contract, internet service and payment method; tenure and billing comparisons; ARPU proxy; 12/24/36-month revenue value scenarios |
| 5 | Majority baseline, Logistic Regression and Random Forest classification, held-out metrics and model export |
| 6 | Executive metrics, charts, Plotly interactive dashboard preview and Power BI build instructions |

## Run the complete notebook

1. Extract or clone the repository, preserving the `data/` folder.
2. Install Python 3.10+ and dependencies: `pip install -r requirements.txt`.
3. From the repository root, launch `jupyter notebook` and open `telecom-churn-clv-analysis.ipynb`.
4. Select **Restart & Run All**. The notebook regenerates the processed data, warehouse extracts, charts, model and report CSVs.
5. Open `dashboard/telecom_analytics_preview.html` in a browser for an interactive dashboard preview. This file is **not a Power BI .pbix**.

## MySQL Workbench setup (manual, requires local MySQL server)

1. Run `sql/01_create_star_schema.sql` in MySQL Workbench (MySQL 8+).
2. Install `mysql-connector-python` (included in requirements.txt).
3. Set `MYSQL_PASSWORD` in your environment and optionally `MYSQL_USER`, `MYSQL_HOST`, `MYSQL_PORT`. Never commit secrets.
4. Run `python scripts/load_mysql.py` from the repository root.
5. Run `sql/02_reporting_queries.sql`; compare row counts and totals with notebook output.

**Execution disclosure:** The Python notebook was executed successfully and generated its files. MySQL creation and import were **not tested against a live MySQL server** in this package.

## Power BI Desktop setup (manual)

1. Import `data/warehouse/dim_customer.csv`, `dim_services.csv`, `dim_contract.csv`, `fact_subscriptions.csv`.
2. Define single-direction many-to-one relationships from fact keys to matching dimension keys.
3. Add DAX measures from `dashboard/POWER_BI_GUIDE.md`.
4. Build KPI cards, churn rates by contract/service, revenue views and slicers. Save a `.pbix` locally if the instructor requires one.

**Execution disclosure:** A functional Plotly HTML dashboard is supplied. A native Power BI `.pbix` is **not included** and requires Power BI Desktop.

## Snapshot findings

- 7,043 recorded customers, 1,869 marked churned, historical recorded churn share **26.54%**.
- Recorded churn shares: month-to-month **42.71%**, one-year **11.27%**, two-year **2.83%**. These are associations, not evidence that contract changes cause retention.
- 5,174 customers are marked retained. Mean listed monthly charges in this group: **$61.27** (a **snapshot ARPU proxy**, not audited realised monthly revenue).
- On a stratified 20% hold-out split, Logistic Regression achieved F1 **0.591**, ROC-AUC **0.839**; Random Forest F1 **0.558**, ROC-AUC **0.834**. These are retrospective cross-sectional classification metrics, not a validated future churn forecast.

## Methodological limitations

- The data lacks churn event dates, real customer future lifetimes, marketing intervention results, acquisition costs and profit margins.
- The value calculation is an illustrative 12/24/36-month **revenue scenario**, `MonthlyCharges × assumed horizon`, not observed or profit-based CLV. Churn snapshot share is not a monthly hazard rate.
- `Churn` describes recorded status, not a verified next-month event.
- Train/test split precedes learned preprocessing. The encoded CSV is an exploratory artifact, not a replacement for training-only preprocessing.
- No recommendations establish causal effects or guarantee improved retention.

## Deliverables

- `telecom-churn-clv-analysis.ipynb`: single combined notebook with execution outputs.
- `Telecom_Churn_CLV_SRS.docx`: project requirements, including phases 3–6 addendum.
- `data/`: raw, cleaned, encoded, revenue proxy and star-schema exports.
- `sql/`: MySQL table definitions and reporting queries.
- `scripts/load_mysql.py`: optional MySQL import utility.
- `reports/`: computed KPIs, model comparisons, segment tables, charts, and a final summary.
- `models/churn_classifier.joblib`: fitted academic classification pipeline; load only from trusted sources.
- `dashboard/telecom_analytics_preview.html`: interactive Plotly preview.
- `dashboard/POWER_BI_GUIDE.md`: suggested Power BI relationships, DAX measures and visuals.

## Submission status

Python analytics: **executed and validated**. MySQL live execution: **pending on user's machine**. Native Power BI `.pbix`: **pending manual build**. Both items are described here rather than represented as complete.
