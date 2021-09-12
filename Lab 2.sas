
*method 1;
FILENAME REFFILE 
	'/home/u59248883/BUMK726 - Statistical Programming/Ketchup.xlsx';

PROC IMPORT DATAFILE=REFFILE DBMS=XLSX OUT=WORK.KETCHUP;
	GETNAMES=YES;
RUN;

*method 2;
libname MYDATA '/home/u59248883/BUMK726 - Statistical Programming';

*Create dataset ketchup in work library;
data work.ketchup;
	set mydata.ketchup2;
run;

*Part3;
data ketchup3;
 set ketchup;
 PriceDiff=PrHeinz-PrHunts;
 logPrHeinz=log(PrHeinz);
run;

*creating mean for ketchup3;
proc means data = ketchup3;
run;

*recode "999" value into missing "." means missing in SAS;
data ketchup3;
 set ketchup3;
 if PrDMonte=999   then   PrDMonte = . ;
run;
proc means data = ketchup3;
run;

*recoding string variable to numeric variable;
data ketchup3;
 set ketchup3;
 if gender='F' then female=1;
 if gender='M' then female=0;
 run;

PROC MEANS DATA=ketchup3; 
RUN;

*date statement;
 data ketchup3;
  set ketchup3;
  PurchaseDate=mdy(month, day, year);
  format PurchaseDate MMDDYY10.;
  ReturnDate = PurchaseDate+180;
 format ReturnDate MMDDYY10.;
 run;

*create subset of dataset;
data FemaleCustomers;
 set ketchup;
 if gender='F';
 keep CustID gender  Choice;
run;
