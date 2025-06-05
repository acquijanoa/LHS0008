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
	keep psu stratum wmweight alive child_sex ethnicity urban hh7 birthint magebrt;

	* rename variables;
	rename stratum = strata;
		
	* derive variables;
	alive = (bh5=1);
	label alive = "Child is live";

	* child_sex;
	child_sex = (bh3 = 1);
	label child_sex = "Child's sex"; 

	* urban ;
	urban = (hh6 = 1);
	label urban = "Urban area";

	* region;
	rename hh7 = region;
	label hh7 = 'Region of residence';

	* Set labels;
	label ethnicity = "Ethnicity";
run;

proc surveyfreq data = derv.&job._&sysdate.;
	cluster psu;
	strata strata;
	weight wmweight;
	table alive * child_sex alive * ethnicity alive * urban alive * region alive * magebrt / chisq col;
	format child_sex child_sex_fmt. alive alive_fmt. ethnicity ethnicity_fmt. 
			urban urban_fmt. region region_fmt. magebrt magebrt_fmt. ;
run;


proc printto; run;
