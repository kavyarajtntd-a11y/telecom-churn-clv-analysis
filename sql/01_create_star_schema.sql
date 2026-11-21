-- Phase 3: star-schema storage for the IBM Telco Customer Churn sample
-- Run in MySQL 8.0+ before executing load_mysql.py.
CREATE DATABASE IF NOT EXISTS telecom_churn_clv
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE telecom_churn_clv;

CREATE TABLE IF NOT EXISTS dim_customer (
  customer_id VARCHAR(20) PRIMARY KEY,
  gender VARCHAR(20) NOT NULL,
  senior_citizen TINYINT UNSIGNED NOT NULL,
  partner VARCHAR(3) NOT NULL,
  dependents VARCHAR(3) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS dim_services (
  service_key INT PRIMARY KEY,
  PhoneService VARCHAR(3) NOT NULL,
  MultipleLines VARCHAR(25) NOT NULL,
  InternetService VARCHAR(20) NOT NULL,
  OnlineSecurity VARCHAR(25) NOT NULL,
  OnlineBackup VARCHAR(25) NOT NULL,
  DeviceProtection VARCHAR(25) NOT NULL,
  TechSupport VARCHAR(25) NOT NULL,
  StreamingTV VARCHAR(25) NOT NULL,
  StreamingMovies VARCHAR(25) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS dim_contract (
  contract_key INT PRIMARY KEY,
  Contract VARCHAR(20) NOT NULL,
  PaperlessBilling VARCHAR(3) NOT NULL,
  PaymentMethod VARCHAR(35) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS fact_subscriptions (
  customer_id VARCHAR(20) PRIMARY KEY,
  service_key INT NOT NULL,
  contract_key INT NOT NULL,
  tenure SMALLINT UNSIGNED NOT NULL,
  monthly_charges DECIMAL(10,2) NOT NULL,
  total_charges DECIMAL(12,2) NOT NULL,
  churn TINYINT UNSIGNED NOT NULL,
  CONSTRAINT fk_fact_customer FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
  CONSTRAINT fk_fact_services FOREIGN KEY (service_key) REFERENCES dim_services(service_key),
  CONSTRAINT fk_fact_contract FOREIGN KEY (contract_key) REFERENCES dim_contract(contract_key),
  INDEX idx_fact_service (service_key),
  INDEX idx_fact_contract (contract_key),
  INDEX idx_fact_churn (churn),
  CHECK (churn IN (0,1))
) ENGINE=InnoDB;
