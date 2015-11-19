/*Delimit Command Tells Stata that Each Command ends with a Semicolon*/

# delimit ;

/*Set more off tells Stata to Print All Output at Once*/

set more off;
tsset time;

/*Now we will create the variable responsible for the growth of debt.
We begin by creating an endogenous interest rate variable.*/
gen r_and_interest =(1 + avg_interest)*(1 + d.inflation) -1;
gen end_interest = max( r_and_interest,0);
gen debt_multi = (1 + d.end_interest) / ( d.growth * ( 1 + d.inflation) );
gen past_debt = debt_multi * d.int_debt;

/*Then we generate i_t over growth*/
gen inv_over_growth = d.int_inv / d.growth;

/*And then the debt payment per period.*/
gen debt_pay = wage_share* -1;

/*Now we can begin to analyze our data.*/

varsoc int_debt, ex( past_debt inv_over_growth debt_pay);

