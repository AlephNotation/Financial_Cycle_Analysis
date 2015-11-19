/*Delimit Command Tells Stata that Each Command ends with a Semicolon*/

# delimit ;

/*Set more off tells Stata to Print All Output at Once*/

set more off;
tsset time;

gen nonwage_grow = wage_share * growth;
gen inv_debtpay = end_interest * int_debt;
gen inv_realdebtpay = inv_debtpay / (-1 + inflation);

varsoc int_inv, ex(growth nonwage_grow inv_realdebtpay) ;
