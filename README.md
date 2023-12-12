# Time Series Anomolies Dections

The presented tasks aim to identify an anomaly detection mechanism on time series data.
Should there be a sudden or drastic fluctuation from expected statistical measures,
these values should be predicted (or flagged) as potential issues which require action or investigation.

CreateDabase-imports.sql
-> Database creation storing training and testing datasets

Dervico.ipynb
-> Random Forest and Support Vector Machines for Time Series Classification of Anomaly Classes
SVM Training AUC: 0.90
SVM Testing AUC: 0.43

RF Training AUC: 1.00
RF Testing AUC: 0.73

Dervico_Z-Score.ipynb
-> Addressing anomaly classes using Z-Scores with varying thresholds

SQL-Query.sql
-> Data validation on anomaly classes




