# Telecom Churn Prediction & Customer Lifetime Value (CLV) Analysis

## Phase 1: Project Proposal and Initial Dataset Inspection

## 1. Project Overview

This project focuses on analysing customer churn and exploring Customer Lifetime Value (CLV) in the telecommunications industry.

Customer churn refers to customers discontinuing their services with a company. High churn rates affect recurring revenue and customer retention.

The project uses the IBM Telco Customer Churn dataset to examine customer demographics, subscription details, service usage, and billing information.

Phase 1 focuses on defining the business problem, establishing project objectives, documenting dataset information, and performing initial dataset inspection using Python and Pandas.

Detailed data cleaning, exploratory data analysis, predictive modelling, and dashboard development are outside the scope of Phase 1.

## 2. Business Problem

Telecommunications companies face challenges retaining customers and maintaining recurring revenue.

Customer churn affects business performance, particularly when customers discontinue services or switch to competitors.

Understanding customer characteristics associated with churn helps businesses identify potential retention concerns.

This project aims to investigate customer churn patterns based on contract type, tenure, internet services, and monthly charges.

## 3. Project Objectives

The project aims to:

1. Measure overall customer churn and compare churn rates across contract types and internet service categories.
2. Identify at least three customer characteristics associated with churn.
3. Examine relationships between customer tenure, monthly charges, and churn.
4. Calculate Average Revenue Per User (ARPU) and estimate a revenue-based Customer Lifetime Value (CLV) proxy.
5. Identify customer segments for further retention analysis.

During Phase 1, these objectives are documented as planned analytical activities. The actual analysis will take place in subsequent phases.

## 4. Dataset Information

**Dataset Name:** Telco Customer Churn

**Source:** IBM sample dataset, distributed through Kaggle

**Dataset Link:**
https://www.kaggle.com/datasets/blastchar/telco-customer-churn

**File Name:** `WA_Fn-UseC_-Telco-Customer-Churn.csv`

**File Format:** CSV

**Number of Records:** 7,043

**Number of Columns:** 21

**Data Domain:** Telecommunications and Customer Analytics

Each row represents one customer record containing demographic details, subscription information, billing data, and churn status.

### Key Dataset Fields

| Column          | Description                                             |
| --------------- | ------------------------------------------------------- |
| customerID      | Unique customer identifier                              |
| gender          | Customer gender                                         |
| SeniorCitizen   | Senior citizen indicator                                |
| tenure          | Number of months the customer has been with the company |
| InternetService | Type of internet service                                |
| Contract        | Customer contract type                                  |
| PaymentMethod   | Customer payment method                                 |
| MonthlyCharges  | Monthly subscription charges                            |
| TotalCharges    | Total recorded charges                                  |
| Churn           | Customer churn status                                   |

## 5. Phase 1 Activities

Phase 1 includes the following activities.

### 5.1 Topic and Dataset Approval

The project topic and dataset have been approved.

**Approved Topic:** Telecom Churn Prediction & Customer Lifetime Value (CLV) Analysis

**Approved Dataset:** IBM Telco Customer Churn

### 5.2 Project Proposal

The Jupyter Notebook documents:

* Project Title and Domain
* Project Overview
* Business Problem
* Project Objectives
* Business Value and Use Case
* Dataset Information
* Planned Analysis
* Scope and Limitations

### 5.3 Initial Dataset Inspection

The dataset is loaded using Python and Pandas.

The initial inspection includes:

* Loading the original CSV file.
* Displaying the first five records using `head()`.
* Checking dataset dimensions using `shape`.
* Inspecting column information using `info()`.
* Reviewing column data types using `dtypes`.
* Identifying initial data-quality concerns.

### Initial Observations

The dataset contains 7,043 records and 21 columns.

The `TotalCharges` column is initially stored as text rather than a numeric data type.

Initial inspection identifies 11 blank-string entries in `TotalCharges`.

These observations will guide data preparation in subsequent project phases.

No data cleaning or transformations are performed during Phase 1.

## 6. Tools and Technologies

The following tools are used during Phase 1:

| Tool             | Purpose                                    |
| ---------------- | ------------------------------------------ |
| Python           | Dataset loading and inspection             |
| Pandas           | DataFrame operations and structural checks |
| Jupyter Notebook | Project documentation and Python execution |
| GitHub           | Version control and project submission     |
| CSV              | Original dataset storage                   |

## 7. Repository Structure

```text
telecom-churn-clv-analysis/
│
├── README.md
├── Telecom_Churn_CLV_Phase1_SRS.docx
├── telecom-churn-clv-analysis_phase1.ipynb
│
└── data/
    └── WA_Fn-UseC_-Telco-Customer-Churn.csv
```

## 8. How to Run the Notebook

### Step 1: Download the Repository

Download the GitHub repository as a ZIP file or clone the repository.

### Step 2: Install Requirements

Ensure Python 3 is installed.

Install Jupyter Notebook and Pandas using:

```bash
pip install notebook pandas
```

### Step 3: Launch Jupyter Notebook

Open a terminal in the project's root directory.

Run:

```bash
jupyter notebook
```

### Step 4: Open the Notebook

Open:

`telecom-churn-clv-analysis_phase1.ipynb`

### Step 5: Execute the Notebook

Select **Restart & Run All**.

The notebook loads the dataset using the following relative path:

```python
from pathlib import Path
import pandas as pd

dataset_path = Path("data/WA_Fn-UseC_-Telco-Customer-Churn.csv")

df = pd.read_csv(dataset_path)
```

The notebook displays the dataset's first five rows, dimensions, column information, and data types.

## 9. Expected Phase 1 Outputs

The expected deliverables are:

1. Approved project topic and dataset.
2. Jupyter Notebook containing the project proposal.
3. Initial dataset inspection using Pandas.
4. Software Requirements Specification (SRS).
5. README.md documenting the project.
6. GitHub repository containing the notebook, SRS, README, and dataset.

## 10. Scope and Limitations

Phase 1 focuses on project planning, documentation, and initial dataset inspection.

The dataset contains customer records from an IBM sample telecommunications dataset rather than live customer information.

The project does not have access to actual customer acquisition costs, profit margins, or observed future customer lifetimes.

Customer Lifetime Value will therefore be estimated using a revenue-based proxy in subsequent phases.

Customer churn patterns will be interpreted as associations rather than established causal relationships.

Detailed data cleaning, exploratory analysis, machine learning, and Power BI visualisations are not included in Phase 1.

## 11. Phase 1 Project Status

| Activity                       | Status    |
| ------------------------------ | --------- |
| Topic selection                | Completed |
| Topic approval                 | Completed |
| Dataset selection              | Completed |
| Dataset approval               | Completed |
| Project proposal               | Completed |
| Dataset loading and inspection | Completed |
| SRS preparation                | Completed |
| README documentation           | Completed |
| GitHub repository creation     | Completed |
| Final repository verification  | Pending   |

## 12. Summary

Phase 1 establishes the foundation for the Telecom Churn Prediction & Customer Lifetime Value (CLV) Analysis project.

The approved dataset contains 7,043 customer records and 21 columns covering demographic information, subscription services, billing details, and churn status.

The project proposal defines the business problem, objectives, expected business value, analytical approach, and limitations.

Initial dataset inspection has been documented using Python and Pandas.

The project is prepared for subsequent phases involving data cleaning, exploratory analysis, and customer churn analytics.
