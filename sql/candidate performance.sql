USE lok_sabha_analysis;

WITH ranked_candidates AS (
    SELECT
        year,
        state_ut,
        constituency_name,
        candidate,
        party,
        votes,
        RANK() OVER (
            PARTITION BY year
            ORDER BY votes DESC
        ) AS vote_rank
    FROM lok_sabha
)
SELECT
    year,
    state_ut,
    constituency_name,
    candidate,
    party,
    votes
FROM ranked_candidates
WHERE vote_rank = 1
ORDER BY year;

with constituency_results AS (
    SELECT DISTINCT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        margin_votes,
        margin_percent
    FROM lok_sabha
)

SELECT
    year,
    state_ut,
    constituency_name,
    margin_votes,
    margin_percent
FROM constituency_results
ORDER BY margin_votes DESC
LIMIT 20;

SELECT
    candidate,
    COUNT(DISTINCT year) AS elections_contested,
    MIN(year) AS first_election,
    MAX(year) AS last_election
FROM lok_sabha
GROUP BY candidate
HAVING COUNT(DISTINCT year) > 1
ORDER BY elections_contested DESC, candidate;

SELECT
    candidate,
    COUNT(DISTINCT year) AS elections_contested,
    COUNT(DISTINCT party) AS different_parties,
    GROUP_CONCAT(
        DISTINCT CONCAT(year, ' - ', party)
        ORDER BY year
        SEPARATOR ' | '
    ) AS election_history
FROM lok_sabha
GROUP BY candidate
HAVING COUNT(DISTINCT party) > 1
ORDER BY different_parties DESC, elections_contested DESC;