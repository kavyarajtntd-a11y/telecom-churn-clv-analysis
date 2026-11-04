# Telecom Churn Prediction & Customer Lifetime Value (CLV) Analysis

## Project overview
Academic data analytics project using the IBM Telco Customer Churn sample to investigate churn, estimate a revenue-based CLV proxy and plan a retention analytics dashboard.

## Dataset source
- Kaggle: https://www.kaggle.com/datasets/blastchar/telco-customer-churn
- Local data file: `data/WA_Fn-UseC_-Telco-Customer-Churn.csv`
- 7,043 customer records, 21 columns.

## Phase 1 contents
- `phase1_notebook.ipynb`: Project proposal, planned work, raw CSV loading and initial inspection.
- `data/WA_Fn-UseC_-Telco-Customer-Churn.csv`: Approved dataset, unchanged.
- `SRS.pdf`: Software Requirements Specification supplied with the project.

## How to run
1. Install Python 3, Jupyter Notebook and Pandas (`pip install notebook pandas`).
2. Open a terminal in this repository's root folder.
3. Run `jupyter notebook` and open `phase1_notebook.ipynb`.
4. Choose **Restart & Run All**. The notebook reads the CSV using a relative path from the repository root.

## Tools planned for future phases
Excel, Python (Pandas and scikit-learn), MySQL and Power BI.

## Limitations
Customer lifetime value will be an estimated revenue proxy because customer acquisition costs, contribution margins and observed future lifetimes are unavailable in the dataset. Associations with churn should not be interpreted as causal effects.
