-- How many candidates contested in each Lok Sabha election? note:since in the dataset it has winner and runner not all contested candiadates will be there
use lok_sabha_analysis;
SELECT
    year,
    COUNT(*) AS total_candidate_records
FROM lok_sabha
GROUP BY year;
-- Number of unique political parties in each election
SELECT
    year,
    COUNT(DISTINCT party) AS total_parties
FROM lok_sabha
group by year;
-- Number of constituencies in each election
SELECT
     year,
     COUNT(distinct state_ut,constituency_name) as total_consituency
 FROM lok_sabha 
 group by year;

 