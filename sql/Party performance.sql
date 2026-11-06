use lok_sabha_analysis;  
WITH total_votes_cast AS (
    SELECT year, SUM(VOTES) AS total_votes
    FROM lok_sabha
    GROUP BY year
),
seats AS (
    SELECT year, party, COUNT(*) AS seats_won
    FROM lok_sabha
    WHERE result_position IN ('winner 1', 'winner 2', 'winner')
    GROUP BY year, party
),
total as(
    select year,sum( number_of_seats) as totalseats
  FROM (
        SELECT DISTINCT
            year,
            state_ut,
            constituency_no,
            constituency_name,
            number_of_seats
        FROM lok_sabha
    ) AS distinct_constituencies
    GROUP BY year
)
SELECT
    l.year,
    l.party,
    s.seats_won,
    SUM(l.VOTES) AS total_votes,
    ROUND(SUM(l.VOTES) / tvc.total_votes * 100, 2) AS party_vote_pct,
    round(s.seats_won/totalseats *100,2) as party_seat_share
FROM lok_sabha l
JOIN seats s       ON l.year = s.year AND l.party = s.party
JOIN total_votes_cast tvc ON l.year = tvc.year
JOIN total t ON l.year = t.year
GROUP BY l.year, l.party, s.seats_won, tvc.total_votes
ORDER BY l.year, seats_won DESC;   