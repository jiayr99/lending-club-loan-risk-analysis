# Cleaning Log

| Step | What I did | Why | Rows before | Rows after |
|---|---|---|---|---|
| 1 | Loaded 19 selected columns | Relevant to business questions | n/a | 2,260,668 |
| 2 | Kept only Fully Paid, Charged Off, Default | Only resolved loans have a known outcome | 2,260,668 | 1,303,638 |
| 3 | Converted term, issue_d | Needed numbers and dates | 1,303,638 | 1,303,638 |
| 4 | Dropped id and replaced with loan_key | id fields were all empty | 1,303,638 | 1,303,638 |
| 5 | Filled emp_length missing with "Unknown" | Keep rows, flag unknown | 1,303,638 | 1,303,638 |
| 6 | Removed dti < 0 or > 100, income <= 0 | Impossible values | 1,303,638 | 1,302,858 |
| 7 | Created is_default and issue_year | For analysis | 1,302,858 | 1,302,858 |