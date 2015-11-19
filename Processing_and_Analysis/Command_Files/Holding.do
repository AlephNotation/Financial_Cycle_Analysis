gen log_gdp = ln(gdp);
lab var log_gdp "Log GDP";

gen log_egdp = ln(egdp);
lab var log_egdp "Log E[GDP]";

gen log_td = ln(allsectorliabilites);
lab var log_td "Log Debt";

gen log_inv = ln(investment);
lab var log_inv "Log Investment";

tsline log_gdp log_egdp, title("Log of GDP and Expected GDP") subtitle("Q1 1980 - Q2 2014");
graph export C:\Users\tdaly\Desktop\TDaly_Paper\Original_Data_and_Supporting_Information\Supporting_Information\ProcessingGraphs\Log_GDPs.png, replace;

tsline log_td log_inv, title("Log of Total Debt and Log of Total Gross Domestic Investment") subtitle("Q1 1980 - Q2 2014");
graph export C:\Users\tdaly\Desktop\TDaly_Paper\Original_Data_and_Supporting_Information\Supporting_Information\ProcessingGraphs\Log_Inv_and_Debt.png, replace;
