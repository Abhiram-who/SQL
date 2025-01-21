/*
This query is to find the top paying data scientist jobs
-Incorporates top 10 highest paying roles.
-With specified salaries (while removing nulls). 
-Highlights the best oppurtunities
*/


SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short= 'Data Scientist' AND
    job_location= 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10