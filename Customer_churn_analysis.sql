create database telco_customer_churn;

select count(*) as total_customers
from telco_churn;

select count(*) as churned_customers
from telco_churn
where churn = 'Yes';

select (count(case when churn = 'Yes' then 1 end) * 100.0 / count(*))
as churn_percentage
from telco_churn;

select gender, count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churn_count
from telco_churn
group by gender;

select contract, count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churn_count
from telco_churn
group by Contract;

select Churn, avg(MonthlyCharges) as avg_monthly_charge
from telco_churn
group by Churn;

select Churn, avg(tenure) as avg_tenure
from telco_churn
group by Churn;

select PaymentMethod, count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churn_count
from telco_churn
group by PaymentMethod;


select SeniorCitizen, count(*) as total_customers, sum(case when churn = 'Yes' then 1 else 0 end) as churn_count
from telco_churn
group by SeniorCitizen;

select InternetService, count(*) as total_customers, sum(case when churn = 'Yes' then 1 else 0 end) as churn_count
from telco_churn
group by InternetService;


select customerID, MonthlyCharges, Contract
from telco_churn
where Contract = 'Month-to-month'
order by monthlyCharges DESC
limit 5;














































































