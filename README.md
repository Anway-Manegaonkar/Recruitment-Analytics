# Recruitment-Analytics
Data Analytics Project showcasing Recruitment Funnel and Hiring Performance using SQL and Power BI.

Overview
This project analyzes an organization’s **recruitment funnel and hiring performance** using SQL Server and Power BI.
It aims to uncover insights, such as which recruitment sources perform best, which roles take longer to fill, and the efficiency of recruiters.
The project demonstrates **data cleaning, SQL analysis, visualization, and storytelling** through an interactive Power BI dashboard.

Dataset
The dataset contains multiple relational tables representing a real-world recruitment process:
- candidates – Candidate details like name, gender, education, and application date
- applications – Application-level data, including recruiter, department, and source
- departments – Department names and IDs
- recruiters – Recruiter information and experience
- hiring_sources – Source platforms (e.g., LinkedIn, Naukri, Referral)
- interview_stages – Interview progress of each candidate
- offers – Details about offers made, accepted, or joined

Tools & Technologies Used
- SQL Server – For data cleaning, transformation, and analysis
- Power BI – For data visualization and dashboard creation
- Gamma (AI Presentation Tool) – For preparing the final project presentation
- Excel / CSV – For initial data storage and import
- DAX – For calculated measures and KPIs in Power BI

Steps Followed:
1. Data Loading & Preparation:
- Imported the dataset into **SQL Server**.
- Verified data integrity, column types, and relationships.
- Cleaned missing and inconsistent values using SQL queries.

2. Data Cleaning in SQL:
- Removed nulls and duplicate records.
- Standardized categorical fields (e.g., Offer_Status, Source_Name).
- Created joins between tables to build a structured relational model.
- Wrote SQL queries for initial metrics like total offers, accepted offers, and average hiring time.

3. Data Modelling:
Established relationships in Power BI (1:M, single direction):
candidates[Candidate_ID] → applications[Candidate_ID]
applications[Recruiter_ID] → recruiters[Recruiter_ID]
applications[Department_ID] → departments[Department_ID]
applications[Source_ID] → hiring_sources[Source_ID]
candidates[Candidate_ID] → interview_stages[Candidate_ID]
candidates[Candidate_ID] → offers[Candidate_ID]

4. DAX Measures Created:
-  Total Offers Made
-  Total Accepted Offers
-  Total Joined Candidates
-  Offer Acceptance %
-  Offer to Join %
-  Average Time to Hire (Days)

5. Power BI Dashboard Development:
Built two interactive dashboards:
1. Recruitment Funnel & Hiring Performance
   -  Visuals: Cards, clustered bar chart, and column chart
   -  KPIs: Offers Made, Offers Accepted, Joined, Offer % Metrics
   -  Filters: Gender, Recruiter, Source, and Stage

2. Recruitment Insights & Trends
   - Visuals: Line and bar charts
   -  KPIs: Avg. Hiring Days, Total Recruiters, Job Sources
   -  Trends: Time-to-Hire by Month, Role, and Recruiter

6. Reporting & Presentation
-  Exported insights into a professional report (PDF).
-  Created a summary presentation using Gamma** to explain objectives, methods, insights, and outcomes.

Key Insights & Results
-  Best Source: Naukri and Company Website brought the highest number of successful joins.
-  Fastest Role to Hire: Data Analyst roles took the least time to close.
-  Top Recruiter: Recruiter_5 achieved the most hires and the shortest average time-to-hire.
-  Hiring Trend: Hiring speed improved mid-year but slowed in December.
-  Offer-to-Join Rate: 83.33% overall conversion from accepted offers to actual joins.

Deliverables
- SQL Queries for Data Cleaning and Analysis
-  Power BI Dashboard File (`.pbix`)
-  Project Report (`.pdf`)
-  Presentation Deck (Created in Gamma)

Skills Demonstrated
- Data Cleaning and Transformation (SQL)
- Data Modeling (Star Schema)
- DAX Calculations
- Power BI Dashboard Design
- Analytical Storytelling & Presentation Skills

