-- Task 1: Display first 20 records
SELECT *
FROM lok_sabha
LIMIT 20;


-- Task 2: Display first 10 records
SELECT *
FROM lok_sabha
LIMIT 10;


SELECT
    year AS Election_Year,
    constituency_name AS Constituency,
    candidate AS Candidate_Name,
    votes AS Votes_Received
FROM lok_sabha
LIMIT 20;