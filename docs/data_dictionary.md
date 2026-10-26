# Data Dictionary

| LoanStat | Description |
|---|---|
| `addr_state` | The state provided by the borrower in the loan application
| `annual_inc` | The self-reported annual income provided by the borrower during registration
| `dti` | A ratio calculated using the borrower’s total monthly debt payments on the total debt obligations, excluding mortgage and the requested LC loan, divided by the borrower’s self-reported monthly income
| `emp_length` | Employment length in years. Possible values are between 0 and 10 where 0 means less than one year and 10 means ten or more years
| `funded_amnt` | The total amount committed to that loan at that point in time
| `grade` | LC assigned loan grade
| `home_ownership` | The home ownership status provided by the borrower during registration or obtained from the credit report. Our values are: RENT, OWN, MORTGAGE, OTHER
| `installment` | The monthly payment owed by the borrower if the loan originates
| `int_rate` | Interest Rate on the loan
| `is_default` | 1 if loan_status is “Charged Off” or “Default”, 0 if “Fully Paid”
| `issue_d` | The month which the loan was funded
| `issue_year` | The year extracted from issue_d
| `loan_amnt` | The listed amount of the loan applied for by the borrower. If at some point in time, the credit department reduces the loan amount, then it will be reflected in this value
| `loan_key` | A unique LC assigned ID for the loan listing
| `loan_status` | Current status of the loan
| `purpose` | A category provided by the borrower for the loan request
| `sub_grade` | LC assigned loan subgrade
| `term` | The number of payments on the loan. Values are in months and can be either 36 or 60
| `total_rec_int` | Interest received to date
| `total_rec_prncp` | Principal received to date
| `verification_status` | Indicates if income was verified by LC, not verified, or if the income source was verified