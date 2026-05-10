USE [Bank Loan DB]
SELECT * FROM bank_loan_data

------------------Total Loan Applications
select count(id) As Total_Loan_Applications from bank_loan_data

--------------MTD Total Loan Application
select count(id) As MTD_Total_Loan_Applications from bank_loan_data
where  month(issue_date) =12 AND year(issue_date) = 2021

------------Previous MTD total Loan Application
select count(id) As PMTD_Total_Loan_Applications from bank_loan_data
where  month(issue_date) =11 AND year(issue_date) = 2021

-----MOM Total Loan Application
-----(MTD-PMTD)/PMTD

-----Total Funded amount
Select SUM(loan_amount) AS Total_Funded_Amount from bank_loan_data

-------- MTD Total Funded Amount
Select SUM(loan_amount) AS MTD_Total_Funded_Amount from bank_loan_data
Where MONTH(issue_date) = 12 AND year(issue_date) = 2021

-----PMTD Total Funded Amount
Select SUM(loan_amount) AS PMTD_Total_Funded_Amount from bank_loan_data
Where MONTH(issue_date) = 11 AND year(issue_date) = 2021

------Total Recieved Amount
Select SUM(total_payment) as Total_amount_received FROM bank_loan_data

------MTD Total Recieved Amount
Select SUM(total_payment) as MTD_Total_amount_received FROM bank_loan_data
Where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

------PMTD Total Recieved Amount
Select SUM(total_payment) as PMTD_Total_amount_received FROM bank_loan_data
Where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

---Avarage Interest Rate
Select AVG(int_rate) * 100 AS Avg_Interest_Rate From bank_loan_data
---- to make it decimal
Select ROUND(AVG(int_rate),4) * 100 AS Avg_Interest_Rate From bank_loan_data

---MTD_Avarage Interest Rate
Select ROUND(AVG(int_rate),4) * 100 AS MTD_Avg_Interest_Rate From bank_loan_data
Where MONTH(issue_date) = 12 AND year(issue_date) = 2021

---PMTD_Avarage Interest Rate
Select ROUND(AVG(int_rate),4) * 100 AS PMTD_Avg_Interest_Rate From bank_loan_data
Where MONTH(issue_date) = 11 AND year(issue_date) = 2021

------AVG  DTI
Select ROUND(AVG(dti),4)* 100 as AVG_DTI from bank_loan_data

-----MTD AVG DTI
Select ROUND(AVG(dti),4)* 100 as MTD_AVG_DTI from bank_loan_data
where month(issue_date)= 12 AND YEAR(issue_date) = 2021

-----PMTD AVG DTI
Select ROUND(AVG(dti),4)* 100 as PMTD_AVG_DTI from bank_loan_data
where month(issue_date)= 11 AND YEAR(issue_date) = 2021

------------------------------------------------GOOD LOAN ISSUED-----------------------------------------------
--- Total Loan Status which is three 1. Fully Paid 2. Current 3. Charged off
Select loan_status from bank_loan_data

-----total no of percentage of good loan which is fully paid and current
Select (COUNT(CASE WHEN loan_status = 'Fully Paid'  OR  loan_status = 'Current' Then id END)* 100) 
		/  
		Count(id) AS Good_loan_percentage
		FROM bank_loan_data

--------Total good application Number
Select  COUNT(id) as Good_Loan_Application 	FROM bank_loan_data
	WHERE loan_status = 'Fully Paid'  OR  loan_status = 'Current' 
		
-------Good loan funded amount
Select  SUM(loan_amount) as Good_Loan_Funded_Amount	FROM bank_loan_data
	WHERE loan_status = 'Fully Paid'  OR  loan_status = 'Current'

------Good loan total payment received
Select SUM(total_payment) AS Good_Loan_Received_Amount From bank_loan_data
 WHERE loan_status = 'Fully Paid'  OR  loan_status = 'Current'
 -----------------------------------------------------BAD LOAN---------------------

 ----------total no of percentage of Bad loan
 Select  (COUNT(CASE WHEN loan_status = 'Charged off' THEN id END) * 100) 
			/
			Count(id) AS bad_loan_percentage FROM bank_loan_data
 
  -----Total Bad Application Number
 Select  COUNT(id) as Bad_Loan_Application 	FROM bank_loan_data
	WHERE loan_status = 'Charged off'

---------Bad Loan Funded Amount
Select SUM(loan_amount) as Bad_Loan_Funded_Amount FROM bank_loan_data
	Where loan_status = 'Charged off'

----------Bad Loan total Payment Received
Select SUM(total_payment) As Bad_Loan_Received_Amount From bank_loan_data
	where loan_status = 'Charged off'

-----------------------------------------------------LOAN STATUS---------------------
Select loan_status, 
		COUNT(id) as Total_Loan_Applications,
		SUM(total_payment) as Total_Amount_recieved,
		SUM(loan_amount) as Total_Funded_Amount,
		AVG(int_rate * 100) AS Interest_Rate,
		AVG(dti * 100) AS DTI

	From bank_loan_data
	Group by loan_status
-------------------------- MTD LOAN STATUS
Select loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
	FROM bank_loan_data
	WHERE MONTH(issue_date) = 12 
	GROUP BY loan_status

-------------------------- DASHBOARD 2 OVERVIEW
--------MONTHLY TRENDS BY ISSUE DATE - LINE CHART

SELECT 
		MONTH(issue_date) AS Month_Number,
		DATENAME(MONTH, issue_date) AS Month_Name,
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) as Total_Received_Amount
		from bank_loan_data
		GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
		order BY MONTH(issue_date)

--------------------Regional Analysis by state

select 
		address_state,
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) as Total_Received_Amount
		from bank_loan_data
		GROUP BY address_state
		order BY address_state

------------------------Loan term Analysis
Select
		term, 
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) as Total_Received_Amount
		from bank_loan_data
		GROUP BY term
		order BY term

------------ employee Name

Select emp_length,
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) as Total_Received_Amount
		from bank_loan_data
		GROUP BY emp_length
		order BY COUNT(id) DESC
		
--------------Loan Purpose Breakdown
Select purpose,
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) as Total_Received_Amount
		from bank_loan_data
		GROUP BY purpose
		order BY purpose

---------HOME OWNERSHIP ANALYSIS 
Select home_ownership,
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) as Total_Received_Amount
		from bank_loan_data
		WHERE grade = 'A'
		GROUP BY home_ownership
		order BY COUNT(id) DESC

