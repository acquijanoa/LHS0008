* set the homepath;
%let homepath = J:\HCHS\STATISTICS\GRAS\QAngarita\LHS\LHS0008\;
%let job = LHS000802;

*proc printto log = "&homepath./scripts/&job./&job._&sysdate..log" 
	print = "&homepath./scripts/&job./&job._&sysdate..lst"  new;
run;

/***********************************

	Program: LHS000802.sas

	Description: 

	Author: Alvaro Quijano

	Date : 04jun25

************************************/
options mprint;

* load libraries;
libname raw "&homepath./data/raw";
libname derv "&homepath./data/derived";

* include file;
%include "&homepath./scripts/LHS000890/LHS000890.sas";

* Derived dataset;
data derv.&job._&sysdate.;
	set raw.births;
	format _all_;

	* keep the variables;
	keep psu stratum wmweight alive child_sex;

	* rename variables;
	rename stratum = strata;
		
	* derive variables;
	alive = (bh5=1);
	label alive = "Child is live";

	child_sex = (bh3 = 1);
	label child_sex = "Child's sex"; 

	
run;

proc surveyfreq data = derv.&job._&sysdate.;
	cluster psu;
	strata strata;
	weight wmweight;
	table alive * child_sex  / chisq;
	format child_sex child_sex_fmt.;
run;

proc printto; run;
