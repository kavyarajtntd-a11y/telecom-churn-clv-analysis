"""Run AFTER sql/01_create_star_schema.sql in MySQL 8.0+.
Requires: pip install mysql-connector-python pandas
Credentials from environment: MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASSWORD.
Example (PowerShell): $env:MYSQL_USER="root"; $env:MYSQL_PASSWORD="your-password"
Never commit secrets to GitHub.
"""
from pathlib import Path
import os
import pandas as pd
import mysql.connector

ROOT = Path(__file__).resolve().parents[1]
cnx = mysql.connector.connect(
    host=os.getenv('MYSQL_HOST', 'localhost'),
    port=int(os.getenv('MYSQL_PORT', '3306')),
    user=os.getenv('MYSQL_USER', 'root'),
    password=os.environ['MYSQL_PASSWORD'],
    database='telecom_churn_clv',
)
files = [
    ('dim_customer', ['customer_id','gender','senior_citizen','partner','dependents']),
    ('dim_services', ['service_key','PhoneService','MultipleLines','InternetService','OnlineSecurity','OnlineBackup','DeviceProtection','TechSupport','StreamingTV','StreamingMovies']),
    ('dim_contract', ['contract_key','Contract','PaperlessBilling','PaymentMethod']),
    ('fact_subscriptions', ['customer_id','service_key','contract_key','tenure','monthly_charges','total_charges','churn']),
]
try:
    cursor = cnx.cursor()
    for name, cols in files:
        data = pd.read_csv(ROOT / 'data' / 'warehouse' / (name+'.csv'))
        assert list(data.columns)==cols, name+' columns mismatch'
        # For idempotent reloads, use UPSERT. Foreign keys enforce valid dimension mappings.
        names = ', '.join('`'+s+'`' for s in cols)
        args = ', '.join(['%s']*len(cols))
        updates = ', '.join('`'+s+'`=VALUES(`'+s+'`)' for s in cols[1:])
        statement = f'INSERT INTO `{name}` ({names}) VALUES ({args}) ON DUPLICATE KEY UPDATE {updates}'
        cursor.executemany(statement, list(data.itertuples(index=False, name=None)))
        cnx.commit()
        cursor.execute(f'SELECT COUNT(*) FROM `{name}`')
        print(name, cursor.fetchone()[0])
    cursor.execute('SELECT COUNT(*) FROM fact_subscriptions')
    assert cursor.fetchone()[0]==7043
    print('All data loaded and validated.')
finally:
    cnx.close()
