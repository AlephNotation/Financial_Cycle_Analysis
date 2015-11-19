/*Delimit Command Tells Stata that Each Command ends with a Semicolon*/

# delimit ;

/*Set more off tells Stata to Print All Output at Once*/

set more off;

do Debt_analysis;
do Investment_analysis;
do Growth_analysis;

