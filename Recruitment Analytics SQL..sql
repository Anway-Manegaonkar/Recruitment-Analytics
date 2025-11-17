-- Recruitment Analytics Project :

-- Creating Database :
CREATE DATABASE RecruitmentAnalyticsDB;
GO

-- Using Database :
USE RecruitmentAnalyticsDB;
GO

-- Verifying The Data :
SELECT COUNT(*) AS Total_Rows, 'departments' AS Table_Name FROM departments
UNION ALL
SELECT COUNT(*), 'hiring_sources' FROM hiring_sources
UNION ALL
SELECT COUNT(*), 'recruiters' FROM recruiters
UNION ALL
SELECT COUNT(*), 'candidates' FROM candidates
UNION ALL
SELECT COUNT(*), 'applications' FROM applications
UNION ALL
SELECT COUNT(*), 'interview_stages' FROM interview_stages
UNION ALL
SELECT COUNT(*), 'offers' FROM offers;

-- Creating Views for Analysis :

-- View 1: Full Candidate Journey :
CREATE VIEW vw_candidate_journey AS
SELECT 
    c.Candidate_ID,
    c.Candidate_Name,
    c.Gender,
    c.Education,
    c.Experience_Years,
    d.Department_Name,
    r.Recruiter_Name,
    hs.Source_Name,
    a.Job_Role,
    i.Stage_Name,
    i.Stage_Date,
    o.Offer_Status,
    o.Offered_Salary
FROM candidates c
LEFT JOIN applications a ON c.Candidate_ID = a.Candidate_ID
LEFT JOIN departments d ON a.Department_ID = d.Department_ID
LEFT JOIN recruiters r ON a.Recruiter_ID = r.Recruiter_ID
LEFT JOIN hiring_sources hs ON a.Source_ID = hs.Source_ID
LEFT JOIN interview_stages i ON c.Candidate_ID = i.Candidate_ID
LEFT JOIN offers o ON c.Candidate_ID = o.Candidate_ID;

SELECT * FROM vw_candidate_journey;

-- Key Business KPI's :

-- Total Candidates Per Stage :
SELECT Stage_Name, COUNT(DISTINCT Candidate_ID) AS Candidate_Count
FROM interview_stages
GROUP BY Stage_Name
ORDER BY 
    CASE Stage_Name
        WHEN 'Applied' THEN 1
        WHEN 'Screened' THEN 2
        WHEN 'Technical' THEN 3
        WHEN 'HR' THEN 4
        WHEN 'Final' THEN 5
        WHEN 'Offer' THEN 6
        WHEN 'Joined' THEN 7
    END;

-- Offer-to-Join Conversion Rate :
SELECT 
    COUNT(CASE WHEN Offer_Status = 'Accepted' THEN 1 END) * 100.0 /
    COUNT(*) AS Offer_to_Join_Percentage
FROM offers;

-- Average Offered Salary by Department :
SELECT d.Department_Name, AVG(o.Offered_Salary) AS Avg_Offered_Salary
FROM offers o
JOIN applications a ON o.Candidate_ID = a.Candidate_ID
JOIN departments d ON a.Department_ID = d.Department_ID
GROUP BY d.Department_Name
ORDER BY Avg_Offered_Salary DESC;

-- Candidates by Source :
SELECT hs.Source_Name, COUNT(a.Candidate_ID) AS Total_Candidates
FROM applications a
JOIN hiring_sources hs ON a.Source_ID = hs.Source_ID
GROUP BY hs.Source_Name
ORDER BY Total_Candidates DESC;

-- Recruiter Performance (Offers Made) :
SELECT r.Recruiter_Name, COUNT(o.Offer_ID) AS Offers_Made
FROM offers o
JOIN applications a ON o.Candidate_ID = a.Candidate_ID
JOIN recruiters r ON a.Recruiter_ID = r.Recruiter_ID
GROUP BY r.Recruiter_Name
ORDER BY Offers_Made DESC;

SELECT 
    COUNT(*) AS Total_Accepted_Offers
FROM offers
WHERE Offer_Status = 'Accepted';

SELECT 
    a.Recruiter_ID,
    COUNT(o.Offer_ID) AS Total_Accepted_Offers
FROM offers AS o
JOIN applications AS a
    ON o.Candidate_ID = a.Candidate_ID
WHERE o.Offer_Status = 'Accepted'
GROUP BY a.Recruiter_ID
ORDER BY Total_Accepted_Offers DESC;
















