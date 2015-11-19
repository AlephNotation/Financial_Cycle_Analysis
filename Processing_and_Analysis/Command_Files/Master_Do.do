/*Delimit Command Tells Stata that Each Command ends with a Semicolon*/

# delimit ;

/*Set more off tells Stata to Print All Output at Once*/

set more off;
clear all;
/* We begin by importing out aggregated data. The raw data sets are contained in 
the Originial Data folder. The instructions for constructing this file can also
be found here.*/
cd C:\Users\tdaly\Desktop\TDaly_Paper\Processing_and_Analysis\Command_Files;
do Data_Import;

*Now we will tell Stata our data is time series
tsset time;


/* We will now process our imported data.*/
do Processing;

do Analysis;
