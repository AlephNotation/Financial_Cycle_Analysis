/*Delimit Command Tells Stata that Each Command ends with a Semicolon*/

# delimit ;

/*Set more off tells Stata to Print All Output at Once*/

set more off;
tsset time;

/*This file will serve to create the variables needed for our regressions. 
Actions will be explained by comments within the code itself, but for a 
more complete understanding of our motivations, please consult the 
accompanying paper.*/

/*Our regression is modelled in the intensive form, so must put our variables
in their intensive forms.*/
gen growth = 1 + (gdp / d.gdp ) ;
gen int_debt =  allsectorliabilites / d.gdp;
gen int_inv = investment / d.gdp;

/*Now we will find the share GDP which goes to wages, and generate its convex
form.*/
gen wage_percent = d.nominalwages / d.gdp;
gen wage_share   = 1 - wage_percent;


/*The following commands compute our endogenous inflation variable.*/
gen wage_inf = nominalwages / d.nominalwages;
gen inflation = ((1 +wage_inf)/ (1 + avg_productivity))-1;

gen inflation_alt = ((1 + wage_inf)/ (1 + productivity))-1;


