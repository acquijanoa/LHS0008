

PROC FORMAT;
	value child_sex_fmt
	1 = 'Male' 
	0 = 'Female'
	;
	value alive_fmt
	0 = 'Dead'
	1 = 'Alive';
RUN;
