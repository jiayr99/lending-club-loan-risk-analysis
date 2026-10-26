-- Q1: Which loan grades carry the most default risk?
SELECT
  grade,
  COUNT(*) AS loans,
  ROUND(AVG(is_default) * 100, 2) AS default_rate_pct
FROM `lending-club-loan.lending_club.loans_enriched`
GROUP BY grade
ORDER BY grade;

-- Q2: Do interest rates reflect actual default risk by grade?
SELECT
  grade,
  ROUND(AVG(int_rate), 2) AS avg_interest_rate_pct,
  ROUND(AVG(is_default) * 100, 2) AS default_rate_pct,
  ROUND(AVG(net_return), 2) AS avg_net_return_per_loan
FROM `lending-club-loan.lending_club.loans_enriched`
GROUP BY grade
ORDER BY grade;

-- Q2b: Total net return and share of loans by grade
SELECT
  grade,
  COUNT(*) AS loans,
  ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (), 2) AS pct_of_loans,
  ROUND(SUM(net_return) / 1000000, 2) AS total_net_return_millions
FROM `lending-club-loan.lending_club.loans_enriched`
GROUP BY grade
ORDER BY grade;

-- Q2c: Default rate and return by grade and term
SELECT
  grade,
  term,
  COUNT(*) AS loans,
  ROUND(AVG(is_default) * 100, 2) AS default_rate_pct,
  ROUND(AVG(net_return), 2) AS avg_net_return
FROM `lending-club-loan.lending_club.loans_enriched`
GROUP BY grade, term
ORDER BY grade, term;

-- Q3: Which borrower segments are riskiest?
SELECT
  purpose,
  COUNT(*) AS loans,
  ROUND(AVG(is_default) * 100, 2) AS default_rate_pct,
  ROUND(SUM(net_return), 0) AS total_net_return
FROM `lending-club-loan.lending_club.loans_enriched`
GROUP BY purpose
HAVING COUNT(*) >= 1000
ORDER BY default_rate_pct DESC;

-- Q4: How has the portfolio changed by year?
SELECT
  issue_year,
  COUNT(*) AS loans,
  ROUND(SUM(loan_amnt) / 1000000, 1) AS loan_volume_millions,
  ROUND(AVG(loan_amnt), 0) AS avg_loan_size,
  ROUND(AVG(is_default) * 100, 2) AS default_rate_pct
FROM `lending-club-loan.lending_club.loans_enriched`
GROUP BY issue_year
ORDER BY issue_year;

-- Q5: Which states contribute most to returns and losses?
SELECT
  addr_state,
  COUNT(*) AS loans,
  ROUND(SUM(loan_amnt) / 1000000, 1) AS loan_volume_millions,
  ROUND(AVG(is_default) * 100, 2) AS default_rate_pct,
  ROUND(SUM(net_return) / 1000000, 2) AS net_return_millions,
  RANK() OVER (ORDER BY SUM(net_return) DESC) AS return_rank
FROM `lending-club-loan.lending_club.loans_enriched`
GROUP BY addr_state
ORDER BY return_rank;