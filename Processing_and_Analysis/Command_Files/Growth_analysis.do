/*Delimit Command Tells Stata that Each Command ends with a Semicolon*/

# delimit ;

/*Set more off tells Stata to Print All Output at Once*/

set more off;
tsset time;

varsoc growth, ex(int_inv);
