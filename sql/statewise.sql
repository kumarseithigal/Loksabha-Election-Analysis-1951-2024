use lok_sabha_analysis;
WITH state_total_seats AS
(
    SELECT
        year,
        state_ut,
        SUM(number_of_seats) AS total_state_seats
    FROM (
        SELECT DISTINCT year, state_ut, constituency_no, constituency_name, number_of_seats
        FROM lok_sabha
    ) t
    GROUP BY year, state_ut
)
SELECT
    l.year,
    l.state_ut,
        s.total_state_seats,
    l.party,
    COUNT(*) AS seats_won
FROM lok_sabha l
JOIN state_total_seats s
    ON l.year = s.year 
    AND l.state_ut = s.state_ut
where l.result_position IN ('winner', 'winner 1', 'winner 2')
GROUP BY
    l.year,
    l.state_ut,
    l.party,
    s.total_state_seats
ORDER BY
    l.year ,
    l.state_ut,
    seats_won DESC;

SELECT
    year,
    party,
    COUNT(DISTINCT state_ut) AS states_won_in
FROM lok_sabha
WHERE LOWER(TRIM(result_position)) IN
      ('winner', 'winner 1', 'winner 2')
  AND party IS NOT NULL
  AND TRIM(party) <> ''
GROUP BY
    year,
    party
ORDER BY
    year,
    states_won_in DESC;