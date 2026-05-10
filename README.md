# Bank Loan Report Analysis (End-to-End Data Project)

## 📌 Project Overview
This project provides a comprehensive analysis of bank lending activities, designed to monitor loan portfolio health and assess financial risk. It serves as a strategic tool for stakeholders to distinguish between **Good Loans** and **Bad Loans** while tracking key performance indicators (KPIs) in real-time.

## 🎯 Objectives
* **Lending Health Monitoring:** Track total applications, funded amounts, and cash collection.
* **Risk Assessment:** Categorize loans into "Good" (Fully Paid/Current) vs. "Bad" (Charged Off) to evaluate portfolio quality.
* **Time-Series Tracking:** Analyze Month-to-Date (MTD) and Month-over-Month (MoM) growth to identify seasonal lending trends.
* **Operational Intelligence:** Provide a "Details Dashboard" for granular deep-dives into borrower profiles and Debt-to-Income (DTI) ratios.

## 🛠️ Tech Stack
* **SQL:** Used for data extraction, cleaning, and complex KPI verification (MTD, MoM, and Risk Metrics).
* **Power BI:** Developed an interactive 3-tier dashboard (Summary, Overview, and Details).
* **Excel:** Initial data exploration and formatting.

## 📊 Key Insights & Findings
* **Portfolio Quality:** Successfully automated the classification of "Bad Loans," allowing the bank to identify that [Insert % or insight, e.g., "Charged-off loans are most prevalent in Debt Consolidation categories"].
* **Regional Trends:** Identified high-performing lending states using geographic mapping, helping to optimize regional lending strategies.
* **Financial Integrity:** All Power BI visuals were cross-verified with custom SQL scripts to ensure 100% data accuracy.

## 📂 Repository Contents
* `SQL_Queries.sql`: Full source code for data validation and metric calculation.
* `Bank_Loan_Report.pbix`: Interactive Power BI file (Download to view data model and DAX measures).
