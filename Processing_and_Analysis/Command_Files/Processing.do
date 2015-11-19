/*Delimit Command Tells Stata that Each Command ends with a Semicolon*/

# delimit ;

/*Set more off tells Stata to Print All Output at Once*/

set more off;
tsset time;
/*We will begin by taking the natural log of both real GDP and expected real GDP.*/
gen Log_gdp = ln(gdp);
gen Log_egdp = ln(egdp);

/*Next we test for a unit root in both Log_gdp and Log_egdp. First we use c*/
varsoc Log_gdp;
varsoc Log_egdp;

dfuller Log_gdp, lags(3) trend;
dfuller Log_egdp, lags(3) trend;

gen dLog_gdp = d.Log_gdp;
gen dLog_egdp = d.Log_egdp;

/*We then repeat this step again.*/
dfuller dLog_gdp, lags(3) trend;
dfuller dLog_egdp, lags(3) trend;

/*dLog_gdp passes, but dLog_egdp fails, so we difference again.*/
gen d2Log_egdp = d.dLog_egdp;
dfuller d2Log_egdp, lags(3) trend;
/*d2Log_egdp passes, so we terminate our differencing.*/


/*The following is the transformation for nominalwages. This follows our previous
transformations of log_gdp and log_egdp.*/
gen Log_nomwage = ln(nominalwages);

varsoc Log_nomwage;
dfuller Log_nomwage, lags(3) trend;
gen dLog_nomwage = d.Log_nomwage;
dfuller dLog_nomwage, lags(3) trend;
gen d2Log_nomwage = d.dLog_nomwage;
dfuller d2Log_nomwage, lags(3) trend;

/*Now we tranform log_cpi.*/
gen Log_cpi = 	ln(cpi);

varsoc Log_cpi;
dfuller Log_cpi, lags(1) trend;

/*We are able to reject, and so do not difference.*/

/*Our final series of logs pertains to debt levels. We take the natural logs of both
Outstanding US mortgage debt and Non-Financial sector Liabilites. We then create a
new variable called "other debt" which is designed to capture other forms of debt.*/

gen Log_mortgage = ln(mortgagedebt);
varsoc Log_mortgage, maxlag(10);

dfuller Log_mortgage, lags(4) trend;
gen dLog_mortgage = d.Log_mortgage;
dfuller dLog_mortgage, lags(4) trend;
gen d2Log_mortgage = d.dLog_mortgage;
dfuller d2Log_mortgage, lags(4) trend;

gen Log_NFSL = ln(nonfinancialsectorliablities);
varsoc Log_NFSL;
dfuller Log_NFSL, lags(3) trend;
gen dLog_NFSL = d.Log_NFSL;
dfuller dLog_NFSL, lags(3) trend;
gen d2Log_NFSL = d.dLog_NFSL;
dfuller d2Log_NFSL, lags(3) trend;

gen other_debt =  allsectorliabilites - nonfinancialsectorliablities - mortgagedebt;
gen Log_other_debt = ln(other_debt);
varsoc Log_other_debt;
dfuller Log_other_debt, lags(3) trend;
gen dLog_other_debt = d.Log_other_debt;
dfuller dLog_other_debt, lags(3) trend;
gen d2Log_other_debt = d.dLog_other_debt;
dfuller d2Log_other_debt, lags(3) trend;


gen log_gov = ln(gov);
varsoc log_gov, m(10);
dfuller log_gov, lags(5) trend;
gen dlog_gov = d.log_gov;
dfuller dlog_gov, lags(5) trend;
gen d2log_gov = d.dlog_gov;
dfuller d2log_gov, lags(5) trend;
