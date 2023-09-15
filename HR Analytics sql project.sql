create database hr_analytics;
use hr_analytics;
desc hr_1;
desc hr_2;
show tables;
select * from hr_1;
select * from hr_2;

-- KPI-1 : Average Attrition Rate for All Department --
SELECT department,
    CONCAT(Round(AVG(attrition = 'yes') * 100, 2),' %') AS Average_Attrition_Rate
FROM hr_1
group by department;

-- KPI-2 : Average Hourly Rate for Male Research Scientist --
select JobRole, Round(avg(hourlyrate),2) as Average_HourlyRate, Gender
from hr_1
where jobrole = 'Research Scientist' and gender = 'Male';

-- KPI-3 : AttritionRate VS MonthlyIncomeStats against department -- 
SELECT a.department,
  CONCAT(Round(AVG(attrition = 'yes') * 100, 2),' %') AS Average_Attrition_Rate,
  round(AVG(b.monthlyincome)) AS Average_Monthly_Income
from hr_1 as a
inner join hr_2 as b ON b.Employeeid = a.employeenumber
group by a.department;

-- KPI-4 : Average Working Years for Each Department -- 
select a.department, round(avg(b.TotalWorkingYears),1) as Average_Working_Year
from hr_1 as a
inner join hr_2 as b on b.EmployeeID = a.EmployeeNumber
group by a.department;

-- KPI-5 : Job Role VS Work Life Balance -- 
select a.JobRole,
count(b.performancerating) as Total_Employee, round(avg(b.WorkLifeBalance),2) as Average_WorkLifeBalance_Rating
from hr_1 as a
inner join hr_2 as b on b.EmployeeID = a.Employeenumber
group by a.jobrole;

-- KPI-6 : Attrition Rate Vs Year Since Last Promotion Relation Against Job Role -- 
SELECT JobRole,
  CONCAT(Round(AVG(attrition = 'yes') * 100, 2),' %') AS Average_Attrition_Rate,
  Round(AVG(YearsSinceLastPromotion), 2) AS Average_YearsSinceLastPromotion
from hr_1 AS a
inner join hr_2 AS b ON b.employeeid = a.employeenumber
group by JobRole;





