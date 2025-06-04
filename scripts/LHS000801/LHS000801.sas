* set the homepath;
%let homepath = J:\HCHS\STATISTICS\GRAS\QAngarita\LHS\LHS0008\;
%let job = LHS000801;

/***********************************

	Program: LHS000801.sas

	Author: Alvaro Quijano

	Date : 04jun25

************************************/
options mprint;

proc printto log = "&homepath./scripts/&job./&job._&sysdate..log" 
	print = "&homepath./scripts/&job./&job._&sysdate..lst"  new;
run;

* load libraries;
libname raw "&homepath./data/raw";

* import the spss data file;
%macro import_sav(db_in=, db_out=);
	proc import
	  out= raw.&db_out.      
	  datafile="&homepath./data/raw/&db_in..sav" 
	  dbms=sav                
	  replace;
	run;
%mend import_sav;

* run the macro to import and save the sav files;
%import_sav(db_in=ch, db_out=children);
%import_sav(db_in=bh, db_out=births);

proc printto; run;
