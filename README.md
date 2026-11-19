# Telecom Churn Prediction & Customer Lifetime Value (CLV) Analysis

## Project overview

This academic data analytics project uses the IBM Telco Customer Churn sample to investigate churn and prepare for a revenue-based customer lifetime value (CLV) estimate. Phase 1 established the research proposal and inspected the dataset. Phase 2 focuses on data quality, cleaning, categorical encoding and a feature-scaling demonstration. Churn modelling, CLV estimation, SQL modelling and Power BI reporting are planned for later stages.

## Business problem and objectives

Telecommunications providers need to understand customer churn and the recurring revenue associated with different subscriber groups. The planned analysis will compare churn across contract types, internet services and customer tenure; examine billing and support-service patterns; calculate revenue metrics; and evaluate churn classification models in later phases. Observed patterns do not establish causal explanations.

## Approved dataset

- **Dataset:** Telco Customer Churn (IBM sample distributed via Kaggle)
- **Source:** https://www.kaggle.com/datasets/blastchar/telco-customer-churn
- **Original file:** `data/WA_Fn-UseC_-Telco-Customer-Churn.csv`
- **Format:** CSV; **7,043 rows and 21 columns**; one record per customer
- **Important fields:** `customerID`, `tenure`, `Contract`, `InternetService`, `PaymentMethod`, `MonthlyCharges`, `TotalCharges`, `Churn`

## Phase 1: Accepted

The Phase 1 notebook records the project domain, overview, business problem, objectives, business value, dataset information, planned analysis and limitations. It reads the original CSV with Pandas and displays `head()`, `shape`, `info()` and data types. Initial inspection identified 11 whitespace-only entries in `TotalCharges`.

## Phase 2: Data cleaning and preprocessing

The combined Phase 1 and Phase 2 notebook performs the following steps:

1. Make a working copy while keeping the original dataset unchanged.
2. Inspect missing values, blank strings, duplicate rows and duplicate `customerID` values.
3. Strip leading/trailing whitespace from text fields.
4. Convert `TotalCharges` to a numeric data type using `pd.to_numeric(errors="coerce")`.
5. Set missing `TotalCharges` values to zero **only for records with `tenure == 0`**, then validate the result.
6. Review numerical ranges and categorical values without automatically dropping observations.
7. Map Yes/No variables to 0/1, encode gender consistently with the source sample, and one-hot encode remaining multi-category variables.
8. Demonstrate `StandardScaler` for `tenure` and `MonthlyCharges` in a separate preview. The exported encoded CSV remains **unscaled**. Any future predictive pipeline must fit preprocessing on training data only.
9. Validate the datasets and export cleaned and encoded CSV files for later work.

### Phase 2 outputs

- `data/processed/telco_cleaned.csv`: The cleaned 7,043-row customer-level dataset. Original category labels are retained for exploratory analysis and reporting.
- `data/processed/telco_encoded.csv`: Numerical categorical encodings for later modelling preparation, without `customerID`. This file is not a finished train/test modelling pipeline.

## Repository structure

```text
telecom-churn-clv-analysis/
├── README.md
├── Telecom_Churn_CLV_Phase1_SRS.docx
├── Telecom_Churn_CLV_Phase1_Phase2_SRS.docx
├── telecom-churn-clv-analysis_phase1.ipynb
├── telecom-churn-clv-analysis_phase1_phase2.ipynb
└── data/
    ├── WA_Fn-UseC_-Telco-Customer-Churn.csv
    └── processed/
        ├── telco_cleaned.csv
        └── telco_encoded.csv
```

The names above match the recommended upload names. If your GitHub filenames differ, update this section to reflect the files actually present.

## How to run

1. Download or clone this repository.
2. Install Python 3 and the required libraries:

   ```bash
   pip install notebook pandas numpy scikit-learn
   ```

3. From the **repository root**, start Jupyter Notebook:

   ```bash
   jupyter notebook
   ```

4. Open `telecom-churn-clv-analysis_phase1_phase2.ipynb` and choose **Restart & Run All**.
5. Confirm the notebook reads `data/WA_Fn-UseC_-Telco-Customer-Churn.csv`, validates the cleaned dataset and creates the two files in `data/processed/`.

## Validation and limitations

- Expected source shape: **(7043, 21)**.
- Expected hidden blank entries in `TotalCharges`: **11** before cleaning.
- In the approved sample, the 11 blank charge records correspond to zero-tenure customers and are assigned zero charges. The raw CSV is preserved.
- The dataset is a sample snapshot, without acquisition cost, profit margins or observed future subscriber lifetimes. Any eventual CLV will therefore be an **assumption-based revenue proxy**, not realised profit.
- The `Churn` label indicates recorded churn status, not verified next-month cancellation.
- Feature scaling demonstrated on the full data is **illustrative only**, not for evaluating models. Later modelling must use training-only fitted preprocessing and a separate test set.

## Project status

- **Phase 1:** Accepted.
- **Phase 2:** Notebook prepared and executed locally; documentation and processed datasets prepared for GitHub submission. Instructor acceptance pending.
- **Later phases:** Exploratory analysis, CLV proxy, churn classification, MySQL and Power BI.
