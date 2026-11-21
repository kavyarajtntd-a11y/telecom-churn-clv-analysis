# Final findings and interpretation

Dataset: IBM Telco Customer Churn sample, 7,043 customer records.

## Observed descriptive results

- Churn label is Yes for **1,869** customers, or **26.54%** of the snapshot.
- Month-to-month customers: **1,655 of 3,875**, recorded churn share **42.71%**.
- One-year contract: **166 of 1,473**, **11.27%**.
- Two-year contract: **48 of 1,695**, **2.83%**.
- The **5,174** retained accounts have an average listed monthly charge of **$61.27**, a snapshot ARPU proxy.

## Predictive evaluation

Held-out stratified 20% test results (random_state=42):

| Model | Accuracy | Precision | Recall | F1 | ROC-AUC |
|---|---:|---:|---:|---:|---:|
| Majority baseline | 0.735 | 0.000 | 0.000 | 0.000 | 0.500 |
| Logistic regression | 0.798 | 0.638 | 0.551 | 0.591 | 0.839 |
| Random forest | 0.794 | 0.649 | 0.489 | 0.558 | 0.834 |

Logistic regression was evaluated along with Random Forest. Final model choice uses training-only cross-validation, not comparison of test-set F1.

## Customer value

The project uses hypothetical **12-, 24-, and 36-month revenue scenarios**, calculated from listed monthly charges. These are not actual future revenues, margins, or profit-based CLV. A single snapshot churn share must not be inverted into expected monthly lifespan.

## Recommendations for further study

Investigate differences across contract and service segments, run prospective validation using dated subscription data, assess fairness and calibration, and test any retention intervention experimentally before using risk scores operationally.

## Status

Python notebook executed and artifacts generated. MySQL server execution and a native Power BI `.pbix` are not supplied or verified in this package.
