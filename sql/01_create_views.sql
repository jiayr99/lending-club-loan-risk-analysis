CREATE OR REPLACE VIEW `lending-club-loan.lending_club.loans_enriched` AS
SELECT
  *,
  DATE(issue_d) AS issue_date,
  CASE
    WHEN annual_inc < 40000  THEN '1: Under 40k'
    WHEN annual_inc < 80000  THEN '2: 40k to 80k'
    WHEN annual_inc < 120000 THEN '3: 80k to 120k'
    ELSE '4: 120k and above'
  END AS income_band,
  total_rec_int + total_rec_prncp - funded_amnt AS net_return
FROM `lending-club-loan.lending_club.loans_clean`;