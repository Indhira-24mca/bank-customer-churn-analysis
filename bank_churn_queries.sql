CREATE TABLE bank_churn (
    RowNumber INT,
    CustomerId INT,
    Surname VARCHAR(50),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    Balance DECIMAL(10,2),
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary DECIMAL(10,2),
    Exited INT
);
SHOW TABLES;
SELECT COUNT(*) FROM bank_churn;
TRUNCATE TABLE bank_churn;
SELECT COUNT(*) FROM bank_churn;
SELECT exited,
       COUNT(*) AS total_customers
FROM bank_churn
GROUP BY exited;
SELECT geography,
       COUNT(*) AS total_customers,
       SUM(exited) AS churned_customers,
       ROUND(SUM(exited)*100.0/COUNT(*), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY geography
ORDER BY churn_rate_pct DESC;
SELECT gender,
       COUNT(*) AS total_customers,
       SUM(exited) AS churned,
       ROUND(SUM(exited)*100.0/COUNT(*), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY gender;
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 40 THEN '30-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age BETWEEN 51 AND 60 THEN '51-60'
        ELSE 'Above 60'
    END AS age_group,
    COUNT(*) AS total,
    SUM(exited) AS churned,
    ROUND(SUM(exited)*100.0/COUNT(*), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY age_group
ORDER BY churn_rate_pct DESC;
SELECT isactivemember,
       COUNT(*) AS total,
       SUM(exited) AS churned,
       ROUND(SUM(exited)*100.0/COUNT(*), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY isactivemember;
SELECT exited,
       ROUND(AVG(creditscore), 2) AS avg_credit_score,
       ROUND(AVG(balance), 2) AS avg_balance,
       ROUND(AVG(age), 2) AS avg_age
FROM bank_churn
GROUP BY exited;


