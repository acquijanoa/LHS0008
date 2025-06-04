* set macrovariables; 
%let homepath = J:\HCHS\STATISTICS\GRAS\QAngarita\LHS\LHS0008;
%let job = lhs000899;
%let subjob = lhs00089902;

* log and print files;
proc printto log = "&homepath./scripts/&job./&subjob._&sysdate..log"
	print = "&homepath./scripts/&job./&subjob._&sysdate..lst" new;
run;

/*
	
	Program: LHS00089902.sas

	Description: Produce the missing data report for the dhs 2015 
				child_recode dataset
	
	Programmer: Alvaro Quijano-Angarita

	Date: 15may25

	Version:
				04jun25: Create the file


*/
options mprint;

* include SAS code for formats and macros;
%include "&homepath./scripts/lhs000891/lhs0008_missing_report.sas";

* set libraries;
libname raw "&homepath./data/raw" access=readonly;
run;

* define macro variables;
%let prg = AQA;

* Create the missing data report;
%missing_report(data = raw.children, 
					outpath = &homepath./scripts/&job./,
					outname = &subjob._children_recode_missing.rtf);

* births;
 %missing_report(data = raw.births,
                    outpath = &homepath./scripts/&job./,
                    outname = &subjob._births_missing.rtf);


proc printto; run;
