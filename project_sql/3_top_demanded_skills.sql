/*
What are the unique skills that serve as a requirement for a Data Scientist:
-Uses inner join to attach info about job postings with data about skills(similar to query 2).
-Identify the top five skills that are desirable/essential.
-Focus on all postings of the job.
-Thus providing info on the best skills in the industry(High demand).
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short='Data Scientist' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5