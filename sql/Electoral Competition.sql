USE lok_sabha_analysis;


-- =====================================================
-- 1. PREPARE CONSTITUENCY-LEVEL WINNING MARGIN DATA
-- =====================================================

WITH constituency_margin AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        MAX(margin_votes) AS margin_votes,
        MAX(margin_percent) AS margin_percent,
        MAX(number_of_seats) AS number_of_seats
    FROM lok_sabha
    GROUP BY
        year,
        state_ut,
        constituency_no,
        constituency_name
)
SELECT *
FROM constituency_margin
ORDER BY year, margin_percent;


-- =====================================================
-- 2. FIND THE 20 CLOSEST CONTESTS
-- =====================================================

WITH constituency_margin AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        MAX(margin_votes) AS margin_votes,
        MAX(margin_percent) AS margin_percent
    FROM lok_sabha
    GROUP BY
        year,
        state_ut,
        constituency_no,
        constituency_name
)
SELECT *
FROM constituency_margin
WHERE margin_percent IS NOT NULL
ORDER BY margin_percent ASC
LIMIT 20;


-- =====================================================
-- 3. FIND THE 20 LARGEST WINNING MARGINS
-- =====================================================

WITH constituency_margin AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        MAX(margin_votes) AS margin_votes,
        MAX(margin_percent) AS margin_percent
    FROM lok_sabha
    GROUP BY
        year,
        state_ut,
        constituency_no,
        constituency_name
)
SELECT *
FROM constituency_margin
WHERE margin_percent IS NOT NULL
ORDER BY margin_percent DESC
LIMIT 20;


-- =====================================================
-- 4. AVERAGE WINNING MARGIN BY ELECTION YEAR
-- =====================================================

WITH constituency_margin AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        MAX(margin_percent) AS margin_percent
    FROM lok_sabha
    GROUP BY
        year,
        state_ut,
        constituency_no,
        constituency_name
)
SELECT
    year,
    COUNT(*) AS total_constituencies,
    ROUND(AVG(margin_percent), 2) AS average_margin_percent,
    ROUND(MIN(margin_percent), 2) AS smallest_margin_percent,
    ROUND(MAX(margin_percent), 2) AS largest_margin_percent
FROM constituency_margin
WHERE margin_percent IS NOT NULL
GROUP BY year
ORDER BY year;


-- =====================================================
-- 5. COMPARE ELECTORAL COMPETITION ACROSS STATES
-- =====================================================

WITH constituency_margin AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        MAX(margin_percent) AS margin_percent
    FROM lok_sabha
    GROUP BY
        year,
        state_ut,
        constituency_no,
        constituency_name
)
SELECT
    state_ut,
    COUNT(*) AS total_constituencies,
    ROUND(AVG(margin_percent), 2) AS average_margin_percent
FROM constituency_margin
WHERE margin_percent IS NOT NULL
GROUP BY state_ut
ORDER BY average_margin_percent ASC;


-- =====================================================
-- 6. ANALYSE WINNING MARGINS BY PARTY
-- =====================================================

WITH party_wins AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        party,
        MAX(margin_percent) AS margin_percent
    FROM lok_sabha
    WHERE LOWER(TRIM(result_position))
        IN ('winner', 'winner 1', 'winner 2')
      AND party IS NOT NULL
      AND TRIM(party) <> ''
    GROUP BY
        year,
        state_ut,
        constituency_no,
        constituency_name,
        party
)
SELECT
    party,
    COUNT(*) AS constituency_wins,
    ROUND(AVG(margin_percent), 2) AS average_margin_percent
FROM party_wins
WHERE margin_percent IS NOT NULL
GROUP BY party
ORDER BY average_margin_percent DESC;


-- =====================================================
-- 7. CLASSIFY CLOSE CONTESTS AND COMFORTABLE WINS
-- =====================================================

WITH constituency_margin AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        MAX(margin_percent) AS margin_percent
    FROM lok_sabha
    GROUP BY
        year,
        state_ut,
        constituency_no,
        constituency_name
),
classified_contests AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        margin_percent,
        CASE
            WHEN margin_percent <= 1
                THEN 'Very close'
            WHEN margin_percent <= 2
                THEN 'Close'
            WHEN margin_percent <= 5
                THEN 'Competitive'
            ELSE 'Comfortable win'
        END AS contest_category
    FROM constituency_margin
    WHERE margin_percent IS NOT NULL
)
SELECT
    year,
    contest_category,
    COUNT(*) AS constituency_count
FROM classified_contests
GROUP BY year, contest_category
ORDER BY year, constituency_count DESC;


-- =====================================================
-- 8. CLOSE-CONTEST PERCENTAGE BY ELECTION YEAR
-- =====================================================

WITH constituency_margin AS (
    SELECT
        year,
        state_ut,
        constituency_no,
        constituency_name,
        MAX(margin_percent) AS margin_percent
    FROM lok_sabha
    GROUP BY
        year,
        state_ut,
        constituency_no,
        constituency_name
)
SELECT
    year,
    COUNT(*) AS total_constituencies,

    SUM(
        CASE
            WHEN margin_percent <= 2 THEN 1
            ELSE 0
        END
    ) AS close_contests,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN margin_percent <= 2 THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS close_contest_percentage

FROM constituency_margin
WHERE margin_percent IS NOT NULL
GROUP BY year
ORDER BY year;